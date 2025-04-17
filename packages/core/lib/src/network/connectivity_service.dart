import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/src/log/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_service.g.dart';

/// Network connection status
enum NetworkStatus {
  /// Device connected to the internet
  connected,

  /// Device not connected to the internet
  disconnected,

  /// Connection status being determined
  determining,
}

/// Service responsible for monitoring network connectivity status
class ConnectivityService {
  /// Constructor
  ConnectivityService({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;
  final _networkStatusController = StreamController<NetworkStatus>.broadcast();

  /// Stream of network status updates
  Stream<NetworkStatus> get statusStream => _networkStatusController.stream;

  /// Current network status
  NetworkStatus _status = NetworkStatus.determining;

  /// Current network status
  NetworkStatus get status => _status;

  /// Initialize connectivity monitoring
  Future<void> initialize() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateStatus(result);
      _subscription = _connectivity.onConnectivityChanged.listen(_updateStatus);
    } catch (e) {
      CoreLogger.error('Failed to initialize ConnectivityService', e);
      _updateStatus(ConnectivityResult.none);
    }
  }

  void _updateStatus(ConnectivityResult result) {
    final isConnected = result != ConnectivityResult.none;
    _status =
        isConnected ? NetworkStatus.connected : NetworkStatus.disconnected;
    _networkStatusController.add(_status);
  }

  /// Dispose resources
  void dispose() {
    _subscription?.cancel();
    _networkStatusController.close();
  }
}

/// Provides the ConnectivityService instance
@Riverpod(keepAlive: true)
ConnectivityService connectivityService(ConnectivityServiceRef ref) {
  final service = ConnectivityService();
  service.initialize();

  ref.onDispose(service.dispose);

  return service;
}

/// Provides the current network status
@Riverpod(keepAlive: true)
Stream<NetworkStatus> networkStatus(NetworkStatusRef ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.statusStream;
}

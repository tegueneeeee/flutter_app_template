import 'package:features_remote_config/src/domain/entities/platform_versions_requirements.dart';
import 'package:shared_dependencies/dependencies.dart';

class RemoteConfig extends Equatable {
  const RemoteConfig({
    required this.maintenance,
    required this.platformVersionsRequirements,
    required this.iosStoreUrl,
    required this.androidStoreUrl,
  });

  final bool maintenance;
  final PlatformVersionsRequirements platformVersionsRequirements;
  final String iosStoreUrl;
  final String androidStoreUrl;

  @override
  List<Object?> get props => [
    maintenance,
    platformVersionsRequirements,
    iosStoreUrl,
    androidStoreUrl,
  ];
}

import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

class VersionRequirements extends Equatable {
  const VersionRequirements({
    required this.minVersion,
    required this.targetVersion,
  });

  final Version minVersion;
  final Version targetVersion;

  @override
  List<Object?> get props => [minVersion, targetVersion];
}

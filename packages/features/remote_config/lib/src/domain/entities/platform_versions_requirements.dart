import 'package:features_remote_config/src/domain/entities/version_requirements.dart';
import 'package:shared_dependencies/dependencies.dart';

class PlatformVersionsRequirements extends Equatable {
  const PlatformVersionsRequirements({
    required this.ios,
    required this.android,
  });

  final VersionRequirements ios;
  final VersionRequirements android;

  @override
  List<Object?> get props => [ios, android];
}

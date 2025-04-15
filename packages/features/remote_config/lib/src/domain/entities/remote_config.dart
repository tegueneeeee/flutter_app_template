import 'package:features_remote_config/src/domain/entities/platform_versions_requirements.dart';
import 'package:shared_dependencies/dependencies.dart';

class RemoteConfig extends Equatable {
  const RemoteConfig({
    required this.maintenance,
    required this.platformVersionsRequirements,
  });

  final bool maintenance;
  final PlatformVersionsRequirements platformVersionsRequirements;

  @override
  List<Object?> get props => [maintenance, platformVersionsRequirements];
}

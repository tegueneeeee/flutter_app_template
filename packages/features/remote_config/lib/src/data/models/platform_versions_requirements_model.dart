import 'package:features_remote_config/src/data/models/versions_requirements_model.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'platform_versions_requirements_model.freezed.dart';
part 'platform_versions_requirements_model.g.dart';

@freezed
abstract class PlatformVersionsRequirementsModel
    with _$PlatformVersionsRequirementsModel {
  const factory PlatformVersionsRequirementsModel({
    @Default(VersionsRequirementsModel()) VersionsRequirementsModel ios,
    @Default(VersionsRequirementsModel()) VersionsRequirementsModel android,
  }) = _PlatformVersionsRequirementsModel;

  factory PlatformVersionsRequirementsModel.fromJson(
    Map<String, Object?> json,
  ) => _$PlatformVersionsRequirementsModelFromJson(json);
}

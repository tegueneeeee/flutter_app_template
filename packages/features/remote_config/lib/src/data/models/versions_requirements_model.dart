import 'package:shared_dependencies/dependencies.dart';

part 'versions_requirements_model.freezed.dart';
part 'versions_requirements_model.g.dart';

@freezed
abstract class VersionsRequirementsModel with _$VersionsRequirementsModel {
  const factory VersionsRequirementsModel({
    @Default('') String minVersion,
    @Default('') String targetVersion,
  }) = _VersionsRequirementsModel;

  factory VersionsRequirementsModel.fromJson(Map<String, Object?> json) =>
      _$VersionsRequirementsModelFromJson(json);
}

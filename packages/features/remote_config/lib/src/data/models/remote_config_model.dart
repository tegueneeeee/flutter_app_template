import 'package:features_remote_config/src/data/models/platform_versions_requirements_model.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'remote_config_model.freezed.dart';
part 'remote_config_model.g.dart';

@freezed
abstract class RemoteConfigModel with _$RemoteConfigModel {
  const factory RemoteConfigModel({
    @Default(false) bool maintenance,
    @Default(PlatformVersionsRequirementsModel())
    PlatformVersionsRequirementsModel platformVersionsRequirements,
    @Default('https://apps.apple.com/app/id') String iosStoreUrl,
    @Default('https://play.google.com/store/apps/details?id=')
    String androidStoreUrl,
  }) = _RemoteConfigModel;

  factory RemoteConfigModel.fromJson(Map<String, Object?> json) =>
      _$RemoteConfigModelFromJson(json);
}

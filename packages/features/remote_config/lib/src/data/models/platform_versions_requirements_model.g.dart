// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'platform_versions_requirements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlatformVersionsRequirementsModel _$PlatformVersionsRequirementsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PlatformVersionsRequirementsModel', json, (
  $checkedConvert,
) {
  final val = _PlatformVersionsRequirementsModel(
    ios: $checkedConvert(
      'ios',
      (v) =>
          v == null
              ? const VersionsRequirementsModel()
              : VersionsRequirementsModel.fromJson(v as Map<String, dynamic>),
    ),
    android: $checkedConvert(
      'android',
      (v) =>
          v == null
              ? const VersionsRequirementsModel()
              : VersionsRequirementsModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$PlatformVersionsRequirementsModelToJson(
  _PlatformVersionsRequirementsModel instance,
) => <String, dynamic>{'ios': instance.ios, 'android': instance.android};

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'remote_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfigModel _$RemoteConfigModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_RemoteConfigModel',
      json,
      ($checkedConvert) {
        final val = _RemoteConfigModel(
          maintenance: $checkedConvert(
            'maintenance',
            (v) => v as bool? ?? false,
          ),
          platformVersionsRequirements: $checkedConvert(
            'platform_versions_requirements',
            (v) =>
                v == null
                    ? const PlatformVersionsRequirementsModel()
                    : PlatformVersionsRequirementsModel.fromJson(
                      v as Map<String, dynamic>,
                    ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'platformVersionsRequirements': 'platform_versions_requirements',
      },
    );

Map<String, dynamic> _$RemoteConfigModelToJson(_RemoteConfigModel instance) =>
    <String, dynamic>{
      'maintenance': instance.maintenance,
      'platform_versions_requirements': instance.platformVersionsRequirements,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'versions_requirements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VersionsRequirementsModel _$VersionsRequirementsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_VersionsRequirementsModel',
  json,
  ($checkedConvert) {
    final val = _VersionsRequirementsModel(
      minVersion: $checkedConvert('min_version', (v) => v as String? ?? ''),
      targetVersion: $checkedConvert(
        'target_version',
        (v) => v as String? ?? '',
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'minVersion': 'min_version',
    'targetVersion': 'target_version',
  },
);

Map<String, dynamic> _$VersionsRequirementsModelToJson(
  _VersionsRequirementsModel instance,
) => <String, dynamic>{
  'min_version': instance.minVersion,
  'target_version': instance.targetVersion,
};

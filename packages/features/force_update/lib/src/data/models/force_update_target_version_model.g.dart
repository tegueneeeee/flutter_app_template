// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'force_update_target_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForceUpdateTargetVersionModel _$ForceUpdateTargetVersionModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ForceUpdateTargetVersionModel',
  json,
  ($checkedConvert) {
    final val = _ForceUpdateTargetVersionModel(
      iosVersion: $checkedConvert('ios_version', (v) => v as String),
      androidVersion: $checkedConvert('android_version', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'iosVersion': 'ios_version',
    'androidVersion': 'android_version',
  },
);

Map<String, dynamic> _$ForceUpdateTargetVersionModelToJson(
  _ForceUpdateTargetVersionModel instance,
) => <String, dynamic>{
  'ios_version': instance.iosVersion,
  'android_version': instance.androidVersion,
};

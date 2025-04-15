// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'versions_requirements_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VersionsRequirementsModel {

 String get minVersion; String get targetVersion;
/// Create a copy of VersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionsRequirementsModelCopyWith<VersionsRequirementsModel> get copyWith => _$VersionsRequirementsModelCopyWithImpl<VersionsRequirementsModel>(this as VersionsRequirementsModel, _$identity);

  /// Serializes this VersionsRequirementsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionsRequirementsModel&&(identical(other.minVersion, minVersion) || other.minVersion == minVersion)&&(identical(other.targetVersion, targetVersion) || other.targetVersion == targetVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minVersion,targetVersion);

@override
String toString() {
  return 'VersionsRequirementsModel(minVersion: $minVersion, targetVersion: $targetVersion)';
}


}

/// @nodoc
abstract mixin class $VersionsRequirementsModelCopyWith<$Res>  {
  factory $VersionsRequirementsModelCopyWith(VersionsRequirementsModel value, $Res Function(VersionsRequirementsModel) _then) = _$VersionsRequirementsModelCopyWithImpl;
@useResult
$Res call({
 String minVersion, String targetVersion
});




}
/// @nodoc
class _$VersionsRequirementsModelCopyWithImpl<$Res>
    implements $VersionsRequirementsModelCopyWith<$Res> {
  _$VersionsRequirementsModelCopyWithImpl(this._self, this._then);

  final VersionsRequirementsModel _self;
  final $Res Function(VersionsRequirementsModel) _then;

/// Create a copy of VersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minVersion = null,Object? targetVersion = null,}) {
  return _then(_self.copyWith(
minVersion: null == minVersion ? _self.minVersion : minVersion // ignore: cast_nullable_to_non_nullable
as String,targetVersion: null == targetVersion ? _self.targetVersion : targetVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VersionsRequirementsModel implements VersionsRequirementsModel {
  const _VersionsRequirementsModel({this.minVersion = '', this.targetVersion = ''});
  factory _VersionsRequirementsModel.fromJson(Map<String, dynamic> json) => _$VersionsRequirementsModelFromJson(json);

@override@JsonKey() final  String minVersion;
@override@JsonKey() final  String targetVersion;

/// Create a copy of VersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionsRequirementsModelCopyWith<_VersionsRequirementsModel> get copyWith => __$VersionsRequirementsModelCopyWithImpl<_VersionsRequirementsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionsRequirementsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionsRequirementsModel&&(identical(other.minVersion, minVersion) || other.minVersion == minVersion)&&(identical(other.targetVersion, targetVersion) || other.targetVersion == targetVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minVersion,targetVersion);

@override
String toString() {
  return 'VersionsRequirementsModel(minVersion: $minVersion, targetVersion: $targetVersion)';
}


}

/// @nodoc
abstract mixin class _$VersionsRequirementsModelCopyWith<$Res> implements $VersionsRequirementsModelCopyWith<$Res> {
  factory _$VersionsRequirementsModelCopyWith(_VersionsRequirementsModel value, $Res Function(_VersionsRequirementsModel) _then) = __$VersionsRequirementsModelCopyWithImpl;
@override @useResult
$Res call({
 String minVersion, String targetVersion
});




}
/// @nodoc
class __$VersionsRequirementsModelCopyWithImpl<$Res>
    implements _$VersionsRequirementsModelCopyWith<$Res> {
  __$VersionsRequirementsModelCopyWithImpl(this._self, this._then);

  final _VersionsRequirementsModel _self;
  final $Res Function(_VersionsRequirementsModel) _then;

/// Create a copy of VersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minVersion = null,Object? targetVersion = null,}) {
  return _then(_VersionsRequirementsModel(
minVersion: null == minVersion ? _self.minVersion : minVersion // ignore: cast_nullable_to_non_nullable
as String,targetVersion: null == targetVersion ? _self.targetVersion : targetVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

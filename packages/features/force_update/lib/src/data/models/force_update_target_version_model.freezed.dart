// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_target_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForceUpdateTargetVersionModel {

 String get iosVersion; String get androidVersion;
/// Create a copy of ForceUpdateTargetVersionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceUpdateTargetVersionModelCopyWith<ForceUpdateTargetVersionModel> get copyWith => _$ForceUpdateTargetVersionModelCopyWithImpl<ForceUpdateTargetVersionModel>(this as ForceUpdateTargetVersionModel, _$identity);

  /// Serializes this ForceUpdateTargetVersionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdateTargetVersionModel&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iosVersion,androidVersion);

@override
String toString() {
  return 'ForceUpdateTargetVersionModel(iosVersion: $iosVersion, androidVersion: $androidVersion)';
}


}

/// @nodoc
abstract mixin class $ForceUpdateTargetVersionModelCopyWith<$Res>  {
  factory $ForceUpdateTargetVersionModelCopyWith(ForceUpdateTargetVersionModel value, $Res Function(ForceUpdateTargetVersionModel) _then) = _$ForceUpdateTargetVersionModelCopyWithImpl;
@useResult
$Res call({
 String iosVersion, String androidVersion
});




}
/// @nodoc
class _$ForceUpdateTargetVersionModelCopyWithImpl<$Res>
    implements $ForceUpdateTargetVersionModelCopyWith<$Res> {
  _$ForceUpdateTargetVersionModelCopyWithImpl(this._self, this._then);

  final ForceUpdateTargetVersionModel _self;
  final $Res Function(ForceUpdateTargetVersionModel) _then;

/// Create a copy of ForceUpdateTargetVersionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iosVersion = null,Object? androidVersion = null,}) {
  return _then(_self.copyWith(
iosVersion: null == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as String,androidVersion: null == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ForceUpdateTargetVersionModel extends ForceUpdateTargetVersionModel {
  const _ForceUpdateTargetVersionModel({required this.iosVersion, required this.androidVersion}): super._();
  factory _ForceUpdateTargetVersionModel.fromJson(Map<String, dynamic> json) => _$ForceUpdateTargetVersionModelFromJson(json);

@override final  String iosVersion;
@override final  String androidVersion;

/// Create a copy of ForceUpdateTargetVersionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForceUpdateTargetVersionModelCopyWith<_ForceUpdateTargetVersionModel> get copyWith => __$ForceUpdateTargetVersionModelCopyWithImpl<_ForceUpdateTargetVersionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForceUpdateTargetVersionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForceUpdateTargetVersionModel&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iosVersion,androidVersion);

@override
String toString() {
  return 'ForceUpdateTargetVersionModel(iosVersion: $iosVersion, androidVersion: $androidVersion)';
}


}

/// @nodoc
abstract mixin class _$ForceUpdateTargetVersionModelCopyWith<$Res> implements $ForceUpdateTargetVersionModelCopyWith<$Res> {
  factory _$ForceUpdateTargetVersionModelCopyWith(_ForceUpdateTargetVersionModel value, $Res Function(_ForceUpdateTargetVersionModel) _then) = __$ForceUpdateTargetVersionModelCopyWithImpl;
@override @useResult
$Res call({
 String iosVersion, String androidVersion
});




}
/// @nodoc
class __$ForceUpdateTargetVersionModelCopyWithImpl<$Res>
    implements _$ForceUpdateTargetVersionModelCopyWith<$Res> {
  __$ForceUpdateTargetVersionModelCopyWithImpl(this._self, this._then);

  final _ForceUpdateTargetVersionModel _self;
  final $Res Function(_ForceUpdateTargetVersionModel) _then;

/// Create a copy of ForceUpdateTargetVersionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iosVersion = null,Object? androidVersion = null,}) {
  return _then(_ForceUpdateTargetVersionModel(
iosVersion: null == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as String,androidVersion: null == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

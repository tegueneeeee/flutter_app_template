// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_versions_requirements_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlatformVersionsRequirementsModel {

 VersionsRequirementsModel get ios; VersionsRequirementsModel get android;
/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformVersionsRequirementsModelCopyWith<PlatformVersionsRequirementsModel> get copyWith => _$PlatformVersionsRequirementsModelCopyWithImpl<PlatformVersionsRequirementsModel>(this as PlatformVersionsRequirementsModel, _$identity);

  /// Serializes this PlatformVersionsRequirementsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformVersionsRequirementsModel&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString() {
  return 'PlatformVersionsRequirementsModel(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class $PlatformVersionsRequirementsModelCopyWith<$Res>  {
  factory $PlatformVersionsRequirementsModelCopyWith(PlatformVersionsRequirementsModel value, $Res Function(PlatformVersionsRequirementsModel) _then) = _$PlatformVersionsRequirementsModelCopyWithImpl;
@useResult
$Res call({
 VersionsRequirementsModel ios, VersionsRequirementsModel android
});


$VersionsRequirementsModelCopyWith<$Res> get ios;$VersionsRequirementsModelCopyWith<$Res> get android;

}
/// @nodoc
class _$PlatformVersionsRequirementsModelCopyWithImpl<$Res>
    implements $PlatformVersionsRequirementsModelCopyWith<$Res> {
  _$PlatformVersionsRequirementsModelCopyWithImpl(this._self, this._then);

  final PlatformVersionsRequirementsModel _self;
  final $Res Function(PlatformVersionsRequirementsModel) _then;

/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ios = null,Object? android = null,}) {
  return _then(_self.copyWith(
ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as VersionsRequirementsModel,android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as VersionsRequirementsModel,
  ));
}
/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionsRequirementsModelCopyWith<$Res> get ios {
  
  return $VersionsRequirementsModelCopyWith<$Res>(_self.ios, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionsRequirementsModelCopyWith<$Res> get android {
  
  return $VersionsRequirementsModelCopyWith<$Res>(_self.android, (value) {
    return _then(_self.copyWith(android: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PlatformVersionsRequirementsModel implements PlatformVersionsRequirementsModel {
  const _PlatformVersionsRequirementsModel({this.ios = const VersionsRequirementsModel(), this.android = const VersionsRequirementsModel()});
  factory _PlatformVersionsRequirementsModel.fromJson(Map<String, dynamic> json) => _$PlatformVersionsRequirementsModelFromJson(json);

@override@JsonKey() final  VersionsRequirementsModel ios;
@override@JsonKey() final  VersionsRequirementsModel android;

/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformVersionsRequirementsModelCopyWith<_PlatformVersionsRequirementsModel> get copyWith => __$PlatformVersionsRequirementsModelCopyWithImpl<_PlatformVersionsRequirementsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformVersionsRequirementsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformVersionsRequirementsModel&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.android, android) || other.android == android));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ios,android);

@override
String toString() {
  return 'PlatformVersionsRequirementsModel(ios: $ios, android: $android)';
}


}

/// @nodoc
abstract mixin class _$PlatformVersionsRequirementsModelCopyWith<$Res> implements $PlatformVersionsRequirementsModelCopyWith<$Res> {
  factory _$PlatformVersionsRequirementsModelCopyWith(_PlatformVersionsRequirementsModel value, $Res Function(_PlatformVersionsRequirementsModel) _then) = __$PlatformVersionsRequirementsModelCopyWithImpl;
@override @useResult
$Res call({
 VersionsRequirementsModel ios, VersionsRequirementsModel android
});


@override $VersionsRequirementsModelCopyWith<$Res> get ios;@override $VersionsRequirementsModelCopyWith<$Res> get android;

}
/// @nodoc
class __$PlatformVersionsRequirementsModelCopyWithImpl<$Res>
    implements _$PlatformVersionsRequirementsModelCopyWith<$Res> {
  __$PlatformVersionsRequirementsModelCopyWithImpl(this._self, this._then);

  final _PlatformVersionsRequirementsModel _self;
  final $Res Function(_PlatformVersionsRequirementsModel) _then;

/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ios = null,Object? android = null,}) {
  return _then(_PlatformVersionsRequirementsModel(
ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as VersionsRequirementsModel,android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as VersionsRequirementsModel,
  ));
}

/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionsRequirementsModelCopyWith<$Res> get ios {
  
  return $VersionsRequirementsModelCopyWith<$Res>(_self.ios, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of PlatformVersionsRequirementsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionsRequirementsModelCopyWith<$Res> get android {
  
  return $VersionsRequirementsModelCopyWith<$Res>(_self.android, (value) {
    return _then(_self.copyWith(android: value));
  });
}
}

// dart format on

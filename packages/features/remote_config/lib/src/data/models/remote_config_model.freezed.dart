// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigModel {

 bool get maintenance; PlatformVersionsRequirementsModel get platformVersionsRequirements; String get iosStoreUrl; String get androidStoreUrl;
/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigModelCopyWith<RemoteConfigModel> get copyWith => _$RemoteConfigModelCopyWithImpl<RemoteConfigModel>(this as RemoteConfigModel, _$identity);

  /// Serializes this RemoteConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigModel&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.platformVersionsRequirements, platformVersionsRequirements) || other.platformVersionsRequirements == platformVersionsRequirements)&&(identical(other.iosStoreUrl, iosStoreUrl) || other.iosStoreUrl == iosStoreUrl)&&(identical(other.androidStoreUrl, androidStoreUrl) || other.androidStoreUrl == androidStoreUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maintenance,platformVersionsRequirements,iosStoreUrl,androidStoreUrl);

@override
String toString() {
  return 'RemoteConfigModel(maintenance: $maintenance, platformVersionsRequirements: $platformVersionsRequirements, iosStoreUrl: $iosStoreUrl, androidStoreUrl: $androidStoreUrl)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigModelCopyWith<$Res>  {
  factory $RemoteConfigModelCopyWith(RemoteConfigModel value, $Res Function(RemoteConfigModel) _then) = _$RemoteConfigModelCopyWithImpl;
@useResult
$Res call({
 bool maintenance, PlatformVersionsRequirementsModel platformVersionsRequirements, String iosStoreUrl, String androidStoreUrl
});


$PlatformVersionsRequirementsModelCopyWith<$Res> get platformVersionsRequirements;

}
/// @nodoc
class _$RemoteConfigModelCopyWithImpl<$Res>
    implements $RemoteConfigModelCopyWith<$Res> {
  _$RemoteConfigModelCopyWithImpl(this._self, this._then);

  final RemoteConfigModel _self;
  final $Res Function(RemoteConfigModel) _then;

/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maintenance = null,Object? platformVersionsRequirements = null,Object? iosStoreUrl = null,Object? androidStoreUrl = null,}) {
  return _then(_self.copyWith(
maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as bool,platformVersionsRequirements: null == platformVersionsRequirements ? _self.platformVersionsRequirements : platformVersionsRequirements // ignore: cast_nullable_to_non_nullable
as PlatformVersionsRequirementsModel,iosStoreUrl: null == iosStoreUrl ? _self.iosStoreUrl : iosStoreUrl // ignore: cast_nullable_to_non_nullable
as String,androidStoreUrl: null == androidStoreUrl ? _self.androidStoreUrl : androidStoreUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformVersionsRequirementsModelCopyWith<$Res> get platformVersionsRequirements {
  
  return $PlatformVersionsRequirementsModelCopyWith<$Res>(_self.platformVersionsRequirements, (value) {
    return _then(_self.copyWith(platformVersionsRequirements: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _RemoteConfigModel implements RemoteConfigModel {
  const _RemoteConfigModel({this.maintenance = false, this.platformVersionsRequirements = const PlatformVersionsRequirementsModel(), this.iosStoreUrl = 'https://apps.apple.com/app/id', this.androidStoreUrl = 'https://play.google.com/store/apps/details?id='});
  factory _RemoteConfigModel.fromJson(Map<String, dynamic> json) => _$RemoteConfigModelFromJson(json);

@override@JsonKey() final  bool maintenance;
@override@JsonKey() final  PlatformVersionsRequirementsModel platformVersionsRequirements;
@override@JsonKey() final  String iosStoreUrl;
@override@JsonKey() final  String androidStoreUrl;

/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteConfigModelCopyWith<_RemoteConfigModel> get copyWith => __$RemoteConfigModelCopyWithImpl<_RemoteConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteConfigModel&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.platformVersionsRequirements, platformVersionsRequirements) || other.platformVersionsRequirements == platformVersionsRequirements)&&(identical(other.iosStoreUrl, iosStoreUrl) || other.iosStoreUrl == iosStoreUrl)&&(identical(other.androidStoreUrl, androidStoreUrl) || other.androidStoreUrl == androidStoreUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maintenance,platformVersionsRequirements,iosStoreUrl,androidStoreUrl);

@override
String toString() {
  return 'RemoteConfigModel(maintenance: $maintenance, platformVersionsRequirements: $platformVersionsRequirements, iosStoreUrl: $iosStoreUrl, androidStoreUrl: $androidStoreUrl)';
}


}

/// @nodoc
abstract mixin class _$RemoteConfigModelCopyWith<$Res> implements $RemoteConfigModelCopyWith<$Res> {
  factory _$RemoteConfigModelCopyWith(_RemoteConfigModel value, $Res Function(_RemoteConfigModel) _then) = __$RemoteConfigModelCopyWithImpl;
@override @useResult
$Res call({
 bool maintenance, PlatformVersionsRequirementsModel platformVersionsRequirements, String iosStoreUrl, String androidStoreUrl
});


@override $PlatformVersionsRequirementsModelCopyWith<$Res> get platformVersionsRequirements;

}
/// @nodoc
class __$RemoteConfigModelCopyWithImpl<$Res>
    implements _$RemoteConfigModelCopyWith<$Res> {
  __$RemoteConfigModelCopyWithImpl(this._self, this._then);

  final _RemoteConfigModel _self;
  final $Res Function(_RemoteConfigModel) _then;

/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maintenance = null,Object? platformVersionsRequirements = null,Object? iosStoreUrl = null,Object? androidStoreUrl = null,}) {
  return _then(_RemoteConfigModel(
maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as bool,platformVersionsRequirements: null == platformVersionsRequirements ? _self.platformVersionsRequirements : platformVersionsRequirements // ignore: cast_nullable_to_non_nullable
as PlatformVersionsRequirementsModel,iosStoreUrl: null == iosStoreUrl ? _self.iosStoreUrl : iosStoreUrl // ignore: cast_nullable_to_non_nullable
as String,androidStoreUrl: null == androidStoreUrl ? _self.androidStoreUrl : androidStoreUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RemoteConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformVersionsRequirementsModelCopyWith<$Res> get platformVersionsRequirements {
  
  return $PlatformVersionsRequirementsModelCopyWith<$Res>(_self.platformVersionsRequirements, (value) {
    return _then(_self.copyWith(platformVersionsRequirements: value));
  });
}
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteConfigState {

 bool get maintenance; UpdateType get updateType;
/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigStateCopyWith<RemoteConfigState> get copyWith => _$RemoteConfigStateCopyWithImpl<RemoteConfigState>(this as RemoteConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigState&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.updateType, updateType) || other.updateType == updateType));
}


@override
int get hashCode => Object.hash(runtimeType,maintenance,updateType);

@override
String toString() {
  return 'RemoteConfigState(maintenance: $maintenance, updateType: $updateType)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigStateCopyWith<$Res>  {
  factory $RemoteConfigStateCopyWith(RemoteConfigState value, $Res Function(RemoteConfigState) _then) = _$RemoteConfigStateCopyWithImpl;
@useResult
$Res call({
 bool maintenance, UpdateType updateType
});




}
/// @nodoc
class _$RemoteConfigStateCopyWithImpl<$Res>
    implements $RemoteConfigStateCopyWith<$Res> {
  _$RemoteConfigStateCopyWithImpl(this._self, this._then);

  final RemoteConfigState _self;
  final $Res Function(RemoteConfigState) _then;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maintenance = null,Object? updateType = null,}) {
  return _then(_self.copyWith(
maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as bool,updateType: null == updateType ? _self.updateType : updateType // ignore: cast_nullable_to_non_nullable
as UpdateType,
  ));
}

}


/// @nodoc


class _RemoteConfigState implements RemoteConfigState {
  const _RemoteConfigState({this.maintenance = false, this.updateType = UpdateType.none});
  

@override@JsonKey() final  bool maintenance;
@override@JsonKey() final  UpdateType updateType;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteConfigStateCopyWith<_RemoteConfigState> get copyWith => __$RemoteConfigStateCopyWithImpl<_RemoteConfigState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteConfigState&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.updateType, updateType) || other.updateType == updateType));
}


@override
int get hashCode => Object.hash(runtimeType,maintenance,updateType);

@override
String toString() {
  return 'RemoteConfigState(maintenance: $maintenance, updateType: $updateType)';
}


}

/// @nodoc
abstract mixin class _$RemoteConfigStateCopyWith<$Res> implements $RemoteConfigStateCopyWith<$Res> {
  factory _$RemoteConfigStateCopyWith(_RemoteConfigState value, $Res Function(_RemoteConfigState) _then) = __$RemoteConfigStateCopyWithImpl;
@override @useResult
$Res call({
 bool maintenance, UpdateType updateType
});




}
/// @nodoc
class __$RemoteConfigStateCopyWithImpl<$Res>
    implements _$RemoteConfigStateCopyWith<$Res> {
  __$RemoteConfigStateCopyWithImpl(this._self, this._then);

  final _RemoteConfigState _self;
  final $Res Function(_RemoteConfigState) _then;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maintenance = null,Object? updateType = null,}) {
  return _then(_RemoteConfigState(
maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as bool,updateType: null == updateType ? _self.updateType : updateType // ignore: cast_nullable_to_non_nullable
as UpdateType,
  ));
}


}

// dart format on

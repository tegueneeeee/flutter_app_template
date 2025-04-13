// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'force_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForceUpdateState {

 bool get isUpdateNeeded;
/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceUpdateStateCopyWith<ForceUpdateState> get copyWith => _$ForceUpdateStateCopyWithImpl<ForceUpdateState>(this as ForceUpdateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdateState&&(identical(other.isUpdateNeeded, isUpdateNeeded) || other.isUpdateNeeded == isUpdateNeeded));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdateNeeded);

@override
String toString() {
  return 'ForceUpdateState(isUpdateNeeded: $isUpdateNeeded)';
}


}

/// @nodoc
abstract mixin class $ForceUpdateStateCopyWith<$Res>  {
  factory $ForceUpdateStateCopyWith(ForceUpdateState value, $Res Function(ForceUpdateState) _then) = _$ForceUpdateStateCopyWithImpl;
@useResult
$Res call({
 bool isUpdateNeeded
});




}
/// @nodoc
class _$ForceUpdateStateCopyWithImpl<$Res>
    implements $ForceUpdateStateCopyWith<$Res> {
  _$ForceUpdateStateCopyWithImpl(this._self, this._then);

  final ForceUpdateState _self;
  final $Res Function(ForceUpdateState) _then;

/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isUpdateNeeded = null,}) {
  return _then(_self.copyWith(
isUpdateNeeded: null == isUpdateNeeded ? _self.isUpdateNeeded : isUpdateNeeded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _ForceUpdateState implements ForceUpdateState {
  const _ForceUpdateState({this.isUpdateNeeded = false});
  

@override@JsonKey() final  bool isUpdateNeeded;

/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForceUpdateStateCopyWith<_ForceUpdateState> get copyWith => __$ForceUpdateStateCopyWithImpl<_ForceUpdateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForceUpdateState&&(identical(other.isUpdateNeeded, isUpdateNeeded) || other.isUpdateNeeded == isUpdateNeeded));
}


@override
int get hashCode => Object.hash(runtimeType,isUpdateNeeded);

@override
String toString() {
  return 'ForceUpdateState(isUpdateNeeded: $isUpdateNeeded)';
}


}

/// @nodoc
abstract mixin class _$ForceUpdateStateCopyWith<$Res> implements $ForceUpdateStateCopyWith<$Res> {
  factory _$ForceUpdateStateCopyWith(_ForceUpdateState value, $Res Function(_ForceUpdateState) _then) = __$ForceUpdateStateCopyWithImpl;
@override @useResult
$Res call({
 bool isUpdateNeeded
});




}
/// @nodoc
class __$ForceUpdateStateCopyWithImpl<$Res>
    implements _$ForceUpdateStateCopyWith<$Res> {
  __$ForceUpdateStateCopyWithImpl(this._self, this._then);

  final _ForceUpdateState _self;
  final $Res Function(_ForceUpdateState) _then;

/// Create a copy of ForceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isUpdateNeeded = null,}) {
  return _then(_ForceUpdateState(
isUpdateNeeded: null == isUpdateNeeded ? _self.isUpdateNeeded : isUpdateNeeded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

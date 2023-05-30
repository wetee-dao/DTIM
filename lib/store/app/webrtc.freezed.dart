// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webrtc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WebRTCState {
  CallSession? get call => throw _privateConstructorUsedError;
  int get lastSyncTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebRTCStateCopyWith<WebRTCState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebRTCStateCopyWith<$Res> {
  factory $WebRTCStateCopyWith(
          WebRTCState value, $Res Function(WebRTCState) then) =
      _$WebRTCStateCopyWithImpl<$Res, WebRTCState>;
  @useResult
  $Res call({CallSession? call, int lastSyncTime});
}

/// @nodoc
class _$WebRTCStateCopyWithImpl<$Res, $Val extends WebRTCState>
    implements $WebRTCStateCopyWith<$Res> {
  _$WebRTCStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? call = freezed,
    Object? lastSyncTime = null,
  }) {
    return _then(_value.copyWith(
      call: freezed == call
          ? _value.call
          : call // ignore: cast_nullable_to_non_nullable
              as CallSession?,
      lastSyncTime: null == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebRTCStateCopyWith<$Res>
    implements $WebRTCStateCopyWith<$Res> {
  factory _$$_WebRTCStateCopyWith(
          _$_WebRTCState value, $Res Function(_$_WebRTCState) then) =
      __$$_WebRTCStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CallSession? call, int lastSyncTime});
}

/// @nodoc
class __$$_WebRTCStateCopyWithImpl<$Res>
    extends _$WebRTCStateCopyWithImpl<$Res, _$_WebRTCState>
    implements _$$_WebRTCStateCopyWith<$Res> {
  __$$_WebRTCStateCopyWithImpl(
      _$_WebRTCState _value, $Res Function(_$_WebRTCState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? call = freezed,
    Object? lastSyncTime = null,
  }) {
    return _then(_$_WebRTCState(
      call: freezed == call
          ? _value.call
          : call // ignore: cast_nullable_to_non_nullable
              as CallSession?,
      lastSyncTime: null == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WebRTCState implements _WebRTCState {
  const _$_WebRTCState({this.call = null, this.lastSyncTime = 0});

  @override
  @JsonKey()
  final CallSession? call;
  @override
  @JsonKey()
  final int lastSyncTime;

  @override
  String toString() {
    return 'WebRTCState(call: $call, lastSyncTime: $lastSyncTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebRTCState &&
            (identical(other.call, call) || other.call == call) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, call, lastSyncTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebRTCStateCopyWith<_$_WebRTCState> get copyWith =>
      __$$_WebRTCStateCopyWithImpl<_$_WebRTCState>(this, _$identity);
}

abstract class _WebRTCState implements WebRTCState {
  const factory _WebRTCState(
      {final CallSession? call, final int lastSyncTime}) = _$_WebRTCState;

  @override
  CallSession? get call;
  @override
  int get lastSyncTime;
  @override
  @JsonKey(ignore: true)
  _$$_WebRTCStateCopyWith<_$_WebRTCState> get copyWith =>
      throw _privateConstructorUsedError;
}

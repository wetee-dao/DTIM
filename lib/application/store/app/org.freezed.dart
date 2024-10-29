// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrgState {
  String get channelId => throw _privateConstructorUsedError;
  int get lastSyncTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrgStateCopyWith<OrgState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgStateCopyWith<$Res> {
  factory $OrgStateCopyWith(OrgState value, $Res Function(OrgState) then) =
      _$OrgStateCopyWithImpl<$Res, OrgState>;
  @useResult
  $Res call({String channelId, int lastSyncTime});
}

/// @nodoc
class _$OrgStateCopyWithImpl<$Res, $Val extends OrgState>
    implements $OrgStateCopyWith<$Res> {
  _$OrgStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? lastSyncTime = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncTime: null == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrgStateImplCopyWith<$Res>
    implements $OrgStateCopyWith<$Res> {
  factory _$$OrgStateImplCopyWith(
          _$OrgStateImpl value, $Res Function(_$OrgStateImpl) then) =
      __$$OrgStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String channelId, int lastSyncTime});
}

/// @nodoc
class __$$OrgStateImplCopyWithImpl<$Res>
    extends _$OrgStateCopyWithImpl<$Res, _$OrgStateImpl>
    implements _$$OrgStateImplCopyWith<$Res> {
  __$$OrgStateImplCopyWithImpl(
      _$OrgStateImpl _value, $Res Function(_$OrgStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? lastSyncTime = null,
  }) {
    return _then(_$OrgStateImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncTime: null == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OrgStateImpl implements _OrgState {
  const _$OrgStateImpl({this.channelId = "", this.lastSyncTime = 0});

  @override
  @JsonKey()
  final String channelId;
  @override
  @JsonKey()
  final int lastSyncTime;

  @override
  String toString() {
    return 'OrgState(channelId: $channelId, lastSyncTime: $lastSyncTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrgStateImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, lastSyncTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrgStateImplCopyWith<_$OrgStateImpl> get copyWith =>
      __$$OrgStateImplCopyWithImpl<_$OrgStateImpl>(this, _$identity);
}

abstract class _OrgState implements OrgState {
  const factory _OrgState({final String channelId, final int lastSyncTime}) =
      _$OrgStateImpl;

  @override
  String get channelId;
  @override
  int get lastSyncTime;
  @override
  @JsonKey(ignore: true)
  _$$OrgStateImplCopyWith<_$OrgStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

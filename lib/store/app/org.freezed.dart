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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrgState {
  String get channelId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrgStateCopyWith<OrgState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgStateCopyWith<$Res> {
  factory $OrgStateCopyWith(OrgState value, $Res Function(OrgState) then) =
      _$OrgStateCopyWithImpl<$Res, OrgState>;
  @useResult
  $Res call({String channelId});
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
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrgStateCopyWith<$Res> implements $OrgStateCopyWith<$Res> {
  factory _$$_OrgStateCopyWith(
          _$_OrgState value, $Res Function(_$_OrgState) then) =
      __$$_OrgStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String channelId});
}

/// @nodoc
class __$$_OrgStateCopyWithImpl<$Res>
    extends _$OrgStateCopyWithImpl<$Res, _$_OrgState>
    implements _$$_OrgStateCopyWith<$Res> {
  __$$_OrgStateCopyWithImpl(
      _$_OrgState _value, $Res Function(_$_OrgState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
  }) {
    return _then(_$_OrgState(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrgState implements _OrgState {
  const _$_OrgState({this.channelId = ""});

  @override
  @JsonKey()
  final String channelId;

  @override
  String toString() {
    return 'OrgState(channelId: $channelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrgState &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrgStateCopyWith<_$_OrgState> get copyWith =>
      __$$_OrgStateCopyWithImpl<_$_OrgState>(this, _$identity);
}

abstract class _OrgState implements OrgState {
  const factory _OrgState({final String channelId}) = _$_OrgState;

  @override
  String get channelId;
  @override
  @JsonKey(ignore: true)
  _$$_OrgStateCopyWith<_$_OrgState> get copyWith =>
      throw _privateConstructorUsedError;
}

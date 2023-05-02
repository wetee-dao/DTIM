// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  String get currentId => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get signCtx => throw _privateConstructorUsedError;
  String get sign => throw _privateConstructorUsedError;
  Account? get me => throw _privateConstructorUsedError;
  Map<String, Client> get connections => throw _privateConstructorUsedError;
  Map<String, ImState> get connectionStates =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {String currentId,
      String password,
      String signCtx,
      String sign,
      Account? me,
      Map<String, Client> connections,
      Map<String, ImState> connectionStates});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentId = null,
    Object? password = null,
    Object? signCtx = null,
    Object? sign = null,
    Object? me = freezed,
    Object? connections = null,
    Object? connectionStates = null,
  }) {
    return _then(_value.copyWith(
      currentId: null == currentId
          ? _value.currentId
          : currentId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      signCtx: null == signCtx
          ? _value.signCtx
          : signCtx // ignore: cast_nullable_to_non_nullable
              as String,
      sign: null == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as Account?,
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<String, Client>,
      connectionStates: null == connectionStates
          ? _value.connectionStates
          : connectionStates // ignore: cast_nullable_to_non_nullable
              as Map<String, ImState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currentId,
      String password,
      String signCtx,
      String sign,
      Account? me,
      Map<String, Client> connections,
      Map<String, ImState> connectionStates});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentId = null,
    Object? password = null,
    Object? signCtx = null,
    Object? sign = null,
    Object? me = freezed,
    Object? connections = null,
    Object? connectionStates = null,
  }) {
    return _then(_$_AppState(
      currentId: null == currentId
          ? _value.currentId
          : currentId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      signCtx: null == signCtx
          ? _value.signCtx
          : signCtx // ignore: cast_nullable_to_non_nullable
              as String,
      sign: null == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as Account?,
      connections: null == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<String, Client>,
      connectionStates: null == connectionStates
          ? _value._connectionStates
          : connectionStates // ignore: cast_nullable_to_non_nullable
              as Map<String, ImState>,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {this.currentId = "",
      this.password = "",
      this.signCtx = "",
      this.sign = "",
      this.me,
      final Map<String, Client> connections = const {},
      final Map<String, ImState> connectionStates = const {}})
      : _connections = connections,
        _connectionStates = connectionStates;

  @override
  @JsonKey()
  final String currentId;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String signCtx;
  @override
  @JsonKey()
  final String sign;
  @override
  final Account? me;
  final Map<String, Client> _connections;
  @override
  @JsonKey()
  Map<String, Client> get connections {
    if (_connections is EqualUnmodifiableMapView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_connections);
  }

  final Map<String, ImState> _connectionStates;
  @override
  @JsonKey()
  Map<String, ImState> get connectionStates {
    if (_connectionStates is EqualUnmodifiableMapView) return _connectionStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_connectionStates);
  }

  @override
  String toString() {
    return 'AppState(currentId: $currentId, password: $password, signCtx: $signCtx, sign: $sign, me: $me, connections: $connections, connectionStates: $connectionStates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.currentId, currentId) ||
                other.currentId == currentId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.signCtx, signCtx) || other.signCtx == signCtx) &&
            (identical(other.sign, sign) || other.sign == sign) &&
            (identical(other.me, me) || other.me == me) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections) &&
            const DeepCollectionEquality()
                .equals(other._connectionStates, _connectionStates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentId,
      password,
      signCtx,
      sign,
      me,
      const DeepCollectionEquality().hash(_connections),
      const DeepCollectionEquality().hash(_connectionStates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final String currentId,
      final String password,
      final String signCtx,
      final String sign,
      final Account? me,
      final Map<String, Client> connections,
      final Map<String, ImState> connectionStates}) = _$_AppState;

  @override
  String get currentId;
  @override
  String get password;
  @override
  String get signCtx;
  @override
  String get sign;
  @override
  Account? get me;
  @override
  Map<String, Client> get connections;
  @override
  Map<String, ImState> get connectionStates;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

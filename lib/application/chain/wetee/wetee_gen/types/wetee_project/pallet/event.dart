// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../sp_runtime/dispatch_error.dart' as _i4;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, dynamic> toJson();
}

class $Event {
  const $Event();

  ProjectJoined projectJoined(
    BigInt value0,
    BigInt value1,
    _i3.AccountId32 value2,
  ) {
    return ProjectJoined(
      value0,
      value1,
      value2,
    );
  }

  ProjectCreated projectCreated(
    BigInt value0,
    BigInt value1,
    _i3.AccountId32 value2,
  ) {
    return ProjectCreated(
      value0,
      value1,
      value2,
    );
  }

  TaskCreated taskCreated(
    BigInt value0,
    BigInt value1,
    BigInt value2,
    _i3.AccountId32 value3,
  ) {
    return TaskCreated(
      value0,
      value1,
      value2,
      value3,
    );
  }

  TaskInProgress taskInProgress(
    BigInt value0,
    BigInt value1,
    BigInt value2,
    _i3.AccountId32 value3,
  ) {
    return TaskInProgress(
      value0,
      value1,
      value2,
      value3,
    );
  }

  TaskInReview taskInReview(
    BigInt value0,
    BigInt value1,
    BigInt value2,
    _i3.AccountId32 value3,
  ) {
    return TaskInReview(
      value0,
      value1,
      value2,
      value3,
    );
  }

  ProxyCallResult proxyCallResult({
    required _i3.AccountId32 caller,
    required _i3.AccountId32 projectAccount,
    required _i1.Result<dynamic, _i4.DispatchError> callResult,
  }) {
    return ProxyCallResult(
      caller: caller,
      projectAccount: projectAccount,
      callResult: callResult,
    );
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ProjectJoined._decode(input);
      case 1:
        return ProjectCreated._decode(input);
      case 2:
        return TaskCreated._decode(input);
      case 3:
        return TaskInProgress._decode(input);
      case 4:
        return TaskInReview._decode(input);
      case 5:
        return ProxyCallResult._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case ProjectJoined:
        (value as ProjectJoined).encodeTo(output);
        break;
      case ProjectCreated:
        (value as ProjectCreated).encodeTo(output);
        break;
      case TaskCreated:
        (value as TaskCreated).encodeTo(output);
        break;
      case TaskInProgress:
        (value as TaskInProgress).encodeTo(output);
        break;
      case TaskInReview:
        (value as TaskInReview).encodeTo(output);
        break;
      case ProxyCallResult:
        (value as ProxyCallResult).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case ProjectJoined:
        return (value as ProjectJoined)._sizeHint();
      case ProjectCreated:
        return (value as ProjectCreated)._sizeHint();
      case TaskCreated:
        return (value as TaskCreated)._sizeHint();
      case TaskInProgress:
        return (value as TaskInProgress)._sizeHint();
      case TaskInReview:
        return (value as TaskInReview)._sizeHint();
      case ProxyCallResult:
        return (value as ProxyCallResult)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class ProjectJoined extends Event {
  const ProjectJoined(
    this.value0,
    this.value1,
    this.value2,
  );

  factory ProjectJoined._decode(_i1.Input input) {
    return ProjectJoined(
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// ProjectId
  final BigInt value1;

  /// T::AccountId
  final _i3.AccountId32 value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'ProjectJoined': [
          value0,
          value1,
          value2.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + const _i3.AccountId32Codec().sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value2,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProjectJoined &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          _i5.listsEqual(
            other.value2,
            value2,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

class ProjectCreated extends Event {
  const ProjectCreated(
    this.value0,
    this.value1,
    this.value2,
  );

  factory ProjectCreated._decode(_i1.Input input) {
    return ProjectCreated(
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// ProjectId
  final BigInt value1;

  /// T::AccountId
  final _i3.AccountId32 value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'ProjectCreated': [
          value0,
          value1,
          value2.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + const _i3.AccountId32Codec().sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value2,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProjectCreated &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          _i5.listsEqual(
            other.value2,
            value2,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

class TaskCreated extends Event {
  const TaskCreated(
    this.value0,
    this.value1,
    this.value2,
    this.value3,
  );

  factory TaskCreated._decode(_i1.Input input) {
    return TaskCreated(
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// ProjectId
  final BigInt value1;

  /// u64
  final BigInt value2;

  /// T::AccountId
  final _i3.AccountId32 value3;

  @override
  Map<String, List<dynamic>> toJson() => {
        'TaskCreated': [
          value0,
          value1,
          value2,
          value3.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + _i1.U64Codec.codec.sizeHint(value2);
    size = size + const _i3.AccountId32Codec().sizeHint(value3);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value3,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskCreated &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          other.value2 == value2 &&
          _i5.listsEqual(
            other.value3,
            value3,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
        value3,
      );
}

class TaskInProgress extends Event {
  const TaskInProgress(
    this.value0,
    this.value1,
    this.value2,
    this.value3,
  );

  factory TaskInProgress._decode(_i1.Input input) {
    return TaskInProgress(
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// ProjectId
  final BigInt value1;

  /// u64
  final BigInt value2;

  /// T::AccountId
  final _i3.AccountId32 value3;

  @override
  Map<String, List<dynamic>> toJson() => {
        'TaskInProgress': [
          value0,
          value1,
          value2,
          value3.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + _i1.U64Codec.codec.sizeHint(value2);
    size = size + const _i3.AccountId32Codec().sizeHint(value3);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value3,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskInProgress &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          other.value2 == value2 &&
          _i5.listsEqual(
            other.value3,
            value3,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
        value3,
      );
}

class TaskInReview extends Event {
  const TaskInReview(
    this.value0,
    this.value1,
    this.value2,
    this.value3,
  );

  factory TaskInReview._decode(_i1.Input input) {
    return TaskInReview(
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// ProjectId
  final BigInt value1;

  /// u64
  final BigInt value2;

  /// T::AccountId
  final _i3.AccountId32 value3;

  @override
  Map<String, List<dynamic>> toJson() => {
        'TaskInReview': [
          value0,
          value1,
          value2,
          value3.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + _i1.U64Codec.codec.sizeHint(value2);
    size = size + const _i3.AccountId32Codec().sizeHint(value3);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value3,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TaskInReview &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          other.value2 == value2 &&
          _i5.listsEqual(
            other.value3,
            value3,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
        value3,
      );
}

class ProxyCallResult extends Event {
  const ProxyCallResult({
    required this.caller,
    required this.projectAccount,
    required this.callResult,
  });

  factory ProxyCallResult._decode(_i1.Input input) {
    return ProxyCallResult(
      caller: const _i1.U8ArrayCodec(32).decode(input),
      projectAccount: const _i1.U8ArrayCodec(32).decode(input),
      callResult: const _i1.ResultCodec<dynamic, _i4.DispatchError>(
        _i1.NullCodec.codec,
        _i4.DispatchError.codec,
      ).decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 caller;

  /// T::AccountId
  final _i3.AccountId32 projectAccount;

  /// DispatchResult
  final _i1.Result<dynamic, _i4.DispatchError> callResult;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'ProxyCallResult': {
          'caller': caller.toList(),
          'projectAccount': projectAccount.toList(),
          'callResult': callResult.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(caller);
    size = size + const _i3.AccountId32Codec().sizeHint(projectAccount);
    size = size +
        const _i1.ResultCodec<dynamic, _i4.DispatchError>(
          _i1.NullCodec.codec,
          _i4.DispatchError.codec,
        ).sizeHint(callResult);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      caller,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      projectAccount,
      output,
    );
    const _i1.ResultCodec<dynamic, _i4.DispatchError>(
      _i1.NullCodec.codec,
      _i4.DispatchError.codec,
    ).encodeTo(
      callResult,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProxyCallResult &&
          _i5.listsEqual(
            other.caller,
            caller,
          ) &&
          _i5.listsEqual(
            other.projectAccount,
            projectAccount,
          ) &&
          other.callResult == callResult;

  @override
  int get hashCode => Object.hash(
        caller,
        projectAccount,
        callResult,
      );
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../sp_core/crypto/account_id32.dart' as _i4;
import '../../wetee_primitives/types/ink_arg.dart' as _i5;
import '../../wetee_primitives/types/work_id.dart' as _i3;

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

  Map<String, Map<String, dynamic>> toJson();
}

class $Event {
  const $Event();

  TEECallStarted tEECallStarted({
    required BigInt clusterId,
    required BigInt callId,
  }) {
    return TEECallStarted(
      clusterId: clusterId,
      callId: callId,
    );
  }

  TEECallSuccessed tEECallSuccessed({
    required BigInt clusterId,
    required BigInt callId,
  }) {
    return TEECallSuccessed(
      clusterId: clusterId,
      callId: callId,
    );
  }

  TEECallFailed tEECallFailed({
    required BigInt clusterId,
    required BigInt callId,
    required List<int> error,
  }) {
    return TEECallFailed(
      clusterId: clusterId,
      callId: callId,
      error: error,
    );
  }

  TEECallBackFailed tEECallBackFailed({
    required BigInt clusterId,
    required BigInt callId,
    required List<int> error,
  }) {
    return TEECallBackFailed(
      clusterId: clusterId,
      callId: callId,
      error: error,
    );
  }

  InkCallSuccessed inkCallSuccessed({
    required _i3.WorkId workId,
    required _i4.AccountId32 contract,
    required List<int> method,
    required List<_i5.InkArg> args,
  }) {
    return InkCallSuccessed(
      workId: workId,
      contract: contract,
      method: method,
      args: args,
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
        return TEECallStarted._decode(input);
      case 1:
        return TEECallSuccessed._decode(input);
      case 2:
        return TEECallFailed._decode(input);
      case 3:
        return TEECallBackFailed._decode(input);
      case 4:
        return InkCallSuccessed._decode(input);
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
      case TEECallStarted:
        (value as TEECallStarted).encodeTo(output);
        break;
      case TEECallSuccessed:
        (value as TEECallSuccessed).encodeTo(output);
        break;
      case TEECallFailed:
        (value as TEECallFailed).encodeTo(output);
        break;
      case TEECallBackFailed:
        (value as TEECallBackFailed).encodeTo(output);
        break;
      case InkCallSuccessed:
        (value as InkCallSuccessed).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case TEECallStarted:
        return (value as TEECallStarted)._sizeHint();
      case TEECallSuccessed:
        return (value as TEECallSuccessed)._sizeHint();
      case TEECallFailed:
        return (value as TEECallFailed)._sizeHint();
      case TEECallBackFailed:
        return (value as TEECallBackFailed)._sizeHint();
      case InkCallSuccessed:
        return (value as InkCallSuccessed)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// tee call started
class TEECallStarted extends Event {
  const TEECallStarted({
    required this.clusterId,
    required this.callId,
  });

  factory TEECallStarted._decode(_i1.Input input) {
    return TEECallStarted(
      clusterId: _i1.U64Codec.codec.decode(input),
      callId: _i1.U128Codec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// u128
  final BigInt callId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'TEECallStarted': {
          'clusterId': clusterId,
          'callId': callId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    size = size + _i1.U128Codec.codec.sizeHint(callId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      clusterId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      callId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TEECallStarted &&
          other.clusterId == clusterId &&
          other.callId == callId;

  @override
  int get hashCode => Object.hash(
        clusterId,
        callId,
      );
}

/// tee call successed
class TEECallSuccessed extends Event {
  const TEECallSuccessed({
    required this.clusterId,
    required this.callId,
  });

  factory TEECallSuccessed._decode(_i1.Input input) {
    return TEECallSuccessed(
      clusterId: _i1.U64Codec.codec.decode(input),
      callId: _i1.U128Codec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// u128
  final BigInt callId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'TEECallSuccessed': {
          'clusterId': clusterId,
          'callId': callId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    size = size + _i1.U128Codec.codec.sizeHint(callId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      clusterId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      callId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TEECallSuccessed &&
          other.clusterId == clusterId &&
          other.callId == callId;

  @override
  int get hashCode => Object.hash(
        clusterId,
        callId,
      );
}

/// tee call started
class TEECallFailed extends Event {
  const TEECallFailed({
    required this.clusterId,
    required this.callId,
    required this.error,
  });

  factory TEECallFailed._decode(_i1.Input input) {
    return TEECallFailed(
      clusterId: _i1.U64Codec.codec.decode(input),
      callId: _i1.U128Codec.codec.decode(input),
      error: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// u128
  final BigInt callId;

  /// Vec<u8>
  final List<int> error;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'TEECallFailed': {
          'clusterId': clusterId,
          'callId': callId,
          'error': error,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    size = size + _i1.U128Codec.codec.sizeHint(callId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(error);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      clusterId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      callId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      error,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TEECallFailed &&
          other.clusterId == clusterId &&
          other.callId == callId &&
          _i6.listsEqual(
            other.error,
            error,
          );

  @override
  int get hashCode => Object.hash(
        clusterId,
        callId,
        error,
      );
}

/// tee call started
class TEECallBackFailed extends Event {
  const TEECallBackFailed({
    required this.clusterId,
    required this.callId,
    required this.error,
  });

  factory TEECallBackFailed._decode(_i1.Input input) {
    return TEECallBackFailed(
      clusterId: _i1.U64Codec.codec.decode(input),
      callId: _i1.U128Codec.codec.decode(input),
      error: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// u128
  final BigInt callId;

  /// Vec<u8>
  final List<int> error;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'TEECallBackFailed': {
          'clusterId': clusterId,
          'callId': callId,
          'error': error,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    size = size + _i1.U128Codec.codec.sizeHint(callId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(error);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      clusterId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      callId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      error,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TEECallBackFailed &&
          other.clusterId == clusterId &&
          other.callId == callId &&
          _i6.listsEqual(
            other.error,
            error,
          );

  @override
  int get hashCode => Object.hash(
        clusterId,
        callId,
        error,
      );
}

/// Ink call successed
class InkCallSuccessed extends Event {
  const InkCallSuccessed({
    required this.workId,
    required this.contract,
    required this.method,
    required this.args,
  });

  factory InkCallSuccessed._decode(_i1.Input input) {
    return InkCallSuccessed(
      workId: _i3.WorkId.codec.decode(input),
      contract: const _i1.U8ArrayCodec(32).decode(input),
      method: const _i1.U8ArrayCodec(4).decode(input),
      args: const _i1.SequenceCodec<_i5.InkArg>(_i5.InkArg.codec).decode(input),
    );
  }

  /// WorkId
  final _i3.WorkId workId;

  /// T::AccountId
  final _i4.AccountId32 contract;

  /// [u8; 4]
  final List<int> method;

  /// Vec<InkArg>
  final List<_i5.InkArg> args;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'InkCallSuccessed': {
          'workId': workId.toJson(),
          'contract': contract.toList(),
          'method': method.toList(),
          'args': args.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.WorkId.codec.sizeHint(workId);
    size = size + const _i4.AccountId32Codec().sizeHint(contract);
    size = size + const _i1.U8ArrayCodec(4).sizeHint(method);
    size = size +
        const _i1.SequenceCodec<_i5.InkArg>(_i5.InkArg.codec).sizeHint(args);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i3.WorkId.codec.encodeTo(
      workId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      contract,
      output,
    );
    const _i1.U8ArrayCodec(4).encodeTo(
      method,
      output,
    );
    const _i1.SequenceCodec<_i5.InkArg>(_i5.InkArg.codec).encodeTo(
      args,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InkCallSuccessed &&
          other.workId == workId &&
          _i6.listsEqual(
            other.contract,
            contract,
          ) &&
          _i6.listsEqual(
            other.method,
            method,
          ) &&
          _i6.listsEqual(
            other.args,
            args,
          );

  @override
  int get hashCode => Object.hash(
        workId,
        contract,
        method,
        args,
      );
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../sp_core/crypto/account_id32.dart' as _i5;
import '../../wetee_primitives/types/api_meta.dart' as _i6;
import '../../wetee_primitives/types/ink_arg.dart' as _i3;
import '../../wetee_primitives/types/work_id.dart' as _i4;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

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

class $Call {
  const $Call();

  InkCallback inkCallback({
    required BigInt clusterId,
    required BigInt callId,
    required List<_i3.InkArg> args,
    required BigInt value,
    List<int>? error,
  }) {
    return InkCallback(
      clusterId: clusterId,
      callId: callId,
      args: args,
      value: value,
      error: error,
    );
  }

  CallInk callInk({
    required _i4.WorkId workId,
    required _i5.AccountId32 contract,
    required List<int> method,
    required List<_i3.InkArg> args,
    required BigInt value,
  }) {
    return CallInk(
      workId: workId,
      contract: contract,
      method: method,
      args: args,
      value: value,
    );
  }

  SetTeeApi setTeeApi({
    required _i4.WorkId workId,
    required _i6.ApiMeta meta,
  }) {
    return SetTeeApi(
      workId: workId,
      meta: meta,
    );
  }

  DeleteCall deleteCall({
    required BigInt clusterId,
    required BigInt callId,
  }) {
    return DeleteCall(
      clusterId: clusterId,
      callId: callId,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return InkCallback._decode(input);
      case 2:
        return CallInk._decode(input);
      case 8:
        return SetTeeApi._decode(input);
      case 9:
        return DeleteCall._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case InkCallback:
        (value as InkCallback).encodeTo(output);
        break;
      case CallInk:
        (value as CallInk).encodeTo(output);
        break;
      case SetTeeApi:
        (value as SetTeeApi).encodeTo(output);
        break;
      case DeleteCall:
        (value as DeleteCall).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case InkCallback:
        return (value as InkCallback)._sizeHint();
      case CallInk:
        return (value as CallInk)._sizeHint();
      case SetTeeApi:
        return (value as SetTeeApi)._sizeHint();
      case DeleteCall:
        return (value as DeleteCall)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class InkCallback extends Call {
  const InkCallback({
    required this.clusterId,
    required this.callId,
    required this.args,
    required this.value,
    this.error,
  });

  factory InkCallback._decode(_i1.Input input) {
    return InkCallback(
      clusterId: _i1.U64Codec.codec.decode(input),
      callId: _i1.U128Codec.codec.decode(input),
      args: const _i1.SequenceCodec<_i3.InkArg>(_i3.InkArg.codec).decode(input),
      value: _i1.U128Codec.codec.decode(input),
      error: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// u128
  final BigInt callId;

  /// Vec<InkArg>
  final List<_i3.InkArg> args;

  /// BalanceOf<T>
  final BigInt value;

  /// Option<Vec<u8>>
  final List<int>? error;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'ink_callback': {
          'clusterId': clusterId,
          'callId': callId,
          'args': args.map((value) => value.toJson()).toList(),
          'value': value,
          'error': error,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    size = size + _i1.U128Codec.codec.sizeHint(callId);
    size = size +
        const _i1.SequenceCodec<_i3.InkArg>(_i3.InkArg.codec).sizeHint(args);
    size = size + _i1.U128Codec.codec.sizeHint(value);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(error);
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
    const _i1.SequenceCodec<_i3.InkArg>(_i3.InkArg.codec).encodeTo(
      args,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
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
      other is InkCallback &&
          other.clusterId == clusterId &&
          other.callId == callId &&
          _i7.listsEqual(
            other.args,
            args,
          ) &&
          other.value == value &&
          other.error == error;

  @override
  int get hashCode => Object.hash(
        clusterId,
        callId,
        args,
        value,
        error,
      );
}

class CallInk extends Call {
  const CallInk({
    required this.workId,
    required this.contract,
    required this.method,
    required this.args,
    required this.value,
  });

  factory CallInk._decode(_i1.Input input) {
    return CallInk(
      workId: _i4.WorkId.codec.decode(input),
      contract: const _i1.U8ArrayCodec(32).decode(input),
      method: const _i1.U8ArrayCodec(4).decode(input),
      args: const _i1.SequenceCodec<_i3.InkArg>(_i3.InkArg.codec).decode(input),
      value: _i1.U128Codec.codec.decode(input),
    );
  }

  /// WorkId
  final _i4.WorkId workId;

  /// T::AccountId
  final _i5.AccountId32 contract;

  /// [u8; 4]
  final List<int> method;

  /// Vec<InkArg>
  final List<_i3.InkArg> args;

  /// BalanceOf<T>
  final BigInt value;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'call_ink': {
          'workId': workId.toJson(),
          'contract': contract.toList(),
          'method': method.toList(),
          'args': args.map((value) => value.toJson()).toList(),
          'value': value,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WorkId.codec.sizeHint(workId);
    size = size + const _i5.AccountId32Codec().sizeHint(contract);
    size = size + const _i1.U8ArrayCodec(4).sizeHint(method);
    size = size +
        const _i1.SequenceCodec<_i3.InkArg>(_i3.InkArg.codec).sizeHint(args);
    size = size + _i1.U128Codec.codec.sizeHint(value);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i4.WorkId.codec.encodeTo(
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
    const _i1.SequenceCodec<_i3.InkArg>(_i3.InkArg.codec).encodeTo(
      args,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CallInk &&
          other.workId == workId &&
          _i7.listsEqual(
            other.contract,
            contract,
          ) &&
          _i7.listsEqual(
            other.method,
            method,
          ) &&
          _i7.listsEqual(
            other.args,
            args,
          ) &&
          other.value == value;

  @override
  int get hashCode => Object.hash(
        workId,
        contract,
        method,
        args,
        value,
      );
}

class SetTeeApi extends Call {
  const SetTeeApi({
    required this.workId,
    required this.meta,
  });

  factory SetTeeApi._decode(_i1.Input input) {
    return SetTeeApi(
      workId: _i4.WorkId.codec.decode(input),
      meta: _i6.ApiMeta.codec.decode(input),
    );
  }

  /// WorkId
  final _i4.WorkId workId;

  /// ApiMeta
  final _i6.ApiMeta meta;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'set_tee_api': {
          'workId': workId.toJson(),
          'meta': meta.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WorkId.codec.sizeHint(workId);
    size = size + _i6.ApiMeta.codec.sizeHint(meta);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
    _i6.ApiMeta.codec.encodeTo(
      meta,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetTeeApi && other.workId == workId && other.meta == meta;

  @override
  int get hashCode => Object.hash(
        workId,
        meta,
      );
}

class DeleteCall extends Call {
  const DeleteCall({
    required this.clusterId,
    required this.callId,
  });

  factory DeleteCall._decode(_i1.Input input) {
    return DeleteCall(
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
        'delete_call': {
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
      9,
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
      other is DeleteCall &&
          other.clusterId == clusterId &&
          other.callId == callId;

  @override
  int get hashCode => Object.hash(
        clusterId,
        callId,
      );
}

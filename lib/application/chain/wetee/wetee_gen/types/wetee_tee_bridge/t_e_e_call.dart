// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../sp_core/crypto/account_id32.dart' as _i2;
import '../wetee_primitives/types/work_id.dart' as _i4;
import 't_e_e_call_type.dart' as _i3;

class TEECall {
  const TEECall({
    required this.id,
    this.chainId,
    required this.orgContract,
    required this.orgCaller,
    required this.callType,
    required this.workId,
    required this.method,
    required this.args,
    required this.callbackMethod,
  });

  factory TEECall.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u128
  final BigInt id;

  /// Option<u64>
  final BigInt? chainId;

  /// AccountId
  final _i2.AccountId32 orgContract;

  /// AccountId
  final _i2.AccountId32 orgCaller;

  /// TEECallType
  final _i3.TEECallType callType;

  /// WorkId
  final _i4.WorkId workId;

  /// u16
  final int method;

  /// Vec<u8>
  final List<int> args;

  /// [u8; 4]
  final List<int> callbackMethod;

  static const $TEECallCodec codec = $TEECallCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'chainId': chainId,
        'orgContract': orgContract.toList(),
        'orgCaller': orgCaller.toList(),
        'callType': callType.toJson(),
        'workId': workId.toJson(),
        'method': method,
        'args': args,
        'callbackMethod': callbackMethod.toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TEECall &&
          other.id == id &&
          other.chainId == chainId &&
          _i6.listsEqual(
            other.orgContract,
            orgContract,
          ) &&
          _i6.listsEqual(
            other.orgCaller,
            orgCaller,
          ) &&
          other.callType == callType &&
          other.workId == workId &&
          other.method == method &&
          _i6.listsEqual(
            other.args,
            args,
          ) &&
          _i6.listsEqual(
            other.callbackMethod,
            callbackMethod,
          );

  @override
  int get hashCode => Object.hash(
        id,
        chainId,
        orgContract,
        orgCaller,
        callType,
        workId,
        method,
        args,
        callbackMethod,
      );
}

class $TEECallCodec with _i1.Codec<TEECall> {
  const $TEECallCodec();

  @override
  void encodeTo(
    TEECall obj,
    _i1.Output output,
  ) {
    _i1.U128Codec.codec.encodeTo(
      obj.id,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).encodeTo(
      obj.chainId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.orgContract,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.orgCaller,
      output,
    );
    _i3.TEECallType.codec.encodeTo(
      obj.callType,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      obj.workId,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.method,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.args,
      output,
    );
    const _i1.U8ArrayCodec(4).encodeTo(
      obj.callbackMethod,
      output,
    );
  }

  @override
  TEECall decode(_i1.Input input) {
    return TEECall(
      id: _i1.U128Codec.codec.decode(input),
      chainId: const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).decode(input),
      orgContract: const _i1.U8ArrayCodec(32).decode(input),
      orgCaller: const _i1.U8ArrayCodec(32).decode(input),
      callType: _i3.TEECallType.codec.decode(input),
      workId: _i4.WorkId.codec.decode(input),
      method: _i1.U16Codec.codec.decode(input),
      args: _i1.U8SequenceCodec.codec.decode(input),
      callbackMethod: const _i1.U8ArrayCodec(4).decode(input),
    );
  }

  @override
  int sizeHint(TEECall obj) {
    int size = 0;
    size = size + _i1.U128Codec.codec.sizeHint(obj.id);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).sizeHint(obj.chainId);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.orgContract);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.orgCaller);
    size = size + _i3.TEECallType.codec.sizeHint(obj.callType);
    size = size + _i4.WorkId.codec.sizeHint(obj.workId);
    size = size + _i1.U16Codec.codec.sizeHint(obj.method);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.args);
    size = size + const _i1.U8ArrayCodec(4).sizeHint(obj.callbackMethod);
    return size;
  }
}

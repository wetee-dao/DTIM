// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i6;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../primitive_types/h256.dart' as _i2;
import '../sp_core/crypto/account_id32.dart' as _i5;
import '../wetee_runtime/runtime_call.dart' as _i3;
import 'memmber_data.dart' as _i4;

class PreProp {
  const PreProp({
    required this.id,
    required this.hash,
    required this.call,
    required this.memberData,
    required this.creater,
    required this.periodIndex,
    required this.start,
  });

  factory PreProp.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// PropIndex
  final int id;

  /// Hash
  final _i2.H256 hash;

  /// Call
  final _i3.RuntimeCall call;

  /// MemmberData
  final _i4.MemmberData memberData;

  /// AccountId
  final _i5.AccountId32 creater;

  /// u32
  final int periodIndex;

  /// BlockNumber
  final BigInt start;

  static const $PrePropCodec codec = $PrePropCodec();

  _i6.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'hash': hash.toList(),
        'call': call.toJson(),
        'memberData': memberData.toJson(),
        'creater': creater.toList(),
        'periodIndex': periodIndex,
        'start': start,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PreProp &&
          other.id == id &&
          _i7.listsEqual(
            other.hash,
            hash,
          ) &&
          other.call == call &&
          other.memberData == memberData &&
          _i7.listsEqual(
            other.creater,
            creater,
          ) &&
          other.periodIndex == periodIndex &&
          other.start == start;

  @override
  int get hashCode => Object.hash(
        id,
        hash,
        call,
        memberData,
        creater,
        periodIndex,
        start,
      );
}

class $PrePropCodec with _i1.Codec<PreProp> {
  const $PrePropCodec();

  @override
  void encodeTo(
    PreProp obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.id,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.hash,
      output,
    );
    _i3.RuntimeCall.codec.encodeTo(
      obj.call,
      output,
    );
    _i4.MemmberData.codec.encodeTo(
      obj.memberData,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.creater,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.periodIndex,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.start,
      output,
    );
  }

  @override
  PreProp decode(_i1.Input input) {
    return PreProp(
      id: _i1.U32Codec.codec.decode(input),
      hash: const _i1.U8ArrayCodec(32).decode(input),
      call: _i3.RuntimeCall.codec.decode(input),
      memberData: _i4.MemmberData.codec.decode(input),
      creater: const _i1.U8ArrayCodec(32).decode(input),
      periodIndex: _i1.U32Codec.codec.decode(input),
      start: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(PreProp obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.id);
    size = size + const _i2.H256Codec().sizeHint(obj.hash);
    size = size + _i3.RuntimeCall.codec.sizeHint(obj.call);
    size = size + _i4.MemmberData.codec.sizeHint(obj.memberData);
    size = size + const _i5.AccountId32Codec().sizeHint(obj.creater);
    size = size + _i1.U32Codec.codec.sizeHint(obj.periodIndex);
    size = size + _i1.U64Codec.codec.sizeHint(obj.start);
    return size;
  }
}

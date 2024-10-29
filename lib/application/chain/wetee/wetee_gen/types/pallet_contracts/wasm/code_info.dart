// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i2;
import 'determinism.dart' as _i3;

class CodeInfo {
  const CodeInfo({
    required this.owner,
    required this.deposit,
    required this.refcount,
    required this.determinism,
    required this.codeLen,
  });

  factory CodeInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccountIdOf<T>
  final _i2.AccountId32 owner;

  /// BalanceOf<T>
  final BigInt deposit;

  /// u64
  final BigInt refcount;

  /// Determinism
  final _i3.Determinism determinism;

  /// u32
  final int codeLen;

  static const $CodeInfoCodec codec = $CodeInfoCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'owner': owner.toList(),
        'deposit': deposit,
        'refcount': refcount,
        'determinism': determinism.toJson(),
        'codeLen': codeLen,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CodeInfo &&
          _i5.listsEqual(
            other.owner,
            owner,
          ) &&
          other.deposit == deposit &&
          other.refcount == refcount &&
          other.determinism == determinism &&
          other.codeLen == codeLen;

  @override
  int get hashCode => Object.hash(
        owner,
        deposit,
        refcount,
        determinism,
        codeLen,
      );
}

class $CodeInfoCodec with _i1.Codec<CodeInfo> {
  const $CodeInfoCodec();

  @override
  void encodeTo(
    CodeInfo obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.owner,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.deposit,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      obj.refcount,
      output,
    );
    _i3.Determinism.codec.encodeTo(
      obj.determinism,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.codeLen,
      output,
    );
  }

  @override
  CodeInfo decode(_i1.Input input) {
    return CodeInfo(
      owner: const _i1.U8ArrayCodec(32).decode(input),
      deposit: _i1.CompactBigIntCodec.codec.decode(input),
      refcount: _i1.CompactBigIntCodec.codec.decode(input),
      determinism: _i3.Determinism.codec.decode(input),
      codeLen: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(CodeInfo obj) {
    int size = 0;
    size = size + const _i2.AccountId32Codec().sizeHint(obj.owner);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.deposit);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(obj.refcount);
    size = size + _i3.Determinism.codec.sizeHint(obj.determinism);
    size = size + _i1.U32Codec.codec.sizeHint(obj.codeLen);
    return size;
  }
}

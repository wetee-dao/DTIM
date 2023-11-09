// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../primitive_types/h256.dart' as _i2;

class Prevote {
  const Prevote({
    required this.targetHash,
    required this.targetNumber,
  });

  factory Prevote.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// H
  final _i2.H256 targetHash;

  /// N
  final BigInt targetNumber;

  static const $PrevoteCodec codec = $PrevoteCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'targetHash': targetHash.toList(),
        'targetNumber': targetNumber,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Prevote &&
          _i4.listsEqual(
            other.targetHash,
            targetHash,
          ) &&
          other.targetNumber == targetNumber;

  @override
  int get hashCode => Object.hash(
        targetHash,
        targetNumber,
      );
}

class $PrevoteCodec with _i1.Codec<Prevote> {
  const $PrevoteCodec();

  @override
  void encodeTo(
    Prevote obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.targetHash,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.targetNumber,
      output,
    );
  }

  @override
  Prevote decode(_i1.Input input) {
    return Prevote(
      targetHash: const _i1.U8ArrayCodec(32).decode(input),
      targetNumber: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Prevote obj) {
    int size = 0;
    size = size + const _i2.H256Codec().sizeHint(obj.targetHash);
    size = size + _i1.U64Codec.codec.sizeHint(obj.targetNumber);
    return size;
  }
}

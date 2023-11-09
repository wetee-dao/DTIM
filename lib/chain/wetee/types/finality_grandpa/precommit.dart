// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../primitive_types/h256.dart' as _i2;

class Precommit {
  const Precommit({
    required this.targetHash,
    required this.targetNumber,
  });

  factory Precommit.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// H
  final _i2.H256 targetHash;

  /// N
  final BigInt targetNumber;

  static const $PrecommitCodec codec = $PrecommitCodec();

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
      other is Precommit &&
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

class $PrecommitCodec with _i1.Codec<Precommit> {
  const $PrecommitCodec();

  @override
  void encodeTo(
    Precommit obj,
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
  Precommit decode(_i1.Input input) {
    return Precommit(
      targetHash: const _i1.U8ArrayCodec(32).decode(input),
      targetNumber: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Precommit obj) {
    int size = 0;
    size = size + const _i2.H256Codec().sizeHint(obj.targetHash);
    size = size + _i1.U64Codec.codec.sizeHint(obj.targetNumber);
    return size;
  }
}

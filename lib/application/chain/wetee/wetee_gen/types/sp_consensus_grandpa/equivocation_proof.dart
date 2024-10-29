// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'equivocation.dart' as _i2;

class EquivocationProof {
  const EquivocationProof({
    required this.setId,
    required this.equivocation,
  });

  factory EquivocationProof.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// SetId
  final BigInt setId;

  /// Equivocation<H, N>
  final _i2.Equivocation equivocation;

  static const $EquivocationProofCodec codec = $EquivocationProofCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'setId': setId,
        'equivocation': equivocation.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is EquivocationProof &&
          other.setId == setId &&
          other.equivocation == equivocation;

  @override
  int get hashCode => Object.hash(
        setId,
        equivocation,
      );
}

class $EquivocationProofCodec with _i1.Codec<EquivocationProof> {
  const $EquivocationProofCodec();

  @override
  void encodeTo(
    EquivocationProof obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.setId,
      output,
    );
    _i2.Equivocation.codec.encodeTo(
      obj.equivocation,
      output,
    );
  }

  @override
  EquivocationProof decode(_i1.Input input) {
    return EquivocationProof(
      setId: _i1.U64Codec.codec.decode(input),
      equivocation: _i2.Equivocation.codec.decode(input),
    );
  }

  @override
  int sizeHint(EquivocationProof obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.setId);
    size = size + _i2.Equivocation.codec.sizeHint(obj.equivocation);
    return size;
  }
}

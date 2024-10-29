// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class InstructionWeights {
  const InstructionWeights({required this.base});

  factory InstructionWeights.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u32
  final int base;

  static const $InstructionWeightsCodec codec = $InstructionWeightsCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {'base': base};

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InstructionWeights && other.base == base;

  @override
  int get hashCode => base.hashCode;
}

class $InstructionWeightsCodec with _i1.Codec<InstructionWeights> {
  const $InstructionWeightsCodec();

  @override
  void encodeTo(
    InstructionWeights obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.base,
      output,
    );
  }

  @override
  InstructionWeights decode(_i1.Input input) {
    return InstructionWeights(base: _i1.U32Codec.codec.decode(input));
  }

  @override
  int sizeHint(InstructionWeights obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.base);
    return size;
  }
}

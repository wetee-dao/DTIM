// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class Phase {
  const Phase();

  factory Phase.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $PhaseCodec codec = $PhaseCodec();

  static const $Phase values = $Phase();

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

class $Phase {
  const $Phase();

  ApplyExtrinsic applyExtrinsic(int value0) {
    return ApplyExtrinsic(value0);
  }

  Finalization finalization() {
    return Finalization();
  }

  Initialization initialization() {
    return Initialization();
  }
}

class $PhaseCodec with _i1.Codec<Phase> {
  const $PhaseCodec();

  @override
  Phase decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ApplyExtrinsic._decode(input);
      case 1:
        return const Finalization();
      case 2:
        return const Initialization();
      default:
        throw Exception('Phase: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Phase value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case ApplyExtrinsic:
        (value as ApplyExtrinsic).encodeTo(output);
        break;
      case Finalization:
        (value as Finalization).encodeTo(output);
        break;
      case Initialization:
        (value as Initialization).encodeTo(output);
        break;
      default:
        throw Exception(
            'Phase: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Phase value) {
    switch (value.runtimeType) {
      case ApplyExtrinsic:
        return (value as ApplyExtrinsic)._sizeHint();
      case Finalization:
        return 1;
      case Initialization:
        return 1;
      default:
        throw Exception(
            'Phase: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class ApplyExtrinsic extends Phase {
  const ApplyExtrinsic(this.value0);

  factory ApplyExtrinsic._decode(_i1.Input input) {
    return ApplyExtrinsic(_i1.U32Codec.codec.decode(input));
  }

  /// u32
  final int value0;

  @override
  Map<String, int> toJson() => {'ApplyExtrinsic': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ApplyExtrinsic && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Finalization extends Phase {
  const Finalization();

  @override
  Map<String, dynamic> toJson() => {'Finalization': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Finalization;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Initialization extends Phase {
  const Initialization();

  @override
  Map<String, dynamic> toJson() => {'Initialization': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Initialization;

  @override
  int get hashCode => runtimeType.hashCode;
}

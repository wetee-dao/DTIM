// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class Pledge {
  const Pledge();

  factory Pledge.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $PledgeCodec codec = $PledgeCodec();

  static const $Pledge values = $Pledge();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, BigInt> toJson();
}

class $Pledge {
  const $Pledge();

  FungToken fungToken(BigInt value0) {
    return FungToken(value0);
  }
}

class $PledgeCodec with _i1.Codec<Pledge> {
  const $PledgeCodec();

  @override
  Pledge decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return FungToken._decode(input);
      default:
        throw Exception('Pledge: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Pledge value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case FungToken:
        (value as FungToken).encodeTo(output);
        break;
      default:
        throw Exception(
            'Pledge: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Pledge value) {
    switch (value.runtimeType) {
      case FungToken:
        return (value as FungToken)._sizeHint();
      default:
        throw Exception(
            'Pledge: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class FungToken extends Pledge {
  const FungToken(this.value0);

  factory FungToken._decode(_i1.Input input) {
    return FungToken(_i1.U128Codec.codec.decode(input));
  }

  /// Balance
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'FungToken': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U128Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
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
      other is FungToken && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../pallet_contracts/pallet/hold_reason.dart' as _i3;

abstract class RuntimeHoldReason {
  const RuntimeHoldReason();

  factory RuntimeHoldReason.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $RuntimeHoldReasonCodec codec = $RuntimeHoldReasonCodec();

  static const $RuntimeHoldReason values = $RuntimeHoldReason();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, String> toJson();
}

class $RuntimeHoldReason {
  const $RuntimeHoldReason();

  Contracts contracts(_i3.HoldReason value0) {
    return Contracts(value0);
  }
}

class $RuntimeHoldReasonCodec with _i1.Codec<RuntimeHoldReason> {
  const $RuntimeHoldReasonCodec();

  @override
  RuntimeHoldReason decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 22:
        return Contracts._decode(input);
      default:
        throw Exception('RuntimeHoldReason: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    RuntimeHoldReason value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Contracts:
        (value as Contracts).encodeTo(output);
        break;
      default:
        throw Exception(
            'RuntimeHoldReason: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(RuntimeHoldReason value) {
    switch (value.runtimeType) {
      case Contracts:
        return (value as Contracts)._sizeHint();
      default:
        throw Exception(
            'RuntimeHoldReason: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Contracts extends RuntimeHoldReason {
  const Contracts(this.value0);

  factory Contracts._decode(_i1.Input input) {
    return Contracts(_i3.HoldReason.codec.decode(input));
  }

  /// pallet_contracts::HoldReason
  final _i3.HoldReason value0;

  @override
  Map<String, String> toJson() => {'Contracts': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.HoldReason.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i3.HoldReason.codec.encodeTo(
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
      other is Contracts && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

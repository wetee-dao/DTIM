// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../sp_core/ecdsa/signature.dart' as _i5;
import '../sp_core/ed25519/signature.dart' as _i3;
import '../sp_core/sr25519/signature.dart' as _i4;

abstract class MultiSignature {
  const MultiSignature();

  factory MultiSignature.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $MultiSignatureCodec codec = $MultiSignatureCodec();

  static const $MultiSignature values = $MultiSignature();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, List<int>> toJson();
}

class $MultiSignature {
  const $MultiSignature();

  Ed25519 ed25519(_i3.Signature value0) {
    return Ed25519(value0);
  }

  Sr25519 sr25519(_i4.Signature value0) {
    return Sr25519(value0);
  }

  Ecdsa ecdsa(_i5.Signature value0) {
    return Ecdsa(value0);
  }
}

class $MultiSignatureCodec with _i1.Codec<MultiSignature> {
  const $MultiSignatureCodec();

  @override
  MultiSignature decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Ed25519._decode(input);
      case 1:
        return Sr25519._decode(input);
      case 2:
        return Ecdsa._decode(input);
      default:
        throw Exception('MultiSignature: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    MultiSignature value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Ed25519:
        (value as Ed25519).encodeTo(output);
        break;
      case Sr25519:
        (value as Sr25519).encodeTo(output);
        break;
      case Ecdsa:
        (value as Ecdsa).encodeTo(output);
        break;
      default:
        throw Exception(
            'MultiSignature: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(MultiSignature value) {
    switch (value.runtimeType) {
      case Ed25519:
        return (value as Ed25519)._sizeHint();
      case Sr25519:
        return (value as Sr25519)._sizeHint();
      case Ecdsa:
        return (value as Ecdsa)._sizeHint();
      default:
        throw Exception(
            'MultiSignature: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Ed25519 extends MultiSignature {
  const Ed25519(this.value0);

  factory Ed25519._decode(_i1.Input input) {
    return Ed25519(const _i1.U8ArrayCodec(64).decode(input));
  }

  /// ed25519::Signature
  final _i3.Signature value0;

  @override
  Map<String, List<int>> toJson() => {'Ed25519': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.SignatureCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(64).encodeTo(
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
      other is Ed25519 &&
          _i6.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Sr25519 extends MultiSignature {
  const Sr25519(this.value0);

  factory Sr25519._decode(_i1.Input input) {
    return Sr25519(const _i1.U8ArrayCodec(64).decode(input));
  }

  /// sr25519::Signature
  final _i4.Signature value0;

  @override
  Map<String, List<int>> toJson() => {'Sr25519': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i4.SignatureCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(64).encodeTo(
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
      other is Sr25519 &&
          _i6.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Ecdsa extends MultiSignature {
  const Ecdsa(this.value0);

  factory Ecdsa._decode(_i1.Input input) {
    return Ecdsa(const _i1.U8ArrayCodec(65).decode(input));
  }

  /// ecdsa::Signature
  final _i5.Signature value0;

  @override
  Map<String, List<int>> toJson() => {'Ecdsa': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.SignatureCodec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    const _i1.U8ArrayCodec(65).encodeTo(
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
      other is Ecdsa &&
          _i6.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

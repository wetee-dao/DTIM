// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../wetee_primitives/types/cr.dart' as _i2;

class ProofOfWork {
  const ProofOfWork({
    required this.logHash,
    required this.cr,
    required this.crHash,
    required this.publicKey,
  });

  factory ProofOfWork.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> logHash;

  /// Cr
  final _i2.Cr cr;

  /// Vec<u8>
  final List<int> crHash;

  /// Vec<u8>
  final List<int> publicKey;

  static const $ProofOfWorkCodec codec = $ProofOfWorkCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'logHash': logHash,
        'cr': cr.toJson(),
        'crHash': crHash,
        'publicKey': publicKey,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProofOfWork &&
          _i4.listsEqual(
            other.logHash,
            logHash,
          ) &&
          other.cr == cr &&
          _i4.listsEqual(
            other.crHash,
            crHash,
          ) &&
          _i4.listsEqual(
            other.publicKey,
            publicKey,
          );

  @override
  int get hashCode => Object.hash(
        logHash,
        cr,
        crHash,
        publicKey,
      );
}

class $ProofOfWorkCodec with _i1.Codec<ProofOfWork> {
  const $ProofOfWorkCodec();

  @override
  void encodeTo(
    ProofOfWork obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.logHash,
      output,
    );
    _i2.Cr.codec.encodeTo(
      obj.cr,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.crHash,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.publicKey,
      output,
    );
  }

  @override
  ProofOfWork decode(_i1.Input input) {
    return ProofOfWork(
      logHash: _i1.U8SequenceCodec.codec.decode(input),
      cr: _i2.Cr.codec.decode(input),
      crHash: _i1.U8SequenceCodec.codec.decode(input),
      publicKey: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(ProofOfWork obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.logHash);
    size = size + _i2.Cr.codec.sizeHint(obj.cr);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.crHash);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.publicKey);
    return size;
  }
}

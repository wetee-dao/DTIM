// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class ProofOfCluster {
  const ProofOfCluster({required this.publicKey});

  factory ProofOfCluster.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> publicKey;

  static const $ProofOfClusterCodec codec = $ProofOfClusterCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<int>> toJson() => {'publicKey': publicKey};

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProofOfCluster &&
          _i3.listsEqual(
            other.publicKey,
            publicKey,
          );

  @override
  int get hashCode => publicKey.hashCode;
}

class $ProofOfClusterCodec with _i1.Codec<ProofOfCluster> {
  const $ProofOfClusterCodec();

  @override
  void encodeTo(
    ProofOfCluster obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.publicKey,
      output,
    );
  }

  @override
  ProofOfCluster decode(_i1.Input input) {
    return ProofOfCluster(publicKey: _i1.U8SequenceCodec.codec.decode(input));
  }

  @override
  int sizeHint(ProofOfCluster obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.publicKey);
    return size;
  }
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../sp_core/crypto/account_id32.dart' as _i2;

class K8sCluster {
  const K8sCluster({
    required this.creator,
    required this.startBlock,
    required this.name,
    required this.image,
    required this.ip,
    required this.port,
    required this.status,
  });

  factory K8sCluster.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccountId
  final _i2.AccountId32 creator;

  /// BlockNumber
  final BigInt startBlock;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<Vec<u8>>
  final List<List<int>> ip;

  /// Vec<u32>
  final List<int> port;

  /// u8
  final int status;

  static const $K8sClusterCodec codec = $K8sClusterCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'creator': creator.toList(),
        'startBlock': startBlock,
        'name': name,
        'image': image,
        'ip': ip.map((value) => value).toList(),
        'port': port,
        'status': status,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is K8sCluster &&
          _i4.listsEqual(
            other.creator,
            creator,
          ) &&
          other.startBlock == startBlock &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.image,
            image,
          ) &&
          _i4.listsEqual(
            other.ip,
            ip,
          ) &&
          _i4.listsEqual(
            other.port,
            port,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        creator,
        startBlock,
        name,
        image,
        ip,
        port,
        status,
      );
}

class $K8sClusterCodec with _i1.Codec<K8sCluster> {
  const $K8sClusterCodec();

  @override
  void encodeTo(
    K8sCluster obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.creator,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.startBlock,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.image,
      output,
    );
    const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      obj.ip,
      output,
    );
    _i1.U32SequenceCodec.codec.encodeTo(
      obj.port,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  K8sCluster decode(_i1.Input input) {
    return K8sCluster(
      creator: const _i1.U8ArrayCodec(32).decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      ip: const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      port: _i1.U32SequenceCodec.codec.decode(input),
      status: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(K8sCluster obj) {
    int size = 0;
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.image);
    size = size +
        const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(obj.ip);
    size = size + _i1.U32SequenceCodec.codec.sizeHint(obj.port);
    size = size + _i1.U8Codec.codec.sizeHint(obj.status);
    return size;
  }
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i2;
import '../../wetee_primitives/types/ip.dart' as _i3;

class K8sCluster {
  const K8sCluster({
    required this.id,
    required this.account,
    required this.startBlock,
    this.stopBlock,
    this.terminalBlock,
    required this.name,
    required this.ip,
    required this.port,
    required this.status,
  });

  factory K8sCluster.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// ClusterId
  final BigInt id;

  /// AccountId
  final _i2.AccountId32 account;

  /// BlockNumber
  final BigInt startBlock;

  /// Option<BlockNumber>
  final BigInt? stopBlock;

  /// Option<BlockNumber>
  final BigInt? terminalBlock;

  /// Vec<u8>
  final List<int> name;

  /// Vec<Ip>
  final List<_i3.Ip> ip;

  /// u32
  final int port;

  /// u8
  final int status;

  static const $K8sClusterCodec codec = $K8sClusterCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'account': account.toList(),
        'startBlock': startBlock,
        'stopBlock': stopBlock,
        'terminalBlock': terminalBlock,
        'name': name,
        'ip': ip.map((value) => value.toJson()).toList(),
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
          other.id == id &&
          _i5.listsEqual(
            other.account,
            account,
          ) &&
          other.startBlock == startBlock &&
          other.stopBlock == stopBlock &&
          other.terminalBlock == terminalBlock &&
          _i5.listsEqual(
            other.name,
            name,
          ) &&
          _i5.listsEqual(
            other.ip,
            ip,
          ) &&
          other.port == port &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        account,
        startBlock,
        stopBlock,
        terminalBlock,
        name,
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
    _i1.U64Codec.codec.encodeTo(
      obj.id,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.account,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.startBlock,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).encodeTo(
      obj.stopBlock,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).encodeTo(
      obj.terminalBlock,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    const _i1.SequenceCodec<_i3.Ip>(_i3.Ip.codec).encodeTo(
      obj.ip,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
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
      id: _i1.U64Codec.codec.decode(input),
      account: const _i1.U8ArrayCodec(32).decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      stopBlock:
          const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).decode(input),
      terminalBlock:
          const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      ip: const _i1.SequenceCodec<_i3.Ip>(_i3.Ip.codec).decode(input),
      port: _i1.U32Codec.codec.decode(input),
      status: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(K8sCluster obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.account);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec)
            .sizeHint(obj.stopBlock);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec)
            .sizeHint(obj.terminalBlock);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size =
        size + const _i1.SequenceCodec<_i3.Ip>(_i3.Ip.codec).sizeHint(obj.ip);
    size = size + _i1.U32Codec.codec.sizeHint(obj.port);
    size = size + _i1.U8Codec.codec.sizeHint(obj.status);
    return size;
  }
}

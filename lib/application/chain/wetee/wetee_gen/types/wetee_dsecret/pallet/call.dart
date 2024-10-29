// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../sp_runtime/multi_signature.dart' as _i4;
import '../../wetee_primitives/types/p2_p_addr.dart' as _i6;
import '../../wetee_primitives/types/work_id.dart' as _i5;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  RegisterNode registerNode({required _i3.AccountId32 sender}) {
    return RegisterNode(sender: sender);
  }

  UploadCode uploadCode({
    required List<int> signature,
    required List<int> signer,
  }) {
    return UploadCode(
      signature: signature,
      signer: signer,
    );
  }

  UploadClusterProof uploadClusterProof({
    required BigInt cid,
    required List<int> report,
    required List<_i3.AccountId32> pubs,
    required List<_i4.MultiSignature> sigs,
  }) {
    return UploadClusterProof(
      cid: cid,
      report: report,
      pubs: pubs,
      sigs: sigs,
    );
  }

  WorkLaunch workLaunch({
    required _i5.WorkId work,
    List<int>? report,
    required _i3.AccountId32 deployKey,
  }) {
    return WorkLaunch(
      work: work,
      report: report,
      deployKey: deployKey,
    );
  }

  SetNodePubServer setNodePubServer({
    required BigInt id,
    required _i6.P2PAddr server,
  }) {
    return SetNodePubServer(
      id: id,
      server: server,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return RegisterNode._decode(input);
      case 2:
        return UploadCode._decode(input);
      case 3:
        return UploadClusterProof._decode(input);
      case 4:
        return WorkLaunch._decode(input);
      case 5:
        return SetNodePubServer._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case RegisterNode:
        (value as RegisterNode).encodeTo(output);
        break;
      case UploadCode:
        (value as UploadCode).encodeTo(output);
        break;
      case UploadClusterProof:
        (value as UploadClusterProof).encodeTo(output);
        break;
      case WorkLaunch:
        (value as WorkLaunch).encodeTo(output);
        break;
      case SetNodePubServer:
        (value as SetNodePubServer).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case RegisterNode:
        return (value as RegisterNode)._sizeHint();
      case UploadCode:
        return (value as UploadCode)._sizeHint();
      case UploadClusterProof:
        return (value as UploadClusterProof)._sizeHint();
      case WorkLaunch:
        return (value as WorkLaunch)._sizeHint();
      case SetNodePubServer:
        return (value as SetNodePubServer)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// 注册 dkg 节点
/// register dkg node
class RegisterNode extends Call {
  const RegisterNode({required this.sender});

  factory RegisterNode._decode(_i1.Input input) {
    return RegisterNode(sender: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i3.AccountId32 sender;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'register_node': {'sender': sender.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(sender);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      sender,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RegisterNode &&
          _i7.listsEqual(
            other.sender,
            sender,
          );

  @override
  int get hashCode => sender.hashCode;
}

/// 上传共识节点代码
/// update consensus node code
class UploadCode extends Call {
  const UploadCode({
    required this.signature,
    required this.signer,
  });

  factory UploadCode._decode(_i1.Input input) {
    return UploadCode(
      signature: _i1.U8SequenceCodec.codec.decode(input),
      signer: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> signature;

  /// Vec<u8>
  final List<int> signer;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'upload_code': {
          'signature': signature,
          'signer': signer,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(signature);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(signer);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      signature,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      signer,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UploadCode &&
          _i7.listsEqual(
            other.signature,
            signature,
          ) &&
          _i7.listsEqual(
            other.signer,
            signer,
          );

  @override
  int get hashCode => Object.hash(
        signature,
        signer,
      );
}

/// 上传共识节点代码
/// update consensus node code
class UploadClusterProof extends Call {
  const UploadClusterProof({
    required this.cid,
    required this.report,
    required this.pubs,
    required this.sigs,
  });

  factory UploadClusterProof._decode(_i1.Input input) {
    return UploadClusterProof(
      cid: _i1.U64Codec.codec.decode(input),
      report: _i1.U8SequenceCodec.codec.decode(input),
      pubs: const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
          .decode(input),
      sigs:
          const _i1.SequenceCodec<_i4.MultiSignature>(_i4.MultiSignature.codec)
              .decode(input),
    );
  }

  /// ClusterId
  final BigInt cid;

  /// Vec<u8>
  final List<int> report;

  /// Vec<T::AccountId>
  final List<_i3.AccountId32> pubs;

  /// Vec<T::OffchainSignature>
  final List<_i4.MultiSignature> sigs;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'upload_cluster_proof': {
          'cid': cid,
          'report': report,
          'pubs': pubs.map((value) => value.toList()).toList(),
          'sigs': sigs.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(cid);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(report);
    size = size +
        const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(pubs);
    size = size +
        const _i1.SequenceCodec<_i4.MultiSignature>(_i4.MultiSignature.codec)
            .sizeHint(sigs);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      cid,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      report,
      output,
    );
    const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      pubs,
      output,
    );
    const _i1.SequenceCodec<_i4.MultiSignature>(_i4.MultiSignature.codec)
        .encodeTo(
      sigs,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UploadClusterProof &&
          other.cid == cid &&
          _i7.listsEqual(
            other.report,
            report,
          ) &&
          _i7.listsEqual(
            other.pubs,
            pubs,
          ) &&
          _i7.listsEqual(
            other.sigs,
            sigs,
          );

  @override
  int get hashCode => Object.hash(
        cid,
        report,
        pubs,
        sigs,
      );
}

/// 上传 devloper，report hash 启动应用
class WorkLaunch extends Call {
  const WorkLaunch({
    required this.work,
    this.report,
    required this.deployKey,
  });

  factory WorkLaunch._decode(_i1.Input input) {
    return WorkLaunch(
      work: _i5.WorkId.codec.decode(input),
      report: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      deployKey: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// WorkId
  final _i5.WorkId work;

  /// Option<Vec<u8>>
  final List<int>? report;

  /// T::AccountId
  final _i3.AccountId32 deployKey;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'work_launch': {
          'work': work.toJson(),
          'report': report,
          'deployKey': deployKey.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i5.WorkId.codec.sizeHint(work);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(report);
    size = size + const _i3.AccountId32Codec().sizeHint(deployKey);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i5.WorkId.codec.encodeTo(
      work,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      report,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      deployKey,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WorkLaunch &&
          other.work == work &&
          other.report == report &&
          _i7.listsEqual(
            other.deployKey,
            deployKey,
          );

  @override
  int get hashCode => Object.hash(
        work,
        report,
        deployKey,
      );
}

/// 设置节点公网服务
/// set node pub server
class SetNodePubServer extends Call {
  const SetNodePubServer({
    required this.id,
    required this.server,
  });

  factory SetNodePubServer._decode(_i1.Input input) {
    return SetNodePubServer(
      id: _i1.U64Codec.codec.decode(input),
      server: _i6.P2PAddr.codec.decode(input),
    );
  }

  /// u64
  final BigInt id;

  /// P2PAddr<T::AccountId>
  final _i6.P2PAddr server;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_node_pub_server': {
          'id': id,
          'server': server.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    size = size + _i6.P2PAddr.codec.sizeHint(server);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
    _i6.P2PAddr.codec.encodeTo(
      server,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetNodePubServer && other.id == id && other.server == server;

  @override
  int get hashCode => Object.hash(
        id,
        server,
      );
}

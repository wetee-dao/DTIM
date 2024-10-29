// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../wetee_primitives/types/ip.dart' as _i3;
import '../../wetee_primitives/types/p2_p_addr.dart' as _i6;
import '../../wetee_primitives/types/work_id.dart' as _i4;
import '../types/proof_of_work.dart' as _i5;

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

  ClusterRegister clusterRegister({
    required List<int> name,
    required List<_i3.Ip> ip,
    required int port,
    required int level,
  }) {
    return ClusterRegister(
      name: name,
      ip: ip,
      port: port,
      level: level,
    );
  }

  ClusterMortgage clusterMortgage({
    required BigInt id,
    required int cpu,
    required int mem,
    required int cvmCpu,
    required int cvmMem,
    required int disk,
    required int gpu,
    required BigInt deposit,
  }) {
    return ClusterMortgage(
      id: id,
      cpu: cpu,
      mem: mem,
      cvmCpu: cvmCpu,
      cvmMem: cvmMem,
      disk: disk,
      gpu: gpu,
      deposit: deposit,
    );
  }

  ClusterUnmortgage clusterUnmortgage({
    required BigInt id,
    required BigInt blockNum,
  }) {
    return ClusterUnmortgage(
      id: id,
      blockNum: blockNum,
    );
  }

  WorkProofUpload workProofUpload({
    required _i4.WorkId workId,
    _i5.ProofOfWork? proof,
    List<int>? report,
  }) {
    return WorkProofUpload(
      workId: workId,
      proof: proof,
      report: report,
    );
  }

  ClusterWithdrawal clusterWithdrawal({
    required _i4.WorkId workId,
    required BigInt amount,
  }) {
    return ClusterWithdrawal(
      workId: workId,
      amount: amount,
    );
  }

  ClusterStop clusterStop({required BigInt id}) {
    return ClusterStop(id: id);
  }

  ClusterReport clusterReport({
    required BigInt clusterId,
    required _i4.WorkId workId,
    required List<int> reason,
  }) {
    return ClusterReport(
      clusterId: clusterId,
      workId: workId,
      reason: reason,
    );
  }

  ReportClose reportClose({
    required BigInt clusterId,
    required _i4.WorkId workId,
  }) {
    return ReportClose(
      clusterId: clusterId,
      workId: workId,
    );
  }

  WorkStop workStop({required _i4.WorkId workId}) {
    return WorkStop(workId: workId);
  }

  SetBootPeers setBootPeers({required List<_i6.P2PAddr> boots}) {
    return SetBootPeers(boots: boots);
  }

  SetStage setStage({required int stage}) {
    return SetStage(stage: stage);
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
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return ClusterRegister._decode(input);
      case 2:
        return ClusterMortgage._decode(input);
      case 3:
        return ClusterUnmortgage._decode(input);
      case 5:
        return WorkProofUpload._decode(input);
      case 6:
        return ClusterWithdrawal._decode(input);
      case 7:
        return ClusterStop._decode(input);
      case 8:
        return ClusterReport._decode(input);
      case 9:
        return ReportClose._decode(input);
      case 10:
        return WorkStop._decode(input);
      case 11:
        return SetBootPeers._decode(input);
      case 12:
        return SetStage._decode(input);
      case 14:
        return UploadCode._decode(input);
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
      case ClusterRegister:
        (value as ClusterRegister).encodeTo(output);
        break;
      case ClusterMortgage:
        (value as ClusterMortgage).encodeTo(output);
        break;
      case ClusterUnmortgage:
        (value as ClusterUnmortgage).encodeTo(output);
        break;
      case WorkProofUpload:
        (value as WorkProofUpload).encodeTo(output);
        break;
      case ClusterWithdrawal:
        (value as ClusterWithdrawal).encodeTo(output);
        break;
      case ClusterStop:
        (value as ClusterStop).encodeTo(output);
        break;
      case ClusterReport:
        (value as ClusterReport).encodeTo(output);
        break;
      case ReportClose:
        (value as ReportClose).encodeTo(output);
        break;
      case WorkStop:
        (value as WorkStop).encodeTo(output);
        break;
      case SetBootPeers:
        (value as SetBootPeers).encodeTo(output);
        break;
      case SetStage:
        (value as SetStage).encodeTo(output);
        break;
      case UploadCode:
        (value as UploadCode).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case ClusterRegister:
        return (value as ClusterRegister)._sizeHint();
      case ClusterMortgage:
        return (value as ClusterMortgage)._sizeHint();
      case ClusterUnmortgage:
        return (value as ClusterUnmortgage)._sizeHint();
      case WorkProofUpload:
        return (value as WorkProofUpload)._sizeHint();
      case ClusterWithdrawal:
        return (value as ClusterWithdrawal)._sizeHint();
      case ClusterStop:
        return (value as ClusterStop)._sizeHint();
      case ClusterReport:
        return (value as ClusterReport)._sizeHint();
      case ReportClose:
        return (value as ReportClose)._sizeHint();
      case WorkStop:
        return (value as WorkStop)._sizeHint();
      case SetBootPeers:
        return (value as SetBootPeers)._sizeHint();
      case SetStage:
        return (value as SetStage)._sizeHint();
      case UploadCode:
        return (value as UploadCode)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Worker cluster register
/// 集群注册
class ClusterRegister extends Call {
  const ClusterRegister({
    required this.name,
    required this.ip,
    required this.port,
    required this.level,
  });

  factory ClusterRegister._decode(_i1.Input input) {
    return ClusterRegister(
      name: _i1.U8SequenceCodec.codec.decode(input),
      ip: const _i1.SequenceCodec<_i3.Ip>(_i3.Ip.codec).decode(input),
      port: _i1.U32Codec.codec.decode(input),
      level: _i1.U8Codec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<Ip>
  final List<_i3.Ip> ip;

  /// u32
  final int port;

  /// u8
  final int level;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cluster_register': {
          'name': name,
          'ip': ip.map((value) => value.toJson()).toList(),
          'port': port,
          'level': level,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + const _i1.SequenceCodec<_i3.Ip>(_i3.Ip.codec).sizeHint(ip);
    size = size + _i1.U32Codec.codec.sizeHint(port);
    size = size + _i1.U8Codec.codec.sizeHint(level);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    const _i1.SequenceCodec<_i3.Ip>(_i3.Ip.codec).encodeTo(
      ip,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      port,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      level,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterRegister &&
          _i7.listsEqual(
            other.name,
            name,
          ) &&
          _i7.listsEqual(
            other.ip,
            ip,
          ) &&
          other.port == port &&
          other.level == level;

  @override
  int get hashCode => Object.hash(
        name,
        ip,
        port,
        level,
      );
}

/// Worker cluster mortgage
/// 质押硬件
class ClusterMortgage extends Call {
  const ClusterMortgage({
    required this.id,
    required this.cpu,
    required this.mem,
    required this.cvmCpu,
    required this.cvmMem,
    required this.disk,
    required this.gpu,
    required this.deposit,
  });

  factory ClusterMortgage._decode(_i1.Input input) {
    return ClusterMortgage(
      id: _i1.U64Codec.codec.decode(input),
      cpu: _i1.U32Codec.codec.decode(input),
      mem: _i1.U32Codec.codec.decode(input),
      cvmCpu: _i1.U32Codec.codec.decode(input),
      cvmMem: _i1.U32Codec.codec.decode(input),
      disk: _i1.U32Codec.codec.decode(input),
      gpu: _i1.U32Codec.codec.decode(input),
      deposit: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt id;

  /// u32
  final int cpu;

  /// u32
  final int mem;

  /// u32
  final int cvmCpu;

  /// u32
  final int cvmMem;

  /// u32
  final int disk;

  /// u32
  final int gpu;

  /// BalanceOf<T>
  final BigInt deposit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cluster_mortgage': {
          'id': id,
          'cpu': cpu,
          'mem': mem,
          'cvmCpu': cvmCpu,
          'cvmMem': cvmMem,
          'disk': disk,
          'gpu': gpu,
          'deposit': deposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    size = size + _i1.U32Codec.codec.sizeHint(cpu);
    size = size + _i1.U32Codec.codec.sizeHint(mem);
    size = size + _i1.U32Codec.codec.sizeHint(cvmCpu);
    size = size + _i1.U32Codec.codec.sizeHint(cvmMem);
    size = size + _i1.U32Codec.codec.sizeHint(disk);
    size = size + _i1.U32Codec.codec.sizeHint(gpu);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(deposit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      cpu,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      mem,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      cvmCpu,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      cvmMem,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      disk,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      gpu,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      deposit,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterMortgage &&
          other.id == id &&
          other.cpu == cpu &&
          other.mem == mem &&
          other.cvmCpu == cvmCpu &&
          other.cvmMem == cvmMem &&
          other.disk == disk &&
          other.gpu == gpu &&
          other.deposit == deposit;

  @override
  int get hashCode => Object.hash(
        id,
        cpu,
        mem,
        cvmCpu,
        cvmMem,
        disk,
        gpu,
        deposit,
      );
}

/// Worker cluster unmortgage
/// 解抵押
class ClusterUnmortgage extends Call {
  const ClusterUnmortgage({
    required this.id,
    required this.blockNum,
  });

  factory ClusterUnmortgage._decode(_i1.Input input) {
    return ClusterUnmortgage(
      id: _i1.U64Codec.codec.decode(input),
      blockNum: _i1.U64Codec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt id;

  /// BlockNumberFor<T>
  final BigInt blockNum;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'cluster_unmortgage': {
          'id': id,
          'blockNum': blockNum,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    size = size + _i1.U64Codec.codec.sizeHint(blockNum);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      blockNum,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterUnmortgage &&
          other.id == id &&
          other.blockNum == blockNum;

  @override
  int get hashCode => Object.hash(
        id,
        blockNum,
      );
}

/// Work proof of work data upload
/// 提交工作证明
class WorkProofUpload extends Call {
  const WorkProofUpload({
    required this.workId,
    this.proof,
    this.report,
  });

  factory WorkProofUpload._decode(_i1.Input input) {
    return WorkProofUpload(
      workId: _i4.WorkId.codec.decode(input),
      proof: const _i1.OptionCodec<_i5.ProofOfWork>(_i5.ProofOfWork.codec)
          .decode(input),
      report: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
    );
  }

  /// WorkId
  final _i4.WorkId workId;

  /// Option<ProofOfWork>
  final _i5.ProofOfWork? proof;

  /// Option<Vec<u8>>
  final List<int>? report;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'work_proof_upload': {
          'workId': workId.toJson(),
          'proof': proof?.toJson(),
          'report': report,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WorkId.codec.sizeHint(workId);
    size = size +
        const _i1.OptionCodec<_i5.ProofOfWork>(_i5.ProofOfWork.codec)
            .sizeHint(proof);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(report);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
    const _i1.OptionCodec<_i5.ProofOfWork>(_i5.ProofOfWork.codec).encodeTo(
      proof,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      report,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WorkProofUpload &&
          other.workId == workId &&
          other.proof == proof &&
          other.report == report;

  @override
  int get hashCode => Object.hash(
        workId,
        proof,
        report,
      );
}

/// Worker cluster withdrawal
/// 提现余额
class ClusterWithdrawal extends Call {
  const ClusterWithdrawal({
    required this.workId,
    required this.amount,
  });

  factory ClusterWithdrawal._decode(_i1.Input input) {
    return ClusterWithdrawal(
      workId: _i4.WorkId.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// WorkId
  final _i4.WorkId workId;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cluster_withdrawal': {
          'workId': workId.toJson(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WorkId.codec.sizeHint(workId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterWithdrawal &&
          other.workId == workId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        workId,
        amount,
      );
}

/// Worker cluster stop
/// 停止集群
class ClusterStop extends Call {
  const ClusterStop({required this.id});

  factory ClusterStop._decode(_i1.Input input) {
    return ClusterStop(id: _i1.U64Codec.codec.decode(input));
  }

  /// ClusterId
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'cluster_stop': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterStop && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// Worker cluster report
/// 投诉集群
class ClusterReport extends Call {
  const ClusterReport({
    required this.clusterId,
    required this.workId,
    required this.reason,
  });

  factory ClusterReport._decode(_i1.Input input) {
    return ClusterReport(
      clusterId: _i1.U64Codec.codec.decode(input),
      workId: _i4.WorkId.codec.decode(input),
      reason: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// WorkId
  final _i4.WorkId workId;

  /// Vec<u8>
  final List<int> reason;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cluster_report': {
          'clusterId': clusterId,
          'workId': workId.toJson(),
          'reason': reason,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    size = size + _i4.WorkId.codec.sizeHint(workId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(reason);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      clusterId,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      reason,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterReport &&
          other.clusterId == clusterId &&
          other.workId == workId &&
          _i7.listsEqual(
            other.reason,
            reason,
          );

  @override
  int get hashCode => Object.hash(
        clusterId,
        workId,
        reason,
      );
}

/// Worker report stop
/// 停止投诉
class ReportClose extends Call {
  const ReportClose({
    required this.clusterId,
    required this.workId,
  });

  factory ReportClose._decode(_i1.Input input) {
    return ReportClose(
      clusterId: _i1.U64Codec.codec.decode(input),
      workId: _i4.WorkId.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// WorkId
  final _i4.WorkId workId;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'report_close': {
          'clusterId': clusterId,
          'workId': workId.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    size = size + _i4.WorkId.codec.sizeHint(workId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      clusterId,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReportClose &&
          other.clusterId == clusterId &&
          other.workId == workId;

  @override
  int get hashCode => Object.hash(
        clusterId,
        workId,
      );
}

/// Work stop
/// 停止应用
class WorkStop extends Call {
  const WorkStop({required this.workId});

  factory WorkStop._decode(_i1.Input input) {
    return WorkStop(workId: _i4.WorkId.codec.decode(input));
  }

  /// WorkId
  final _i4.WorkId workId;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'work_stop': {'workId': workId.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WorkId.codec.sizeHint(workId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WorkStop && other.workId == workId;

  @override
  int get hashCode => workId.hashCode;
}

/// Set boot peers
/// 设置引导节点
class SetBootPeers extends Call {
  const SetBootPeers({required this.boots});

  factory SetBootPeers._decode(_i1.Input input) {
    return SetBootPeers(
        boots: const _i1.SequenceCodec<_i6.P2PAddr>(_i6.P2PAddr.codec)
            .decode(input));
  }

  /// Vec<P2PAddr<T::AccountId>>
  final List<_i6.P2PAddr> boots;

  @override
  Map<String, Map<String, List<Map<String, dynamic>>>> toJson() => {
        'set_boot_peers': {
          'boots': boots.map((value) => value.toJson()).toList()
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.SequenceCodec<_i6.P2PAddr>(_i6.P2PAddr.codec).sizeHint(boots);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    const _i1.SequenceCodec<_i6.P2PAddr>(_i6.P2PAddr.codec).encodeTo(
      boots,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetBootPeers &&
          _i7.listsEqual(
            other.boots,
            boots,
          );

  @override
  int get hashCode => boots.hashCode;
}

class SetStage extends Call {
  const SetStage({required this.stage});

  factory SetStage._decode(_i1.Input input) {
    return SetStage(stage: _i1.U32Codec.codec.decode(input));
  }

  /// u32
  final int stage;

  @override
  Map<String, Map<String, int>> toJson() => {
        'set_stage': {'stage': stage}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(stage);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      stage,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetStage && other.stage == stage;

  @override
  int get hashCode => stage.hashCode;
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
      14,
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

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../wetee_primitives/types/work_id.dart' as _i5;
import '../ip.dart' as _i3;
import '../proof_of_cluster.dart' as _i4;
import '../proof_of_work.dart' as _i6;

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

  ClusterProofUpload clusterProofUpload({
    required BigInt id,
    required _i4.ProofOfCluster proof,
  }) {
    return ClusterProofUpload(
      id: id,
      proof: proof,
    );
  }

  ClusterMortgage clusterMortgage({
    required BigInt id,
    required int cpu,
    required int mem,
    required int disk,
    required BigInt deposit,
  }) {
    return ClusterMortgage(
      id: id,
      cpu: cpu,
      mem: mem,
      disk: disk,
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
    required _i5.WorkId workId,
    required _i6.ProofOfWork proof,
  }) {
    return WorkProofUpload(
      workId: workId,
      proof: proof,
    );
  }

  ClusterWithdrawal clusterWithdrawal({
    required _i5.WorkId workId,
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
    required _i5.WorkId workId,
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
    required _i5.WorkId workId,
  }) {
    return ReportClose(
      clusterId: clusterId,
      workId: workId,
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
      case 4:
        return ClusterProofUpload._decode(input);
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
      case ClusterProofUpload:
        (value as ClusterProofUpload).encodeTo(output);
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
      case ClusterProofUpload:
        return (value as ClusterProofUpload)._sizeHint();
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
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::cluster_register`].
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

/// See [`Pallet::cluster_proof_upload`].
class ClusterProofUpload extends Call {
  const ClusterProofUpload({
    required this.id,
    required this.proof,
  });

  factory ClusterProofUpload._decode(_i1.Input input) {
    return ClusterProofUpload(
      id: _i1.U64Codec.codec.decode(input),
      proof: _i4.ProofOfCluster.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt id;

  /// ProofOfCluster
  final _i4.ProofOfCluster proof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cluster_proof_upload': {
          'id': id,
          'proof': proof.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    size = size + _i4.ProofOfCluster.codec.sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
    _i4.ProofOfCluster.codec.encodeTo(
      proof,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterProofUpload && other.id == id && other.proof == proof;

  @override
  int get hashCode => Object.hash(
        id,
        proof,
      );
}

/// See [`Pallet::cluster_mortgage`].
class ClusterMortgage extends Call {
  const ClusterMortgage({
    required this.id,
    required this.cpu,
    required this.mem,
    required this.disk,
    required this.deposit,
  });

  factory ClusterMortgage._decode(_i1.Input input) {
    return ClusterMortgage(
      id: _i1.U64Codec.codec.decode(input),
      cpu: _i1.U16Codec.codec.decode(input),
      mem: _i1.U16Codec.codec.decode(input),
      disk: _i1.U16Codec.codec.decode(input),
      deposit: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt id;

  /// u16
  final int cpu;

  /// u16
  final int mem;

  /// u16
  final int disk;

  /// BalanceOf<T>
  final BigInt deposit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cluster_mortgage': {
          'id': id,
          'cpu': cpu,
          'mem': mem,
          'disk': disk,
          'deposit': deposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    size = size + _i1.U16Codec.codec.sizeHint(cpu);
    size = size + _i1.U16Codec.codec.sizeHint(mem);
    size = size + _i1.U16Codec.codec.sizeHint(disk);
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
    _i1.U16Codec.codec.encodeTo(
      cpu,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      mem,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      disk,
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
          other.disk == disk &&
          other.deposit == deposit;

  @override
  int get hashCode => Object.hash(
        id,
        cpu,
        mem,
        disk,
        deposit,
      );
}

/// See [`Pallet::cluster_unmortgage`].
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

/// See [`Pallet::work_proof_upload`].
class WorkProofUpload extends Call {
  const WorkProofUpload({
    required this.workId,
    required this.proof,
  });

  factory WorkProofUpload._decode(_i1.Input input) {
    return WorkProofUpload(
      workId: _i5.WorkId.codec.decode(input),
      proof: _i6.ProofOfWork.codec.decode(input),
    );
  }

  /// WorkId
  final _i5.WorkId workId;

  /// ProofOfWork
  final _i6.ProofOfWork proof;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'work_proof_upload': {
          'workId': workId.toJson(),
          'proof': proof.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i5.WorkId.codec.sizeHint(workId);
    size = size + _i6.ProofOfWork.codec.sizeHint(proof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i5.WorkId.codec.encodeTo(
      workId,
      output,
    );
    _i6.ProofOfWork.codec.encodeTo(
      proof,
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
          other.proof == proof;

  @override
  int get hashCode => Object.hash(
        workId,
        proof,
      );
}

/// See [`Pallet::cluster_withdrawal`].
class ClusterWithdrawal extends Call {
  const ClusterWithdrawal({
    required this.workId,
    required this.amount,
  });

  factory ClusterWithdrawal._decode(_i1.Input input) {
    return ClusterWithdrawal(
      workId: _i5.WorkId.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// WorkId
  final _i5.WorkId workId;

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
    size = size + _i5.WorkId.codec.sizeHint(workId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i5.WorkId.codec.encodeTo(
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

/// See [`Pallet::cluster_stop`].
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

/// See [`Pallet::cluster_report`].
class ClusterReport extends Call {
  const ClusterReport({
    required this.clusterId,
    required this.workId,
    required this.reason,
  });

  factory ClusterReport._decode(_i1.Input input) {
    return ClusterReport(
      clusterId: _i1.U64Codec.codec.decode(input),
      workId: _i5.WorkId.codec.decode(input),
      reason: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// WorkId
  final _i5.WorkId workId;

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
    size = size + _i5.WorkId.codec.sizeHint(workId);
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
    _i5.WorkId.codec.encodeTo(
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

/// See [`Pallet::report_close`].
class ReportClose extends Call {
  const ReportClose({
    required this.clusterId,
    required this.workId,
  });

  factory ReportClose._decode(_i1.Input input) {
    return ReportClose(
      clusterId: _i1.U64Codec.codec.decode(input),
      workId: _i5.WorkId.codec.decode(input),
    );
  }

  /// ClusterId
  final BigInt clusterId;

  /// WorkId
  final _i5.WorkId workId;

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
    size = size + _i5.WorkId.codec.sizeHint(workId);
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
    _i5.WorkId.codec.encodeTo(
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

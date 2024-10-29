// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// App status mismatch
  /// 程序状态不匹配
  appStatusMismatch('AppStatusMismatch', 0),

  /// Cluster is exists
  /// 集群已存在
  clusterIsExists('ClusterIsExists', 1),

  /// Cluster is not exists
  /// 集群不存在
  clusterNotExists('ClusterNotExists', 2),

  /// Cluster is not started
  /// 集群未启动
  clusterNotStarted('ClusterNotStarted', 3),

  /// Cluster can not stopped
  /// 集群无法停止
  clusterCanNotStopped('ClusterCanNotStopped', 4),

  /// Too many apps
  /// 程序数量过多
  tooManyApp('TooManyApp', 5),

  /// No cluster
  /// 没有集群
  noCluster('NoCluster', 6),

  /// App is not exists
  /// 程序不存在
  appNotExists('AppNotExists', 7),

  /// Work is not exists
  /// 工作不存在
  workNotExists('WorkNotExists', 8),

  /// Insufficient balance.
  /// 余额不足
  insufficientBalance('InsufficientBalance', 9),

  /// Insufficient Minted Balance
  /// 合约余额不足
  insufficientMintedBalance('InsufficientMintedBalance', 10),

  /// Task is not exists
  /// 任务不存在
  taskNotExists('TaskNotExists', 11),

  /// Work is not started
  /// 工作未启动
  workNotStarted('WorkNotStarted', 12),

  /// Not allowed
  /// 未允许
  notAllowed403('NotAllowed403', 13),

  /// Cluster register miss ip
  /// 集群注册缺少ip
  clusterRegisterMissIp('ClusterRegisterMissIp', 14),

  /// Ip format error
  /// ip格式错误
  ipFormatError('IpFormatError', 15),

  /// Insufficient deposit.
  /// 抵押不足
  insufficientDeposit('InsufficientDeposit', 16),

  /// Duplicate deposit.
  /// 重复抵押
  duplicateDeposit('DuplicateDeposit', 17),

  /// Level is not exists
  /// 等级不存在
  levelNotExists('LevelNotExists', 18),

  /// No cluster found
  /// 没有找到集群
  noClusterFound('NoClusterFound', 19),

  /// Work block number error
  /// 工作块高度错误
  workBlockNumberError('WorkBlockNumberError', 20),

  /// Reason too long
  /// 理由太长
  reasonTooLong('ReasonTooLong', 21),

  /// Work type not exists
  /// 工作类型不存在
  workTypeNotExists('WorkTypeNotExists', 22),

  /// Boot peers too long
  /// 启动节点过多
  bootPeersTooLong('BootPeersTooLong', 23),

  /// Tee report 404
  /// tee 报告缺失
  teeReport404('TeeReport404', 24),

  /// Tee proof 404
  /// tee 证明缺失
  teeProof404('TeeProof404', 25),

  /// Work report 404
  /// 工作报告缺失
  reportNotExists('ReportNotExists', 26);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.appStatusMismatch;
      case 1:
        return Error.clusterIsExists;
      case 2:
        return Error.clusterNotExists;
      case 3:
        return Error.clusterNotStarted;
      case 4:
        return Error.clusterCanNotStopped;
      case 5:
        return Error.tooManyApp;
      case 6:
        return Error.noCluster;
      case 7:
        return Error.appNotExists;
      case 8:
        return Error.workNotExists;
      case 9:
        return Error.insufficientBalance;
      case 10:
        return Error.insufficientMintedBalance;
      case 11:
        return Error.taskNotExists;
      case 12:
        return Error.workNotStarted;
      case 13:
        return Error.notAllowed403;
      case 14:
        return Error.clusterRegisterMissIp;
      case 15:
        return Error.ipFormatError;
      case 16:
        return Error.insufficientDeposit;
      case 17:
        return Error.duplicateDeposit;
      case 18:
        return Error.levelNotExists;
      case 19:
        return Error.noClusterFound;
      case 20:
        return Error.workBlockNumberError;
      case 21:
        return Error.reasonTooLong;
      case 22:
        return Error.workTypeNotExists;
      case 23:
        return Error.bootPeersTooLong;
      case 24:
        return Error.teeReport404;
      case 25:
        return Error.teeProof404;
      case 26:
        return Error.reportNotExists;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}

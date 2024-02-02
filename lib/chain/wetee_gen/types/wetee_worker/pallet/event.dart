// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../wetee_primitives/types/work_id.dart' as _i4;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

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

class $Event {
  const $Event();

  ClusterCreated clusterCreated({required _i3.AccountId32 creator}) {
    return ClusterCreated(creator: creator);
  }

  WorkRuning workRuning({
    required _i3.AccountId32 user,
    required _i4.WorkId workId,
    required BigInt clusterId,
  }) {
    return WorkRuning(
      user: user,
      workId: workId,
      clusterId: clusterId,
    );
  }

  WorkContractUpdated workContractUpdated({required _i4.WorkId workId}) {
    return WorkContractUpdated(workId: workId);
  }

  WorkContractWithdrawaled workContractWithdrawaled(
      {required _i4.WorkId workId}) {
    return WorkContractWithdrawaled(workId: workId);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ClusterCreated._decode(input);
      case 1:
        return WorkRuning._decode(input);
      case 2:
        return WorkContractUpdated._decode(input);
      case 3:
        return WorkContractWithdrawaled._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case ClusterCreated:
        (value as ClusterCreated).encodeTo(output);
        break;
      case WorkRuning:
        (value as WorkRuning).encodeTo(output);
        break;
      case WorkContractUpdated:
        (value as WorkContractUpdated).encodeTo(output);
        break;
      case WorkContractWithdrawaled:
        (value as WorkContractWithdrawaled).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case ClusterCreated:
        return (value as ClusterCreated)._sizeHint();
      case WorkRuning:
        return (value as WorkRuning)._sizeHint();
      case WorkContractUpdated:
        return (value as WorkContractUpdated)._sizeHint();
      case WorkContractWithdrawaled:
        return (value as WorkContractWithdrawaled)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// A new cluster has been created. [creator]
class ClusterCreated extends Event {
  const ClusterCreated({required this.creator});

  factory ClusterCreated._decode(_i1.Input input) {
    return ClusterCreated(creator: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i3.AccountId32 creator;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'ClusterCreated': {'creator': creator.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(creator);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      creator,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterCreated &&
          _i5.listsEqual(
            other.creator,
            creator,
          );

  @override
  int get hashCode => creator.hashCode;
}

/// A new app has been runed. [user]
class WorkRuning extends Event {
  const WorkRuning({
    required this.user,
    required this.workId,
    required this.clusterId,
  });

  factory WorkRuning._decode(_i1.Input input) {
    return WorkRuning(
      user: const _i1.U8ArrayCodec(32).decode(input),
      workId: _i4.WorkId.codec.decode(input),
      clusterId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 user;

  /// WorkId
  final _i4.WorkId workId;

  /// ClusterId
  final BigInt clusterId;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'WorkRuning': {
          'user': user.toList(),
          'workId': workId.toJson(),
          'clusterId': clusterId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(user);
    size = size + _i4.WorkId.codec.sizeHint(workId);
    size = size + _i1.U64Codec.codec.sizeHint(clusterId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      user,
      output,
    );
    _i4.WorkId.codec.encodeTo(
      workId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      clusterId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WorkRuning &&
          _i5.listsEqual(
            other.user,
            user,
          ) &&
          other.workId == workId &&
          other.clusterId == clusterId;

  @override
  int get hashCode => Object.hash(
        user,
        workId,
        clusterId,
      );
}

/// Work contract has been updated. [user]
class WorkContractUpdated extends Event {
  const WorkContractUpdated({required this.workId});

  factory WorkContractUpdated._decode(_i1.Input input) {
    return WorkContractUpdated(workId: _i4.WorkId.codec.decode(input));
  }

  /// WorkId
  final _i4.WorkId workId;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'WorkContractUpdated': {'workId': workId.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WorkId.codec.sizeHint(workId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
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
      other is WorkContractUpdated && other.workId == workId;

  @override
  int get hashCode => workId.hashCode;
}

/// Work contract has been withdrawn. [user]
class WorkContractWithdrawaled extends Event {
  const WorkContractWithdrawaled({required this.workId});

  factory WorkContractWithdrawaled._decode(_i1.Input input) {
    return WorkContractWithdrawaled(workId: _i4.WorkId.codec.decode(input));
  }

  /// WorkId
  final _i4.WorkId workId;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'WorkContractWithdrawaled': {'workId': workId.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.WorkId.codec.sizeHint(workId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
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
      other is WorkContractWithdrawaled && other.workId == workId;

  @override
  int get hashCode => workId.hashCode;
}

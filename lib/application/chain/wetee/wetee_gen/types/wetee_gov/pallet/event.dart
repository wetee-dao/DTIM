// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../primitive_types/h256.dart' as _i3;
import '../../sp_core/crypto/account_id32.dart' as _i5;
import '../../sp_runtime/dispatch_error.dart' as _i4;

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

  Map<String, dynamic> toJson();
}

class $Event {
  const $Event();

  Proposed proposed(
    BigInt value0,
    _i3.H256 value1,
  ) {
    return Proposed(
      value0,
      value1,
    );
  }

  Recreate recreate(
    BigInt value0,
    BigInt value1,
  ) {
    return Recreate(
      value0,
      value1,
    );
  }

  StartTable startTable(
    BigInt value0,
    int value1,
  ) {
    return StartTable(
      value0,
      value1,
    );
  }

  Vote vote(
    BigInt value0,
    int value1,
    BigInt value2,
  ) {
    return Vote(
      value0,
      value1,
      value2,
    );
  }

  CancelVote cancelVote(
    BigInt value0,
    int value1,
  ) {
    return CancelVote(
      value0,
      value1,
    );
  }

  EnactProposal enactProposal({
    required BigInt daoId,
    required int index,
    required _i1.Result<dynamic, _i4.DispatchError> result,
  }) {
    return EnactProposal(
      daoId: daoId,
      index: index,
      result: result,
    );
  }

  Unlock unlock(
    _i5.AccountId32 value0,
    BigInt value1,
    BigInt value2,
  ) {
    return Unlock(
      value0,
      value1,
      value2,
    );
  }

  Unreserved unreserved(
    _i5.AccountId32 value0,
    BigInt value1,
  ) {
    return Unreserved(
      value0,
      value1,
    );
  }

  SetMinVoteWeight setMinVoteWeight(
    BigInt value0,
    int value1,
    BigInt value2,
  ) {
    return SetMinVoteWeight(
      value0,
      value1,
      value2,
    );
  }

  SetMaxPreProps setMaxPreProps({
    required BigInt daoId,
    required int max,
  }) {
    return SetMaxPreProps(
      daoId: daoId,
      max: max,
    );
  }

  VoteModelUpdate voteModelUpdate({
    required BigInt daoId,
    required int model,
  }) {
    return VoteModelUpdate(
      daoId: daoId,
      model: model,
    );
  }

  PeriodUpdate periodUpdate({required BigInt daoId}) {
    return PeriodUpdate(daoId: daoId);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Proposed._decode(input);
      case 1:
        return Recreate._decode(input);
      case 2:
        return StartTable._decode(input);
      case 3:
        return Vote._decode(input);
      case 4:
        return CancelVote._decode(input);
      case 5:
        return EnactProposal._decode(input);
      case 6:
        return Unlock._decode(input);
      case 7:
        return Unreserved._decode(input);
      case 8:
        return SetMinVoteWeight._decode(input);
      case 9:
        return SetMaxPreProps._decode(input);
      case 10:
        return VoteModelUpdate._decode(input);
      case 11:
        return PeriodUpdate._decode(input);
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
      case Proposed:
        (value as Proposed).encodeTo(output);
        break;
      case Recreate:
        (value as Recreate).encodeTo(output);
        break;
      case StartTable:
        (value as StartTable).encodeTo(output);
        break;
      case Vote:
        (value as Vote).encodeTo(output);
        break;
      case CancelVote:
        (value as CancelVote).encodeTo(output);
        break;
      case EnactProposal:
        (value as EnactProposal).encodeTo(output);
        break;
      case Unlock:
        (value as Unlock).encodeTo(output);
        break;
      case Unreserved:
        (value as Unreserved).encodeTo(output);
        break;
      case SetMinVoteWeight:
        (value as SetMinVoteWeight).encodeTo(output);
        break;
      case SetMaxPreProps:
        (value as SetMaxPreProps).encodeTo(output);
        break;
      case VoteModelUpdate:
        (value as VoteModelUpdate).encodeTo(output);
        break;
      case PeriodUpdate:
        (value as PeriodUpdate).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case Proposed:
        return (value as Proposed)._sizeHint();
      case Recreate:
        return (value as Recreate)._sizeHint();
      case StartTable:
        return (value as StartTable)._sizeHint();
      case Vote:
        return (value as Vote)._sizeHint();
      case CancelVote:
        return (value as CancelVote)._sizeHint();
      case EnactProposal:
        return (value as EnactProposal)._sizeHint();
      case Unlock:
        return (value as Unlock)._sizeHint();
      case Unreserved:
        return (value as Unreserved)._sizeHint();
      case SetMinVoteWeight:
        return (value as SetMinVoteWeight)._sizeHint();
      case SetMaxPreProps:
        return (value as SetMaxPreProps)._sizeHint();
      case VoteModelUpdate:
        return (value as VoteModelUpdate)._sizeHint();
      case PeriodUpdate:
        return (value as PeriodUpdate)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// initiate a proposal.
class Proposed extends Event {
  const Proposed(
    this.value0,
    this.value1,
  );

  factory Proposed._decode(_i1.Input input) {
    return Proposed(
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// T::Hash
  final _i3.H256 value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Proposed': [
          value0,
          value1.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + const _i3.H256Codec().sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Proposed &&
          other.value0 == value0 &&
          _i6.listsEqual(
            other.value1,
            value1,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

/// Others support initiating proposals.
class Recreate extends Event {
  const Recreate(
    this.value0,
    this.value1,
  );

  factory Recreate._decode(_i1.Input input) {
    return Recreate(
      _i1.U64Codec.codec.decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// BalanceOf<T>
  final BigInt value1;

  @override
  Map<String, List<BigInt>> toJson() => {
        'Recreate': [
          value0,
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U128Codec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Recreate && other.value0 == value0 && other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

/// Open a prop.
class StartTable extends Event {
  const StartTable(
    this.value0,
    this.value1,
  );

  factory StartTable._decode(_i1.Input input) {
    return StartTable(
      _i1.U64Codec.codec.decode(input),
      _i1.U32Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// PropIndex
  final int value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'StartTable': [
          value0,
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U32Codec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StartTable && other.value0 == value0 && other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

/// Vote for the prop.
class Vote extends Event {
  const Vote(
    this.value0,
    this.value1,
    this.value2,
  );

  factory Vote._decode(_i1.Input input) {
    return Vote(
      _i1.U64Codec.codec.decode(input),
      _i1.U32Codec.codec.decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// PropIndex
  final int value1;

  /// BalanceOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Vote': [
          value0,
          value1,
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U32Codec.codec.sizeHint(value1);
    size = size + _i1.U128Codec.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value2,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Vote &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Cancel a vote on a prop.
class CancelVote extends Event {
  const CancelVote(
    this.value0,
    this.value1,
  );

  factory CancelVote._decode(_i1.Input input) {
    return CancelVote(
      _i1.U64Codec.codec.decode(input),
      _i1.U32Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// PropIndex
  final int value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'CancelVote': [
          value0,
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U32Codec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CancelVote && other.value0 == value0 && other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

/// Vote and execute the transaction corresponding to the proposa.
class EnactProposal extends Event {
  const EnactProposal({
    required this.daoId,
    required this.index,
    required this.result,
  });

  factory EnactProposal._decode(_i1.Input input) {
    return EnactProposal(
      daoId: _i1.U64Codec.codec.decode(input),
      index: _i1.U32Codec.codec.decode(input),
      result: const _i1.ResultCodec<dynamic, _i4.DispatchError>(
        _i1.NullCodec.codec,
        _i4.DispatchError.codec,
      ).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// PropIndex
  final int index;

  /// DResult
  final _i1.Result<dynamic, _i4.DispatchError> result;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'EnactProposal': {
          'daoId': daoId,
          'index': index,
          'result': result.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(index);
    size = size +
        const _i1.ResultCodec<dynamic, _i4.DispatchError>(
          _i1.NullCodec.codec,
          _i4.DispatchError.codec,
        ).sizeHint(result);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      index,
      output,
    );
    const _i1.ResultCodec<dynamic, _i4.DispatchError>(
      _i1.NullCodec.codec,
      _i4.DispatchError.codec,
    ).encodeTo(
      result,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is EnactProposal &&
          other.daoId == daoId &&
          other.index == index &&
          other.result == result;

  @override
  int get hashCode => Object.hash(
        daoId,
        index,
        result,
      );
}

/// Unlock
class Unlock extends Event {
  const Unlock(
    this.value0,
    this.value1,
    this.value2,
  );

  factory Unlock._decode(_i1.Input input) {
    return Unlock(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U64Codec.codec.decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i5.AccountId32 value0;

  /// DaoAssetId
  final BigInt value1;

  /// BalanceOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Unlock': [
          value0.toList(),
          value1,
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccountId32Codec().sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + _i1.U128Codec.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value2,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Unlock &&
          _i6.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1 &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Unlock
class Unreserved extends Event {
  const Unreserved(
    this.value0,
    this.value1,
  );

  factory Unreserved._decode(_i1.Input input) {
    return Unreserved(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i5.AccountId32 value0;

  /// BalanceOf<T>
  final BigInt value1;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Unreserved': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccountId32Codec().sizeHint(value0);
    size = size + _i1.U128Codec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Unreserved &&
          _i6.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

/// Set Origin for each Call.
class SetMinVoteWeight extends Event {
  const SetMinVoteWeight(
    this.value0,
    this.value1,
    this.value2,
  );

  factory SetMinVoteWeight._decode(_i1.Input input) {
    return SetMinVoteWeight(
      _i1.U64Codec.codec.decode(input),
      _i1.U32Codec.codec.decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// T::CallId
  final int value1;

  /// BalanceOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'SetMinVoteWeight': [
          value0,
          value1,
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U32Codec.codec.sizeHint(value1);
    size = size + _i1.U128Codec.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value2,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetMinVoteWeight &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Set the maximum number of proposals at the same time.
class SetMaxPreProps extends Event {
  const SetMaxPreProps({
    required this.daoId,
    required this.max,
  });

  factory SetMaxPreProps._decode(_i1.Input input) {
    return SetMaxPreProps(
      daoId: _i1.U64Codec.codec.decode(input),
      max: _i1.U32Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u32
  final int max;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'SetMaxPreProps': {
          'daoId': daoId,
          'max': max,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(max);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      max,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetMaxPreProps && other.daoId == daoId && other.max == max;

  @override
  int get hashCode => Object.hash(
        daoId,
        max,
      );
}

class VoteModelUpdate extends Event {
  const VoteModelUpdate({
    required this.daoId,
    required this.model,
  });

  factory VoteModelUpdate._decode(_i1.Input input) {
    return VoteModelUpdate(
      daoId: _i1.U64Codec.codec.decode(input),
      model: _i1.U8Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u8
  final int model;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'VoteModelUpdate': {
          'daoId': daoId,
          'model': model,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U8Codec.codec.sizeHint(model);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      model,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is VoteModelUpdate && other.daoId == daoId && other.model == model;

  @override
  int get hashCode => Object.hash(
        daoId,
        model,
      );
}

class PeriodUpdate extends Event {
  const PeriodUpdate({required this.daoId});

  factory PeriodUpdate._decode(_i1.Input input) {
    return PeriodUpdate(daoId: _i1.U64Codec.codec.decode(input));
  }

  /// DaoAssetId
  final BigInt daoId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'PeriodUpdate': {'daoId': daoId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PeriodUpdate && other.daoId == daoId;

  @override
  int get hashCode => daoId.hashCode;
}

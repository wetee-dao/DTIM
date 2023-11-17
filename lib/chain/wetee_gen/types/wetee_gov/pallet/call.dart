// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i8;

import '../../wetee_runtime/runtime_call.dart' as _i4;
import '../../wetee_runtime/vote/pledge.dart' as _i5;
import '../member_data.dart' as _i3;
import '../opinion.dart' as _i6;
import '../period.dart' as _i7;

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

  SubmitProposal submitProposal({
    required BigInt daoId,
    required _i3.MemberData memberData,
    required _i4.RuntimeCall proposal,
    required int periodIndex,
  }) {
    return SubmitProposal(
      daoId: daoId,
      memberData: memberData,
      proposal: proposal,
      periodIndex: periodIndex,
    );
  }

  DepositProposal depositProposal({
    required BigInt daoId,
    required int proposeId,
    required BigInt deposit,
  }) {
    return DepositProposal(
      daoId: daoId,
      proposeId: proposeId,
      deposit: deposit,
    );
  }

  VoteForProp voteForProp({
    required BigInt daoId,
    required int propIndex,
    required _i5.Pledge pledge,
    required _i6.Opinion opinion,
  }) {
    return VoteForProp(
      daoId: daoId,
      propIndex: propIndex,
      pledge: pledge,
      opinion: opinion,
    );
  }

  CancelVote cancelVote({
    required BigInt daoId,
    required int index,
  }) {
    return CancelVote(
      daoId: daoId,
      index: index,
    );
  }

  RunProposal runProposal({
    required BigInt daoId,
    required int index,
  }) {
    return RunProposal(
      daoId: daoId,
      index: index,
    );
  }

  Unlock unlock({required BigInt daoId}) {
    return Unlock(daoId: daoId);
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

  UpdateVoteModel updateVoteModel({
    required BigInt daoId,
    required int model,
  }) {
    return UpdateVoteModel(
      daoId: daoId,
      model: model,
    );
  }

  SetPeriods setPeriods({
    required BigInt daoId,
    required List<_i7.Period> periods,
  }) {
    return SetPeriods(
      daoId: daoId,
      periods: periods,
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
        return SubmitProposal._decode(input);
      case 3:
        return DepositProposal._decode(input);
      case 4:
        return VoteForProp._decode(input);
      case 5:
        return CancelVote._decode(input);
      case 6:
        return RunProposal._decode(input);
      case 7:
        return Unlock._decode(input);
      case 9:
        return SetMaxPreProps._decode(input);
      case 15:
        return UpdateVoteModel._decode(input);
      case 16:
        return SetPeriods._decode(input);
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
      case SubmitProposal:
        (value as SubmitProposal).encodeTo(output);
        break;
      case DepositProposal:
        (value as DepositProposal).encodeTo(output);
        break;
      case VoteForProp:
        (value as VoteForProp).encodeTo(output);
        break;
      case CancelVote:
        (value as CancelVote).encodeTo(output);
        break;
      case RunProposal:
        (value as RunProposal).encodeTo(output);
        break;
      case Unlock:
        (value as Unlock).encodeTo(output);
        break;
      case SetMaxPreProps:
        (value as SetMaxPreProps).encodeTo(output);
        break;
      case UpdateVoteModel:
        (value as UpdateVoteModel).encodeTo(output);
        break;
      case SetPeriods:
        (value as SetPeriods).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case SubmitProposal:
        return (value as SubmitProposal)._sizeHint();
      case DepositProposal:
        return (value as DepositProposal)._sizeHint();
      case VoteForProp:
        return (value as VoteForProp)._sizeHint();
      case CancelVote:
        return (value as CancelVote)._sizeHint();
      case RunProposal:
        return (value as RunProposal)._sizeHint();
      case Unlock:
        return (value as Unlock)._sizeHint();
      case SetMaxPreProps:
        return (value as SetMaxPreProps)._sizeHint();
      case UpdateVoteModel:
        return (value as UpdateVoteModel)._sizeHint();
      case SetPeriods:
        return (value as SetPeriods)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::submit_proposal`].
class SubmitProposal extends Call {
  const SubmitProposal({
    required this.daoId,
    required this.memberData,
    required this.proposal,
    required this.periodIndex,
  });

  factory SubmitProposal._decode(_i1.Input input) {
    return SubmitProposal(
      daoId: _i1.U64Codec.codec.decode(input),
      memberData: _i3.MemberData.codec.decode(input),
      proposal: _i4.RuntimeCall.codec.decode(input),
      periodIndex: _i1.U32Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// MemberData
  final _i3.MemberData memberData;

  /// Box<<T as wetee_org::Config>::RuntimeCall>
  final _i4.RuntimeCall proposal;

  /// u32
  final int periodIndex;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'submit_proposal': {
          'daoId': daoId,
          'memberData': memberData.toJson(),
          'proposal': proposal.toJson(),
          'periodIndex': periodIndex,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i3.MemberData.codec.sizeHint(memberData);
    size = size + _i4.RuntimeCall.codec.sizeHint(proposal);
    size = size + _i1.U32Codec.codec.sizeHint(periodIndex);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i3.MemberData.codec.encodeTo(
      memberData,
      output,
    );
    _i4.RuntimeCall.codec.encodeTo(
      proposal,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      periodIndex,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SubmitProposal &&
          other.daoId == daoId &&
          other.memberData == memberData &&
          other.proposal == proposal &&
          other.periodIndex == periodIndex;

  @override
  int get hashCode => Object.hash(
        daoId,
        memberData,
        proposal,
        periodIndex,
      );
}

/// See [`Pallet::deposit_proposal`].
class DepositProposal extends Call {
  const DepositProposal({
    required this.daoId,
    required this.proposeId,
    required this.deposit,
  });

  factory DepositProposal._decode(_i1.Input input) {
    return DepositProposal(
      daoId: _i1.U64Codec.codec.decode(input),
      proposeId: _i1.U32Codec.codec.decode(input),
      deposit: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u32
  final int proposeId;

  /// BalanceOf<T>
  final BigInt deposit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'deposit_proposal': {
          'daoId': daoId,
          'proposeId': proposeId,
          'deposit': deposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(proposeId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(deposit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      proposeId,
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
      other is DepositProposal &&
          other.daoId == daoId &&
          other.proposeId == proposeId &&
          other.deposit == deposit;

  @override
  int get hashCode => Object.hash(
        daoId,
        proposeId,
        deposit,
      );
}

/// See [`Pallet::vote_for_prop`].
class VoteForProp extends Call {
  const VoteForProp({
    required this.daoId,
    required this.propIndex,
    required this.pledge,
    required this.opinion,
  });

  factory VoteForProp._decode(_i1.Input input) {
    return VoteForProp(
      daoId: _i1.U64Codec.codec.decode(input),
      propIndex: _i1.U32Codec.codec.decode(input),
      pledge: _i5.Pledge.codec.decode(input),
      opinion: _i6.Opinion.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// PropIndex
  final int propIndex;

  /// T::Pledge
  final _i5.Pledge pledge;

  /// Opinion
  final _i6.Opinion opinion;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'vote_for_prop': {
          'daoId': daoId,
          'propIndex': propIndex,
          'pledge': pledge.toJson(),
          'opinion': opinion.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(propIndex);
    size = size + _i5.Pledge.codec.sizeHint(pledge);
    size = size + _i6.Opinion.codec.sizeHint(opinion);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      propIndex,
      output,
    );
    _i5.Pledge.codec.encodeTo(
      pledge,
      output,
    );
    _i6.Opinion.codec.encodeTo(
      opinion,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is VoteForProp &&
          other.daoId == daoId &&
          other.propIndex == propIndex &&
          other.pledge == pledge &&
          other.opinion == opinion;

  @override
  int get hashCode => Object.hash(
        daoId,
        propIndex,
        pledge,
        opinion,
      );
}

/// See [`Pallet::cancel_vote`].
class CancelVote extends Call {
  const CancelVote({
    required this.daoId,
    required this.index,
  });

  factory CancelVote._decode(_i1.Input input) {
    return CancelVote(
      daoId: _i1.U64Codec.codec.decode(input),
      index: _i1.U32Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// PropIndex
  final int index;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cancel_vote': {
          'daoId': daoId,
          'index': index,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(index);
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
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CancelVote && other.daoId == daoId && other.index == index;

  @override
  int get hashCode => Object.hash(
        daoId,
        index,
      );
}

/// See [`Pallet::run_proposal`].
class RunProposal extends Call {
  const RunProposal({
    required this.daoId,
    required this.index,
  });

  factory RunProposal._decode(_i1.Input input) {
    return RunProposal(
      daoId: _i1.U64Codec.codec.decode(input),
      index: _i1.U32Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// PropIndex
  final int index;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'run_proposal': {
          'daoId': daoId,
          'index': index,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(index);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
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
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RunProposal && other.daoId == daoId && other.index == index;

  @override
  int get hashCode => Object.hash(
        daoId,
        index,
      );
}

/// See [`Pallet::unlock`].
class Unlock extends Call {
  const Unlock({required this.daoId});

  factory Unlock._decode(_i1.Input input) {
    return Unlock(daoId: _i1.U64Codec.codec.decode(input));
  }

  /// DaoAssetId
  final BigInt daoId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'unlock': {'daoId': daoId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
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
      other is Unlock && other.daoId == daoId;

  @override
  int get hashCode => daoId.hashCode;
}

/// See [`Pallet::set_max_pre_props`].
class SetMaxPreProps extends Call {
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
        'set_max_pre_props': {
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

/// See [`Pallet::update_vote_model`].
class UpdateVoteModel extends Call {
  const UpdateVoteModel({
    required this.daoId,
    required this.model,
  });

  factory UpdateVoteModel._decode(_i1.Input input) {
    return UpdateVoteModel(
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
        'update_vote_model': {
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
      15,
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
      other is UpdateVoteModel && other.daoId == daoId && other.model == model;

  @override
  int get hashCode => Object.hash(
        daoId,
        model,
      );
}

/// See [`Pallet::set_periods`].
class SetPeriods extends Call {
  const SetPeriods({
    required this.daoId,
    required this.periods,
  });

  factory SetPeriods._decode(_i1.Input input) {
    return SetPeriods(
      daoId: _i1.U64Codec.codec.decode(input),
      periods:
          const _i1.SequenceCodec<_i7.Period>(_i7.Period.codec).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// Vec<Period<BlockNumberFor<T>, BalanceOf<T>>>
  final List<_i7.Period> periods;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_periods': {
          'daoId': daoId,
          'periods': periods.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size +
        const _i1.SequenceCodec<_i7.Period>(_i7.Period.codec).sizeHint(periods);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    const _i1.SequenceCodec<_i7.Period>(_i7.Period.codec).encodeTo(
      periods,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetPeriods &&
          other.daoId == daoId &&
          _i8.listsEqual(
            other.periods,
            periods,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        periods,
      );
}

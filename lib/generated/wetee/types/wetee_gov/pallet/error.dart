// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Integer computation overflow.
  overflow('Overflow', 0),

  /// Insufficient amount of deposit.
  depositTooLow('DepositTooLow', 1),

  /// Maximum number of proposals reached.
  tooManyProposals('TooManyProposals', 2),

  /// Proposal does not exist.
  proposalMissing('ProposalMissing', 3),

  /// There are no proposals in progress.
  noneWaiting('NoneWaiting', 4),

  /// Prop does not exist.
  propNotExists('PropNotExists', 5),

  /// Prop ends.
  propFinished('PropFinished', 6),

  /// Prop voting is underway.
  voteNotEnd('VoteNotEnd', 7),

  /// Delayed execution time.
  inDelayTime('InDelayTime', 8),

  /// Prop voting has ended.
  voteEnd('VoteEnd', 9),

  /// 投票
  voteRedundancy('VoteRedundancy', 10),

  /// Voting closed but proposal rejected.
  voteEndButNotPass('VoteEndButNotPass', 11),

  /// It's not time to open a new prop.
  notTableTime('NotTableTime', 12),

  /// Bad origin.
  voteWeightTooLow('VoteWeightTooLow', 13),

  /// 是的
  pledgeNotEnough('PledgeNotEnough', 14),

  /// 没有权限
  gov403('Gov403', 15),

  /// 没有找到
  gov404('Gov404', 16);

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
        return Error.overflow;
      case 1:
        return Error.depositTooLow;
      case 2:
        return Error.tooManyProposals;
      case 3:
        return Error.proposalMissing;
      case 4:
        return Error.noneWaiting;
      case 5:
        return Error.propNotExists;
      case 6:
        return Error.propFinished;
      case 7:
        return Error.voteNotEnd;
      case 8:
        return Error.inDelayTime;
      case 9:
        return Error.voteEnd;
      case 10:
        return Error.voteRedundancy;
      case 11:
        return Error.voteEndButNotPass;
      case 12:
        return Error.notTableTime;
      case 13:
        return Error.voteWeightTooLow;
      case 14:
        return Error.pledgeNotEnough;
      case 15:
        return Error.gov403;
      case 16:
        return Error.gov404;
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

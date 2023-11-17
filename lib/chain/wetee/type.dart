import 'package:dtim/chain/wetee_gen/types/wetee_gov/member_data.dart';

/// vote yes or no
/// 投票
class WithGovPs {
  final int runType;
  final int amount;
  final MemberData member;
  final int periodIndex;
  final BigInt daoId;

  const WithGovPs({
    required this.runType,
    required this.amount,
    required this.member,
    required this.periodIndex,
    required this.daoId,
  });
}

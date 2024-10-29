import 'package:dtim/application/chain/wetee/wetee_gen/types/wetee_gov/member_data.dart';
import 'package:dtim/application/chain/wetee/wetee_gen/types/wetee_org/quarter_task.dart';

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

/// roadmap 季度
class Quarter {
  final int year;
  final int quarter;
  final List<QuarterTask> tasks;

  const Quarter({
    required this.year,
    required this.quarter,
    required this.tasks,
  });
}

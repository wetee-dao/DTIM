import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:js/js.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';

import 'dart:convert';

import 'bridge_struct.dart';

@JS("createTreasuryProposal")
external int createTreasuryProposalFunc(
  String from,
  int client,
  int daoId,
  String beneficiary,
  int value,
);

Future<int> XXXXcreateTreasuryProposal({
  required String from,
  required int client,
  required int daoId,
  required String beneficiary,
  required int value,
  dynamic hint,
}) async {
  try {
    return await promiseToFuture(createTreasuryProposalFunc(from, client, daoId, beneficiary, value));
  } catch (e) {
    rethrow;
  }
}

@JS("govProposal")
external bool govProposalFunc(
  String from,
  int client,
  int daoId,
  int proposalId,
  WithGovPs? ext,
);

Future<bool> XXXXgovProposal({
  required String from,
  required int client,
  required int daoId,
  required int proposalId,
  WithGovPs? ext,
  dynamic hint,
}) async {
  try {
    return await promiseToFuture(govProposalFunc(from, client, daoId, proposalId, ext));
  } catch (e) {
    rethrow;
  }
}

@JS("daoTreasuryProposals")
external bool daoTreasuryProposalsFunc(int client, int daoId);
Future<List<Treasury>> XXXXdaoTreasuryProposals({
  required int client,
  required int orgId,
}) async {
  try {
    var result = await promiseToFuture(daoTreasuryProposalsFunc(
      client,
      orgId,
    ));
    var data = jsonDecode(result) as List<dynamic>;
    List<Treasury> list = [];
    for (var i = 0; i < data.length; i++) {
      var item = data[i] as Map<String, dynamic>;
      list.add(Treasury.fromJson(item));
    }
    return list;
  } catch (e) {
    rethrow;
  }
}

class Treasury {
  String proposer;
  String value;
  String beneficiary;
  String bond;
  String status;
  int daoId;
  int proposalIndex;

  Treasury({
    required this.proposer,
    required this.value,
    required this.beneficiary,
    required this.bond,
    required this.status,
    required this.daoId,
    required this.proposalIndex,
  });

  factory Treasury.fromRawJson(String str) => Treasury.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Treasury.fromJson(Map<String, dynamic> json) => Treasury(
        proposer: json["proposer"],
        value: json["value"],
        beneficiary: json["beneficiary"],
        bond: json["bond"],
        status: json["status"],
        daoId: json["dao_id"],
        proposalIndex: json["proposal_index"],
      );

  Map<String, dynamic> toJson() => {
        "proposer": proposer,
        "value": value,
        "beneficiary": beneficiary,
        "bond": bond,
        "status": status,
        "dao_id": daoId,
        "proposal_index": proposalIndex,
      };
}

@JS("daoGovPeriods")
external bool daoGovPeriodsFunc(int client, int daoId);
Future<List<Period>> XXXXdaoGovPeriods({
  required int client,
  required int orgId,
}) async {
  try {
    var result = await promiseToFuture(daoGovPeriodsFunc(
      client,
      orgId,
    ));
    var data = jsonDecode(result) as List<dynamic>;
    List<Period> list = [];
    for (var i = 0; i < data.length; i++) {
      var item = data[i] as Map<String, dynamic>;
      list.add(Period.fromJson(item));
    }
    return list;
  } catch (e) {
    rethrow;
  }
}

class Period {
  String name;
  int preparePeriod;
  int maxDeciding;
  int confirmPeriod;
  int decisionPeriod;
  int minEnactmentPeriod;
  int decisionDeposit;
  int minApproval;
  int minSupport;

  Period({
    required this.name,
    required this.preparePeriod,
    required this.maxDeciding,
    required this.confirmPeriod,
    required this.decisionPeriod,
    required this.minEnactmentPeriod,
    required this.decisionDeposit,
    required this.minApproval,
    required this.minSupport,
  });

  factory Period.fromRawJson(String str) => Period.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Period.fromJson(Map<String, dynamic> json) => Period(
        name: json["name"],
        preparePeriod: json["preparePeriod"],
        maxDeciding: json["maxDeciding"],
        confirmPeriod: json["confirmPeriod"],
        decisionPeriod: json["decisionPeriod"],
        minEnactmentPeriod: json["minEnactmentPeriod"],
        decisionDeposit: json["decisionDeposit"],
        minApproval: json["minApproval"],
        minSupport: json["minSupport"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "preparePeriod": preparePeriod,
        "maxDeciding": maxDeciding,
        "confirmPeriod": confirmPeriod,
        "decisionPeriod": decisionPeriod,
        "minEnactmentPeriod": minEnactmentPeriod,
        "decisionDeposit": decisionDeposit,
        "minApproval": minApproval,
        "minSupport": minSupport,
      };
}

import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:asyou_app/utils/functions.dart';
import 'package:js/js.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';
import 'dart:convert' as convert;

import 'bridge_struct.dart';
import 'bridge_struct_json.dart';

@JS("queryAccounts")
external String queryAccounts();
@JS("signFromAddressFunc")
external String signFromAddressFunc(String address, String ctx);
@JS("connectFunc")
external int connectFunc(String url);
@JS("startClientFunc")
external String startClientFunc(int client);
@JS("pingClientFunc")
external String pingClientFunc(int client);
@JS("getBlockNumberFunc")
external String getBlockNumberFunc(int client);
@JS("nativeBalanceFunc")
external String nativeBalanceFunc(int client, String address);
@JS("daoInfoFunc")
external String daoInfoFunc(int client, int daoId);
@JS("ss58Func")
external String ss58Func(String address, int prefix);

// ignore: camel_case_types
class rustApi {
  static Future<String> connectWallet() async {
    try {
      var result = await promiseToFuture(queryAccounts());
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> connect({required String url, dynamic hint}) async {
    try {
      var result = await promiseToFuture(connectFunc(url));
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> startClient({required int client, dynamic hint}) async {
    try {
      var result = await promiseToFuture(startClientFunc(client));
      var isStart = true;
      do {
        try {
          await Future.delayed(const Duration(seconds: 2));
          pingClientFunc(client);
        } catch (e) {
          isStart = false;
        }
      } while (isStart);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>> seedGenerate({dynamic hint}) {
    return Future(() => []);
  }

  static Future<String> getSeedPhrase(
      {required String seedStr, required String name, required String password, dynamic hint}) {
    return Future(() => "");
  }

  static Future<bool> addKeyring({required String keyringStr, required String password, dynamic hint}) {
    return Future(() => true);
  }

  static Future<String> addSeed({required String seed, dynamic hint}) {
    return Future(() => "");
  }

  static Future<String> signFromAddress({required String address, required String ctx, dynamic hint}) async {
    try {
      var result = await promiseToFuture(signFromAddressFunc(address, ctx));
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> createDao(
      {required int client,
      required String from,
      required String name,
      required String purpose,
      required String metaData,
      dynamic hint}) {
    return Future(() {});
  }

  static Future<void> createAsset(
      {required int client,
      required String from,
      required int daoId,
      required String name,
      required String symbol,
      required int totalSupply,
      required int decimals,
      dynamic hint}) {
    return Future(() {});
  }

  static Future<int> getBlockNumber({required int client, dynamic hint}) async {
    try {
      var result = await promiseToFuture(getBlockNumberFunc(client));
      return int.parse(result);
    } catch (e) {
      rethrow;
    }
  }

  static Future<AssetAccountData> nativeBalance({required int client, required String address, dynamic hint}) async {
    try {
      final result = await promiseToFuture(nativeBalanceFunc(client, address));
      final data = convert.jsonDecode(result);

      return AssetAccountDataJ.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> daoInitFromPair({required int client, required String address, dynamic hint}) {
    return Future(() {});
  }

  static Future<AssetAccountData> daoBalance(
      {required int client, required int daoId, required String address, dynamic hint}) {
    return Future(() => AssetAccountData(free: 0, frozen: 0, reserved: 0));
  }

  static Future<DaoInfo> daoInfo({required int client, required int daoId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoInfoFunc(client, daoId));
      var data = convert.jsonDecode(result);
      return DaoInfoJ.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> daoTotalIssuance({required int client, required int daoId, dynamic hint}) {
    return Future(() => 0);
  }

  static Future<List<Quarter>> daoRoadmap({required int client, required int daoId, required int year, dynamic hint}) {
    return Future(() => []);
  }

  static Future<bool> daoCreateRoadmapTask(
      {required String from,
      required int client,
      required int daoId,
      required int roadmapId,
      required String name,
      required int priority,
      required Uint8List tags,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> joinDao(
      {required String from,
      required int client,
      required int daoId,
      required int shareExpect,
      required int value,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<List<String>> daoMemebers({required int client, required int daoId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<List<ProjectInfo>> daoProjects({required int client, required int daoId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<List<GuildInfo>> daoGuilds({required int client, required int daoId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<String> ss58({required String address, int? prefix, dynamic hint}) async {
    try {
      var result = ss58Func(address, prefix ?? 42);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> createProject(
      {required String from,
      required int client,
      required int daoId,
      required String name,
      required String desc,
      WithGovPs? ext,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> createGuild(
      {required String from,
      required int client,
      required int daoId,
      required String name,
      required String desc,
      WithGovPs? ext,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<List<GovProps>> daoGovPendingReferendumList({required int client, required int daoId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<List<GovReferendum>> daoGovReferendumList({required int client, required int daoId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<bool> daoGovStartReferendum(
      {required String from, required int client, required int daoId, required int index, dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoGovVoteForReferendum(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      required int vote,
      required bool approve,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<List<GovVote>> daoGovVotesOfUser(
      {required String from, required int client, required int daoId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<bool> daoGovRunProposal(
      {required String from, required int client, required int daoId, required int index, dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoGovUnlock({required String from, required int client, required int daoId, dynamic hint}) {
    return Future(() => true);
  }

  static Future<List<String>> daoMemeberList({required int client, required int daoId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<List<String>> daoGuildMemeberList(
      {required int client, required int daoId, required int guildId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<List<String>> daoProjectMemberList(
      {required int client, required int daoId, required int projectId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<List<TaskInfo>> daoProjectTaskList({required int client, required int projectId, dynamic hint}) {
    return Future(() => []);
  }

  static Future<TaskInfo> daoProjectTaskInfo(
      {required int client, required int projectId, required int taskId, dynamic hint}) {
    return Future(() => TaskInfo(
        id: 0,
        name: "",
        priority: 0,
        point: 0,
        status: 0,
        assignees: [],
        reviewers: [],
        skills: Uint8List(0),
        maxAssignee: 0,
        projectId: 0,
        creator: '',
        description: '',
        rewards: []));
  }

  static Future<bool> daoProjectCreateTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required String name,
      required String desc,
      required int priority,
      required int point,
      List<String>? assignees,
      List<String>? reviewers,
      Uint8List? skills,
      int? maxAssignee,
      required int amount,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectStartTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectRequestReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectTaskDone(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectJoinTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectLeaveTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectJoinTaskReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectLeaveTaskReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectMakeReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      required bool approve,
      required String meta,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectJoinRequest(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      WithGovPs? ext,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoProjectJoinRequestWithRoot(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required String user,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<bool> daoGuildJoinRequest(
      {required String from,
      required int client,
      required int daoId,
      required int guildId,
      WithGovPs? ext,
      dynamic hint}) {
    return Future(() => true);
  }

  static Future<int> daoMemberPoint({required int client, required int daoId, required String member, dynamic hint}) {
    return Future(() => 0);
  }

  static Future<bool> daoApplyProjectFunds(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int amount,
      WithGovPs? ext,
      dynamic hint}) {
    return Future(() => true);
  }
}

// final rustApi = JsWraperImpl();

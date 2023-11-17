import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:dtim/chain/wetee/types/frame_system/account_info.dart';
import 'package:dtim/chain/wetee/types.dart';
import 'package:js/js.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';
import 'dart:convert' as convert;

@JS("queryAccounts")
external String queryAccounts();
@JS("signFromAddress")
external String signFromAddressFunc(String address, String ctx);
@JS("connect")
external int connectFunc(String url);
@JS("startClient")
external String startClientFunc(int client);
@JS("stopClient")
external String stopClienttFunc(int client);
@JS("pingClient")
external String pingClientFunc(int client);
@JS("getBlockNumber")
external String getBlockNumberFunc(int client);
@JS("nativeBalance")
external String nativeBalanceFunc(int client, String address);
@JS("daoBalance")
external String daoBalanceFunc(int client, int daoId, String address);
@JS("daoInfo")
external String daoInfoFunc(int client, int daoId);
@JS("ss58")
external String ss58Func(String address, int prefix);
@JS("daoTotalIssuance")
external int daoTotalIssuanceFunc(int client, int daoId);
@JS("daoRoadmap")
external String daoRoadmapFunc(int client, int daoId, int year);
@JS("daoGovPendingReferendumList")
external String daoGovPendingReferendumListFunc(int client, int daoId);
@JS("daoGovReferendumList")
external String daoGovReferendumListFunc(int client, int daoId);
@JS("daoProjects")
external String daoProjectsFunc(int client, int daoId);
@JS("daoGuilds")
external String daoGuildsFunc(int client, int daoId);
@JS("daoGuildMemeberList")
external List<dynamic> daoGuildMemeberListFunc(int client, int daoId, int gId);
@JS("daoProjectMemberList")
external List<dynamic> daoProjectMemberListFunc(int client, int daoId, int projectId);
@JS("daoProjectTaskList")
external List<dynamic> daoProjectTaskListFunc(int client, int projectId);
@JS("daoProjectTaskInfo")
external String daoProjectTaskInfoFunc(int client, int projectId, int taskId);
@JS("joinDao")
external bool joinDaoFunc(
  String from,
  int client,
  int daoId,
  int shareExpect,
  int value,
);
@JS("daoCreateRoadmapTask")
external bool daoCreateRoadmapTaskFunc(
  String from,
  int client,
  int daoId,
  int roadmapId,
  String name,
  int priority,
  Uint8List tags,
);
@JS("daoMemebers")
external List<dynamic> daoMemebersFunc(
  int client,
  int daoId,
);
@JS("createProject")
external bool createProjectFunc(
  String from,
  int client,
  int daoId,
  String name,
  String desc,
  WithGovPs? ext,
);
@JS("createGuild")
external bool createGuildFunc(
  String from,
  int client,
  int daoId,
  String name,
  String desc,
  WithGovPs? ext,
);

@JS("daoGovStartReferendum")
external bool daoGovStartReferendumFunc(
  String from,
  int client,
  int daoId,
  int index,
  int deposit,
);
@JS("daoGovVoteForReferendum")
external bool daoGovVoteForReferendumFunc(
  String from,
  int client,
  int daoId,
  int index,
  int vote,
  bool approve,
);

@JS("daoGovVotesOfUser")
external String daoGovVotesOfUserFunc(String from, int client, int daoId);

@JS("daoGovRunProposal")
external bool daoGovRunProposalFunc(String from, int client, int daoId, int index);

@JS("daoGovUnlock")
external bool daoGovUnlockFunc(int client, int daoId);

@JS("daoProjectCreateTask")
external bool daoProjectCreateTaskFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  String name,
  String desc,
  int priority,
  int point,
  List<String>? assignees,
  List<String>? reviewers,
  Uint8List? skills,
  int? maxAssignee,
  int amount,
);

@JS("daoProjectStartTask")
external bool daoProjectStartTaskFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoProjectRequestReview")
external bool daoProjectRequestReviewFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoProjectTaskDone")
external bool daoProjectTaskDoneFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoProjectJoinTask")
external bool daoProjectJoinTaskFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoProjectLeaveTask")
external bool daoProjectLeaveTaskFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoProjectJoinTaskReview")
external bool daoProjectJoinTaskReviewFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoProjectLeaveTaskReview")
external bool daoProjectLeaveTaskReviewFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoProjectMakeReview")
external bool daoProjectMakeReviewFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
  bool approve,
  String meta,
);

@JS("daoProjectJoinRequest")
external bool daoProjectJoinRequestFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  WithGovPs? ext,
);

@JS("daoProjectJoinRequestWithRoot")
external bool daoProjectJoinRequestWithRootFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  String user,
);

@JS("daoProjectLeaveRequest")
external bool daoProjectLeaveRequestFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int taskId,
);

@JS("daoMemberPoint")
external int daoMemberPointFunc(int client, int daoId, String address);

@JS("daoApplyProjectFunds")
external bool daoApplyProjectFundsFunc(
  String from,
  int client,
  int daoId,
  int projectId,
  int amount,
  WithGovPs? ext,
);

@JS("daoGuildJoinRequest")
external bool daoGuildJoinRequestFunc(
  String from,
  int client,
  int daoId,
  int guildId,
  WithGovPs? ext,
);

@JS("appHubs")
external bool appHubsFunc(int client);

@JS("createDao")
external bool createDaoFunc(
  int client,
  String from,
  String name,
  String purpose,
  String metaData,
  String desc,
  String imApi,
  String bg,
  String logo,
  String img,
  String homeUrl,
);

@JS("orgIntegrateApp")
external bool orgIntegrateAppFunc(
  int client,
  String from,
  int orgId,
  int appId,
  WithGovPs? ext,
);

@JS("orgApps")
external bool orgAppsFunc(
  int client,
  int orgId,
);

@JS("orgs")
external bool orgsFunc(
  int client,
);

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

  static Future<void> stopClient({required int client, dynamic hint}) async {
    try {
      var result = await promiseToFuture(stopClienttFunc(client));
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

  static Future<AccountInfo> nativeBalance({required int client, required String address, dynamic hint}) async {
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

  static Future<AccountInfo> daoBalance({
    required int client,
    required int daoId,
    required String address,
    dynamic hint,
  }) async {
    try {
      final result = await promiseToFuture(daoBalanceFunc(client, daoId, address));
      final data = convert.jsonDecode(result);

      return AssetAccountDataJ.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<OrgInfo> daoInfo({required int client, required int daoId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoInfoFunc(client, daoId));
      var data = convert.jsonDecode(result);
      return OrgInfoJ.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> daoTotalIssuance({required int client, required int daoId, dynamic hint}) async {
    try {
      var result = await promiseToFuture(daoTotalIssuanceFunc(client, daoId));
      return int.parse(result);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Quarter>> daoRoadmap(
      {required int client, required int daoId, required int year, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoRoadmapFunc(client, daoId, year));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<QuarterJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(QuarterJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoCreateRoadmapTask(
      {required String from,
      required int client,
      required int daoId,
      required int roadmapId,
      required String name,
      required int priority,
      required Uint8List tags,
      dynamic hint}) async {
    try {
      await promiseToFuture(daoCreateRoadmapTaskFunc(
        from,
        client,
        daoId,
        roadmapId,
        name,
        priority,
        tags,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> joinDao(
      {required String from,
      required int client,
      required int daoId,
      required int shareExpect,
      required int value,
      dynamic hint}) async {
    try {
      await promiseToFuture(joinDaoFunc(
        from,
        client,
        daoId,
        shareExpect,
        value,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>> daoMemebers({required int client, required int daoId, dynamic hint}) async {
    try {
      List<dynamic> result = await promiseToFuture(daoMemebersFunc(client, daoId));
      return result.map((v) => v.toString()).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ProjectInfo>> daoProjects({required int client, required int daoId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoProjectsFunc(client, daoId));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<ProjectInfoJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(ProjectInfoJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<GuildInfo>> daoGuilds({required int client, required int daoId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoGuildsFunc(client, daoId));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<GuildInfoJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(GuildInfoJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
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
      dynamic hint}) async {
    try {
      await promiseToFuture(createProjectFunc(
        from,
        client,
        daoId,
        name,
        desc,
        ext,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> createGuild(
      {required String from,
      required int client,
      required int daoId,
      required String name,
      required String desc,
      WithGovPs? ext,
      dynamic hint}) async {
    try {
      await promiseToFuture(createGuildFunc(
        from,
        client,
        daoId,
        name,
        desc,
        ext,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<GovProps>> daoGovPendingReferendumList(
      {required int client, required int daoId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoGovPendingReferendumListFunc(client, daoId));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<GovPropsJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(GovPropsJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<GovReferendum>> daoGovReferendumList({
    required int client,
    required int daoId,
    dynamic hint,
  }) async {
    try {
      final result = await promiseToFuture(daoGovReferendumListFunc(client, daoId));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<GovReferendumJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(GovReferendumJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoGovStartReferendum({
    required String from,
    required int client,
    required int daoId,
    required int index,
    required int deposit,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoGovStartReferendumFunc(from, client, daoId, index, deposit));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoGovVoteForReferendum(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      required int vote,
      required bool approve,
      dynamic hint}) async {
    try {
      await promiseToFuture(daoGovVoteForReferendumFunc(
        from,
        client,
        daoId,
        index,
        vote,
        approve,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<GovVote>> daoGovVotesOfUser(
      {required String from, required int client, required int daoId, dynamic hint}) async {
    try {
      var result = await promiseToFuture(daoGovVotesOfUserFunc(from, client, daoId));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<GovVoteJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(GovVoteJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoGovRunProposal(
      {required String from, required int client, required int daoId, required int index, dynamic hint}) async {
    try {
      await promiseToFuture(daoGovRunProposalFunc(from, client, daoId, index));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoGovUnlock(
      {required String from, required int client, required int daoId, dynamic hint}) async {
    try {
      await promiseToFuture(daoGovUnlockFunc(client, daoId));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>> daoGuildMemeberList(
      {required int client, required int daoId, required int guildId, dynamic hint}) async {
    try {
      List<dynamic> result = await promiseToFuture(daoGuildMemeberListFunc(client, daoId, guildId));
      return result.map((v) => v.toString()).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>> daoProjectMemberList(
      {required int client, required int daoId, required int projectId, dynamic hint}) async {
    try {
      List<dynamic> result = await promiseToFuture(daoProjectMemberListFunc(client, daoId, projectId));
      return result.map((v) => v.toString()).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<TaskInfo>> daoProjectTaskList({required int client, required int projectId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoProjectTaskListFunc(client, projectId));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<TaskInfoJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(TaskInfoJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<TaskInfo> daoProjectTaskInfo(
      {required int client, required int projectId, required int taskId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(daoProjectTaskInfoFunc(client, projectId, taskId));
      var item = convert.jsonDecode(result) as Map<String, dynamic>;
      return TaskInfoJ.fromJson(item);
    } catch (e) {
      rethrow;
    }
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
      dynamic hint}) async {
    try {
      await promiseToFuture(daoProjectCreateTaskFunc(
        from,
        client,
        daoId,
        projectId,
        name,
        desc,
        priority,
        point,
        assignees,
        reviewers,
        skills,
        maxAssignee,
        amount,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectStartTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) async {
    try {
      await promiseToFuture(daoProjectStartTaskFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectRequestReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) async {
    try {
      await promiseToFuture(daoProjectRequestReviewFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectTaskDone(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) async {
    try {
      await promiseToFuture(daoProjectTaskDoneFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectJoinTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) async {
    try {
      await promiseToFuture(daoProjectJoinTaskFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectLeaveTask({
    required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoProjectLeaveTaskFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectJoinTaskReview({
    required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoProjectJoinTaskReviewFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectLeaveTaskReview({
    required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoProjectLeaveTaskReviewFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectMakeReview({
    required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    required bool approve,
    required String meta,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoProjectMakeReviewFunc(
        from,
        client,
        daoId,
        projectId,
        taskId,
        approve,
        meta,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectJoinRequest({
    required String from,
    required int client,
    required int daoId,
    required int projectId,
    WithGovPs? ext,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoProjectJoinRequestFunc(from, client, daoId, projectId, ext));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoProjectJoinRequestWithRoot({
    required String from,
    required int client,
    required int daoId,
    required int projectId,
    required String user,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoProjectJoinRequestWithRootFunc(from, client, daoId, projectId, user));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoGuildJoinRequest({
    required String from,
    required int client,
    required int daoId,
    required int guildId,
    WithGovPs? ext,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoGuildJoinRequestFunc(from, client, daoId, guildId, ext));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> daoMemberPoint(
      {required int client, required int daoId, required String member, dynamic hint}) async {
    try {
      var result = await promiseToFuture(daoMemberPointFunc(client, daoId, member));
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> daoApplyProjectFunds({
    required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int amount,
    WithGovPs? ext,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(daoApplyProjectFundsFunc(
        from,
        client,
        daoId,
        projectId,
        amount,
        ext,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<App>> appHubs({required int client, dynamic hint}) async {
    try {
      final result = await promiseToFuture(appHubsFunc(client));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<AppJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(AppJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> createDao({
    required int client,
    required String from,
    required String name,
    required String purpose,
    required String metaData,
    required String desc,
    required String imApi,
    required String bg,
    required String logo,
    required String img,
    required String homeUrl,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(createDaoFunc(
        client,
        from,
        name,
        purpose,
        metaData,
        desc,
        imApi,
        bg,
        logo,
        img,
        homeUrl,
      ));
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<OrgApp>> orgApps({required int client, required int orgId, dynamic hint}) async {
    try {
      final result = await promiseToFuture(orgAppsFunc(client, orgId));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<OrgAppJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(OrgAppJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<OrgInfo>> orgs({required int client, dynamic hint}) async {
    try {
      final result = await promiseToFuture(orgsFunc(client));
      var data = convert.jsonDecode(result) as List<dynamic>;
      List<OrgInfoJ> list = [];
      for (var i = 0; i < data.length; i++) {
        var item = data[i] as Map<String, dynamic>;
        list.add(OrgInfoJ.fromJson(item));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> orgIntegrateApp({
    required int client,
    required String from,
    required int orgId,
    required int appId,
    WithGovPs? ext,
    dynamic hint,
  }) async {
    try {
      await promiseToFuture(orgIntegrateAppFunc(
        client,
        from,
        orgId,
        appId,
        ext,
      ));
    } catch (e) {
      rethrow;
    }
  }
}

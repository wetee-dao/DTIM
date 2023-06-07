
import 'dart:typed_data';
import 'dart:js' as js;
// ignore: depend_on_referenced_packages
import 'package:js/js_util.dart';
import 'bridge_struct.dart';


// ignore: camel_case_types
class rustApi{
  static Future<String> connectWallet() async {
    //调用Js的方法
    try{
      var result =  await js.context.callMethod('queryAccounts');
      print(result);
    }catch(e){
      print(e);
    }
  
    return "";
  }

  static Future<int> connect({required String url, dynamic hint}) {
    return  Future(() => 0);
  }

  static Future<List<String>> seedGenerate({dynamic hint}) {
    return  Future(() => []);
  }

  static Future<String> getSeedPhrase(
      {required String seedStr,
      required String name,
      required String password,
      dynamic hint}) {
    return  Future(() => "");
  }

  static Future<bool> addKeyring(
      {required String keyringStr, required String password, dynamic hint}) {
    return  Future(() => true);
  }

  static Future<String> addSeed({required String seed, dynamic hint}) {
    return  Future(() => "");
  }

  static Future<String> signFromAddress(
      {required String address, required String ctx, dynamic hint}) {
    return  Future(() => "");
  }

  static Future<void> startClient({required int client, dynamic hint}) {
    return  Future((){});
  }

  static Future<void> createDao(
      {required int client,
      required String from,
      required String name,
      required String purpose,
      required String metaData,
      dynamic hint}) {
    return  Future((){});
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
    return  Future((){});
  }

  static Future<int> getBlockNumber({required int client, dynamic hint}) {
    return  Future(() => 0);
  }

  static Future<AssetAccountData> nativeBalance(
      {required int client, required String address, dynamic hint}) {
    return  Future(() => AssetAccountData(free: 0, frozen: 0, reserved: 0));
  }

  static Future<void> daoInitFromPair(
      {required int client, required String address, dynamic hint}) {
    return  Future((){});
  }

  static Future<AssetAccountData> daoBalance(
      {required int client,
      required int daoId,
      required String address,
      dynamic hint}) {
    return  Future(() => AssetAccountData(free: 0, frozen: 0, reserved: 0));
  }

  static Future<DaoInfo> daoInfo(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => DaoInfo(id: 0, name: "", purpose: "", metaData: "", chainUnit: 0, creator: '', daoAccountId: '', startBlock: 0));
  }

  static Future<int> daoTotalIssuance(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => 0);
  }

  static Future<List<Quarter>> daoRoadmap(
      {required int client,
      required int daoId,
      required int year,
      dynamic hint}) {
    return  Future(() => []);
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
    return  Future(() => true);
  }

  static Future<bool> joinDao(
      {required String from,
      required int client,
      required int daoId,
      required int shareExpect,
      required int value,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<List<String>> daoMemebers(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => []);
  }

  static Future<List<ProjectInfo>> daoProjects(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => []);
  }

  static Future<List<GuildInfo>> daoGuilds(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => []);
  }

  static Future<String> ss58({required String address, int? prefix, dynamic hint}) {
    return  Future(() => "");
  }

  static Future<bool> createProject(
      {required String from,
      required int client,
      required int daoId,
      required String name,
      required String desc,
      WithGovPs? ext,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> createGuild(
      {required String from,
      required int client,
      required int daoId,
      required String name,
      required String desc,
      WithGovPs? ext,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<List<GovProps>> daoGovPendingReferendumList(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => []);
  }

  static Future<List<GovReferendum>> daoGovReferendumList(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => []);
  }

  static Future<bool> daoGovStartReferendum(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoGovVoteForReferendum(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      required int vote,
      required bool approve,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<List<GovVote>> daoGovVotesOfUser(
      {required String from,
      required int client,
      required int daoId,
      dynamic hint}) {
    return  Future(() => []);
  }

  static Future<bool> daoGovRunProposal(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoGovUnlock(
      {required String from,
      required int client,
      required int daoId,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<List<String>> daoMemeberList(
      {required int client, required int daoId, dynamic hint}) {
    return  Future(() => []);
  }

  static Future<List<String>> daoGuildMemeberList(
      {required int client,
      required int daoId,
      required int guildId,
      dynamic hint}) {
    return  Future(() => []);
  }

  static Future<List<String>> daoProjectMemberList(
      {required int client,
      required int daoId,
      required int projectId,
      dynamic hint}) {
    return  Future(() => []);
  }

  static Future<List<TaskInfo>> daoProjectTaskList(
      {required int client, required int projectId, dynamic hint}) {
    return  Future(() => []);
  }

  static Future<TaskInfo> daoProjectTaskInfo(
      {required int client,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => TaskInfo(
        id: 0,
        name: "",
        priority: 0,
        point: 0,
        status: 0,
        assignees: [],
        reviewers: [],
        skills: Uint8List(0),
        maxAssignee: 0,
        projectId: 0, creator: '', description: '', rewards: []));
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
    return  Future(() => true);
  }

  static Future<bool> daoProjectStartTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => true);
  }


  static Future<bool> daoProjectRequestReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoProjectTaskDone(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoProjectJoinTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoProjectLeaveTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoProjectJoinTaskReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoProjectLeaveTaskReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint}) {
    return  Future(() => true);
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
    return  Future(() => true);
  }

  static Future<bool> daoProjectJoinRequest(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      WithGovPs? ext,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoProjectJoinRequestWithRoot(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required String user,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<bool> daoGuildJoinRequest(
      {required String from,
      required int client,
      required int daoId,
      required int guildId,
      WithGovPs? ext,
      dynamic hint}) {
    return  Future(() => true);
  }

  static Future<int> daoMemberPoint(
      {required int client,
      required int daoId,
      required String member,
      dynamic hint}) {
    return  Future(() => 0);
  }

  static Future<bool> daoApplyProjectFunds(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int amount,
      WithGovPs? ext,
      dynamic hint}) {
    return  Future(() => true);
  }
}

// final rustApi = JsWraperImpl();

import 'package:asyou_app/bridge_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

class MockRustWrapperImpl implements RustWraperImpl {
  final RustWraperPlatform _platform;

  factory MockRustWrapperImpl(dylib) =>
      MockRustWrapperImpl.raw(RustWraperPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory MockRustWrapperImpl.wasm(dynamic module) =>
      MockRustWrapperImpl(module);

  MockRustWrapperImpl.raw(this._platform);

  Future<int> connect({required String url, dynamic hint}) {
    // var arg0 = _platform.api2wire_String(url);
    // return _platform.executeNormal(FlutterRustBridgeTask(
    //   callFfi: (port_) => _platform.inner.wire_connect(port_, arg0),
    //   parseSuccessData: _wire2api_usize,
    //   constMeta: kConnectConstMeta,
    //   argValues: [url],
    //   hint: hint,
    // ));
    throw UnimplementedError('connect');
  }

  FlutterRustBridgeTaskConstMeta get kConnectConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "connect",
        argNames: ["url"],
      );

  Future<List<String>> seedGenerate({dynamic hint}) async {
    return ['mock', 'seedGenerate'];
    // return _platform.executeNormal(FlutterRustBridgeTask(
    //   callFfi: (port_) => _platform.inner.wire_seed_generate(port_),
    //   parseSuccessData: _wire2api_StringList,
    //   constMeta: kSeedGenerateConstMeta,
    //   argValues: [],
    //   hint: hint,
    // ));
  }

  FlutterRustBridgeTaskConstMeta get kSeedGenerateConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "seed_generate",
        argNames: [],
      );

  Future<String> getSeedPhrase({
    required String seedStr,
    required String name,
    required String password,
    dynamic hint,
  }) async {
    return 'mock seed phrase';
    // var arg0 = _platform.api2wire_String(seedStr);
    // var arg1 = _platform.api2wire_String(name);
    // var arg2 = _platform.api2wire_String(password);
    // return _platform.executeNormal(FlutterRustBridgeTask(
    //   callFfi: (port_) =>
    //       _platform.inner.wire_get_seed_phrase(port_, arg0, arg1, arg2),
    //   parseSuccessData: _wire2api_String,
    //   constMeta: kGetSeedPhraseConstMeta,
    //   argValues: [seedStr, name, password],
    //   hint: hint,
    // ));
  }

  FlutterRustBridgeTaskConstMeta get kGetSeedPhraseConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_seed_phrase",
        argNames: ["seedStr", "name", "password"],
      );

  Future<bool> addKeyring({
    required String keyringStr,
    required String password,
    dynamic hint,
  }) async {
    return true;
    var arg0 = _platform.api2wire_String(keyringStr);
    var arg1 = _platform.api2wire_String(password);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_add_keyring(port_, arg0, arg1),
      parseSuccessData: _wire2api_bool,
      constMeta: kAddKeyringConstMeta,
      argValues: [keyringStr, password],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAddKeyringConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "add_keyring",
        argNames: ["keyringStr", "password"],
      );

  Future<String> addSeed({required String seed, dynamic hint}) async {
    return 'mock seed';
    // var arg0 = _platform.api2wire_String(seed);
    // return _platform.executeNormal(FlutterRustBridgeTask(
    //   callFfi: (port_) => _platform.inner.wire_add_seed(port_, arg0),
    //   parseSuccessData: _wire2api_String,
    //   constMeta: kAddSeedConstMeta,
    //   argValues: [seed],
    //   hint: hint,
    // ));
  }

  FlutterRustBridgeTaskConstMeta get kAddSeedConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "add_seed",
        argNames: ["seed"],
      );

  Future<String> signFromAddress({
    required String address,
    required String ctx,
    dynamic hint,
  }) async {
    return 'mock sign';
    var arg0 = _platform.api2wire_String(address);
    var arg1 = _platform.api2wire_String(ctx);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_sign_from_address(port_, arg0, arg1),
      parseSuccessData: _wire2api_String,
      constMeta: kSignFromAddressConstMeta,
      argValues: [address, ctx],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSignFromAddressConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "sign_from_address",
        argNames: ["address", "ctx"],
      );

  Future<int> getBlockNumber({required int client, dynamic hint}) async {
    return 1;
    var arg0 = api2wire_u32(client);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_get_block_number(port_, arg0),
      parseSuccessData: _wire2api_u64,
      constMeta: kGetBlockNumberConstMeta,
      argValues: [client],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetBlockNumberConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_block_number",
        argNames: ["client"],
      );

  Future<AssetAccountData> nativeBalance({
    required int client,
    required String address,
    dynamic hint,
  }) async {
    return const AssetAccountData(
      free: 1,
      reserved: 1,
      frozen: 1,
    );
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_String(address);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_native_balance(port_, arg0, arg1),
      parseSuccessData: _wire2api_asset_account_data,
      constMeta: kNativeBalanceConstMeta,
      argValues: [client, address],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kNativeBalanceConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "native_balance",
        argNames: ["client", "address"],
      );

  Future<void> daoInitFromPair({
    required int client,
    required String address,
    dynamic hint,
  }) {
    return Future.value();
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_String(address);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_init_from_pair(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      constMeta: kDaoInitFromPairConstMeta,
      argValues: [client, address],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoInitFromPairConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_init_from_pair",
        argNames: ["client", "address"],
      );

  Future<AssetAccountData> daoBalance({
    required int client,
    required int daoId,
    required String address,
    dynamic hint,
  }) async {
    return const AssetAccountData(
      free: 1,
      reserved: 1,
      frozen: 1,
    );
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    var arg2 = _platform.api2wire_String(address);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_balance(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_asset_account_data,
      constMeta: kDaoBalanceConstMeta,
      argValues: [client, daoId, address],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoBalanceConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_balance",
        argNames: ["client", "daoId", "address"],
      );

  Future<DaoInfo> daoInfo({
    required int client,
    required int daoId,
    dynamic hint,
  }) async {
    return const DaoInfo(
      id: 1,
      creator: 'mock creator',
      startBlock: 1,
      daoAccountId: 'mock daoAccountId',
      name: 'mock name',
      purpose: 'mock purpose',
      metaData: 'mock meta data',
      chainUnit: 1,
    );
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_dao_info(port_, arg0, arg1),
      parseSuccessData: _wire2api_dao_info,
      constMeta: kDaoInfoConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoInfoConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_info",
        argNames: ["client", "daoId"],
      );

  Future<int> daoTotalIssuance({
    required int client,
    required int daoId,
    dynamic hint,
  }) async {
    return 1;
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_total_issuance(port_, arg0, arg1),
      parseSuccessData: _wire2api_u64,
      constMeta: kDaoTotalIssuanceConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoTotalIssuanceConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_total_issuance",
        argNames: ["client", "daoId"],
      );

  Future<List<Quarter>> daoRoadmap({
    required int client,
    required int daoId,
    required int year,
    dynamic hint,
  }) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    var arg2 = api2wire_u32(year);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_roadmap(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_list_quarter,
      constMeta: kDaoRoadmapConstMeta,
      argValues: [client, daoId, year],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoRoadmapConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_roadmap",
        argNames: ["client", "daoId", "year"],
      );

  Future<bool> daoCreateRoadmapTask({
    required String from,
    required int client,
    required int daoId,
    required int roadmapId,
    required String name,
    required int priority,
    required Uint8List tags,
    dynamic hint,
  }) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = api2wire_u32(roadmapId);
    var arg4 = _platform.api2wire_String(name);
    var arg5 = api2wire_u8(priority);
    var arg6 = _platform.api2wire_uint_8_list(tags);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_create_roadmap_task(
              port_,
              arg0,
              arg1,
              arg2,
              arg3,
              arg4,
              arg5,
              arg6),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoCreateRoadmapTaskConstMeta,
      argValues: [from, client, daoId, roadmapId, name, priority, tags],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoCreateRoadmapTaskConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_create_roadmap_task",
        argNames: [
          "from",
          "client",
          "daoId",
          "roadmapId",
          "name",
          "priority",
          "tags"
        ],
      );

  Future<bool> joinDao({
    required String from,
    required int client,
    required int daoId,
    required int shareExpect,
    required int value,
    dynamic hint,
  }) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = api2wire_u32(shareExpect);
    var arg4 = _platform.api2wire_u64(value);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_join_dao(port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kJoinDaoConstMeta,
      argValues: [from, client, daoId, shareExpect, value],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kJoinDaoConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "join_dao",
        argNames: ["from", "client", "daoId", "shareExpect", "value"],
      );

  Future<List<String>> daoMemebers({
    required int client,
    required int daoId,
    dynamic hint,
  }) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_dao_memebers(port_, arg0, arg1),
      parseSuccessData: _wire2api_StringList,
      constMeta: kDaoMemebersConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoMemebersConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_memebers",
        argNames: ["client", "daoId"],
      );

  Future<List<ProjectInfo>> daoProjects({
    required int client,
    required int daoId,
    dynamic hint,
  }) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_dao_projects(port_, arg0, arg1),
      parseSuccessData: _wire2api_list_project_info,
      constMeta: kDaoProjectsConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_projects",
        argNames: ["client", "daoId"],
      );

  Future<List<GuildInfo>> daoGuilds({
    required int client,
    required int daoId,
    dynamic hint,
  }) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_dao_guilds(port_, arg0, arg1),
      parseSuccessData: _wire2api_list_guild_info,
      constMeta: kDaoGuildsConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGuildsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_guilds",
        argNames: ["client", "daoId"],
      );

  Future<String> ss58(
      {required String address, int? prefix, dynamic hint}) async {
    return "";
    var arg0 = _platform.api2wire_String(address);
    var arg1 = _platform.api2wire_opt_box_autoadd_u16(prefix);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_ss58(port_, arg0, arg1),
      parseSuccessData: _wire2api_String,
      constMeta: kSs58ConstMeta,
      argValues: [address, prefix],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSs58ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "ss58",
        argNames: ["address", "prefix"],
      );

  Future<bool> createProject({required String from,
    required int client,
    required int daoId,
    required String name,
    required String desc,
    WithGovPs? ext,
    dynamic hint}) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_String(name);
    var arg4 = _platform.api2wire_String(desc);
    var arg5 = _platform.api2wire_opt_box_autoadd_with_gov_ps(ext);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_create_project(
              port_,
              arg0,
              arg1,
              arg2,
              arg3,
              arg4,
              arg5),
      parseSuccessData: _wire2api_bool,
      constMeta: kCreateProjectConstMeta,
      argValues: [from, client, daoId, name, desc, ext],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kCreateProjectConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "create_project",
        argNames: ["from", "client", "daoId", "name", "desc", "ext"],
      );

  Future<bool> createGuild({required String from,
    required int client,
    required int daoId,
    required String name,
    required String desc,
    WithGovPs? ext,
    dynamic hint}) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_String(name);
    var arg4 = _platform.api2wire_String(desc);
    var arg5 = _platform.api2wire_opt_box_autoadd_with_gov_ps(ext);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_create_guild(
              port_,
              arg0,
              arg1,
              arg2,
              arg3,
              arg4,
              arg5),
      parseSuccessData: _wire2api_bool,
      constMeta: kCreateGuildConstMeta,
      argValues: [from, client, daoId, name, desc, ext],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kCreateGuildConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "create_guild",
        argNames: ["from", "client", "daoId", "name", "desc", "ext"],
      );

  Future<List<GovProps>> daoGovPendingReferendumList(
      {required int client, required int daoId, dynamic hint}) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_gov_pending_referendum_list(port_, arg0, arg1),
      parseSuccessData: _wire2api_list_gov_props,
      constMeta: kDaoGovPendingReferendumListConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGovPendingReferendumListConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_gov_pending_referendum_list",
        argNames: ["client", "daoId"],
      );

  Future<List<GovReferendum>> daoGovReferendumList(
      {required int client, required int daoId, dynamic hint}) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_gov_referendum_list(port_, arg0, arg1),
      parseSuccessData: _wire2api_list_gov_referendum,
      constMeta: kDaoGovReferendumListConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGovReferendumListConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_gov_referendum_list",
        argNames: ["client", "daoId"],
      );

  Future<bool> daoGovStartReferendum({required String from,
    required int client,
    required int daoId,
    required int index,
    dynamic hint}) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = api2wire_u32(index);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_gov_start_referendum(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoGovStartReferendumConstMeta,
      argValues: [from, client, daoId, index],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGovStartReferendumConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_gov_start_referendum",
        argNames: ["from", "client", "daoId", "index"],
      );

  Future<bool> daoGovVoteForReferendum({required String from,
    required int client,
    required int daoId,
    required int index,
    required int vote,
    required bool approve,
    dynamic hint}) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = api2wire_u32(index);
    var arg4 = _platform.api2wire_u64(vote);
    var arg5 = approve;
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_gov_vote_for_referendum(
              port_,
              arg0,
              arg1,
              arg2,
              arg3,
              arg4,
              arg5),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoGovVoteForReferendumConstMeta,
      argValues: [from, client, daoId, index, vote, approve],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGovVoteForReferendumConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_gov_vote_for_referendum",
        argNames: ["from", "client", "daoId", "index", "vote", "approve"],
      );

  Future<List<GovVote>> daoGovVotesOfUser({required String from,
    required int client,
    required int daoId,
    dynamic hint}) async {
    return const [];
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_gov_votes_of_user(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_list_gov_vote,
      constMeta: kDaoGovVotesOfUserConstMeta,
      argValues: [from, client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGovVotesOfUserConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_gov_votes_of_user",
        argNames: ["from", "client", "daoId"],
      );

  Future<bool> daoGovRunProposal({required String from,
    required int client,
    required int daoId,
    required int index,
    dynamic hint}) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = api2wire_u32(index);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_gov_run_proposal(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoGovRunProposalConstMeta,
      argValues: [from, client, daoId, index],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGovRunProposalConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_gov_run_proposal",
        argNames: ["from", "client", "daoId", "index"],
      );

  Future<bool> daoGovUnlock({required String from,
    required int client,
    required int daoId,
    dynamic hint}) async {
    return true;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_gov_unlock(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoGovUnlockConstMeta,
      argValues: [from, client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGovUnlockConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_gov_unlock",
        argNames: ["from", "client", "daoId"],
      );

  Future<List<String>> daoMemeberList(
      {required int client, required int daoId, dynamic hint}) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_memeber_list(port_, arg0, arg1),
      parseSuccessData: _wire2api_StringList,
      constMeta: kDaoMemeberListConstMeta,
      argValues: [client, daoId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoMemeberListConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_memeber_list",
        argNames: ["client", "daoId"],
      );

  Future<List<String>> daoGuildMemeberList({required int client,
    required int daoId,
    required int guildId,
    dynamic hint}) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    var arg2 = _platform.api2wire_u64(guildId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_guild_memeber_list(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_StringList,
      constMeta: kDaoGuildMemeberListConstMeta,
      argValues: [client, daoId, guildId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGuildMemeberListConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_guild_memeber_list",
        argNames: ["client", "daoId", "guildId"],
      );

  Future<List<String>> daoProjectMemberList({required int client,
    required int daoId,
    required int projectId,
    dynamic hint}) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    var arg2 = _platform.api2wire_u64(projectId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_project_member_list(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_StringList,
      constMeta: kDaoProjectMemberListConstMeta,
      argValues: [client, daoId, projectId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectMemberListConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_member_list",
        argNames: ["client", "daoId", "projectId"],
      );

  Future<List<TaskInfo>> daoProjectTaskList(
      {required int client, required int projectId, dynamic hint}) async {
    return const [];
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(projectId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_project_task_list(port_, arg0, arg1),
      parseSuccessData: _wire2api_list_task_info,
      constMeta: kDaoProjectTaskListConstMeta,
      argValues: [client, projectId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectTaskListConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_task_list",
        argNames: ["client", "projectId"],
      );

  Future<TaskInfo> daoProjectTaskInfo({required int client,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return TaskInfo(
      id: 1,
      name: "mock",
      description: "mock",
      point: 1,
      priority: 1,
      projectId: 1,
      creator: "mock",
      rewards: [],
      maxAssignee: 1,
      assignees: ["mock"],
      reviewers: ["mock"],
      skills: Uint8List(0),
      status: 1,
    );
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(projectId);
    var arg2 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_project_task_info(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_task_info,
      constMeta: kDaoProjectTaskInfoConstMeta,
      argValues: [client, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectTaskInfoConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_task_info",
        argNames: ["client", "projectId", "taskId"],
      );

  Future<bool> daoProjectCreateTask({required String from,
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
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_String(name);
    var arg5 = _platform.api2wire_String(desc);
    var arg6 = api2wire_u8(priority);
    var arg7 = api2wire_u16(point);
    var arg8 = _platform.api2wire_opt_StringList(assignees);
    var arg9 = _platform.api2wire_opt_StringList(reviewers);
    var arg10 = _platform.api2wire_opt_uint_8_list(skills);
    var arg11 = _platform.api2wire_opt_box_autoadd_u8(maxAssignee);
    var arg12 = _platform.api2wire_u64(amount);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_project_create_task(
              port_,
              arg0,
              arg1,
              arg2,
              arg3,
              arg4,
              arg5,
              arg6,
              arg7,
              arg8,
              arg9,
              arg10,
              arg11,
              arg12),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectCreateTaskConstMeta,
      argValues: [
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
        amount
      ],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectCreateTaskConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_create_task",
        argNames: [
          "from",
          "client",
          "daoId",
          "projectId",
          "name",
          "desc",
          "priority",
          "point",
          "assignees",
          "reviewers",
          "skills",
          "maxAssignee",
          "amount"
        ],
      );

  Future<bool> daoProjectStartTask({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_project_start_task(port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectStartTaskConstMeta,
      argValues: [from, client, daoId, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectStartTaskConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_start_task",
        argNames: ["from", "client", "daoId", "projectId", "taskId"],
      );

  Future<bool> daoProjectRequestReview({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_project_request_review(
              port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectRequestReviewConstMeta,
      argValues: [from, client, daoId, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectRequestReviewConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_request_review",
        argNames: ["from", "client", "daoId", "projectId", "taskId"],
      );

  Future<bool> daoProjectTaskDone({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_project_task_done(port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectTaskDoneConstMeta,
      argValues: [from, client, daoId, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectTaskDoneConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_task_done",
        argNames: ["from", "client", "daoId", "projectId", "taskId"],
      );

  Future<bool> daoProjectJoinTask({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_project_join_task(port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectJoinTaskConstMeta,
      argValues: [from, client, daoId, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinTaskConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_join_task",
        argNames: ["from", "client", "daoId", "projectId", "taskId"],
      );

  Future<bool> daoProjectLeaveTask({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_project_leave_task(port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectLeaveTaskConstMeta,
      argValues: [from, client, daoId, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectLeaveTaskConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_leave_task",
        argNames: ["from", "client", "daoId", "projectId", "taskId"],
      );

  Future<bool> daoProjectJoinTaskReview({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_project_join_task_review(
              port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectJoinTaskReviewConstMeta,
      argValues: [from, client, daoId, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinTaskReviewConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_join_task_review",
        argNames: ["from", "client", "daoId", "projectId", "taskId"],
      );

  Future<bool> daoProjectLeaveTaskReview({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_project_leave_task_review(
              port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectLeaveTaskReviewConstMeta,
      argValues: [from, client, daoId, projectId, taskId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectLeaveTaskReviewConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_leave_task_review",
        argNames: ["from", "client", "daoId", "projectId", "taskId"],
      );

  Future<bool> daoProjectMakeReview({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int taskId,
    required bool approve,
    required String meta,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(taskId);
    var arg5 = approve;
    var arg6 = _platform.api2wire_String(meta);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_project_make_review(
              port_,
              arg0,
              arg1,
              arg2,
              arg3,
              arg4,
              arg5,
              arg6),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectMakeReviewConstMeta,
      argValues: [from, client, daoId, projectId, taskId, approve, meta],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectMakeReviewConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_make_review",
        argNames: [
          "from",
          "client",
          "daoId",
          "projectId",
          "taskId",
          "approve",
          "meta"
        ],
      );

  Future<bool> daoProjectJoinRequest({required String from,
    required int client,
    required int daoId,
    required int projectId,
    WithGovPs? ext,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_opt_box_autoadd_with_gov_ps(ext);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_project_join_request(
              port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectJoinRequestConstMeta,
      argValues: [from, client, daoId, projectId, ext],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinRequestConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_join_request",
        argNames: ["from", "client", "daoId", "projectId", "ext"],
      );

  Future<bool> daoProjectJoinRequestWithRoot({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required String user,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_String(user);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_project_join_request_with_root(
              port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoProjectJoinRequestWithRootConstMeta,
      argValues: [from, client, daoId, projectId, user],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinRequestWithRootConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_project_join_request_with_root",
        argNames: ["from", "client", "daoId", "projectId", "user"],
      );

  Future<bool> daoGuildJoinRequest({required String from,
    required int client,
    required int daoId,
    required int guildId,
    WithGovPs? ext,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(guildId);
    var arg4 = _platform.api2wire_opt_box_autoadd_with_gov_ps(ext);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner
              .wire_dao_guild_join_request(port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoGuildJoinRequestConstMeta,
      argValues: [from, client, daoId, guildId, ext],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoGuildJoinRequestConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_guild_join_request",
        argNames: ["from", "client", "daoId", "guildId", "ext"],
      );

  Future<int> daoMemberPoint({required int client,
    required int daoId,
    required String member,
    dynamic hint}) async {
    return 0;
    var arg0 = api2wire_u32(client);
    var arg1 = _platform.api2wire_u64(daoId);
    var arg2 = _platform.api2wire_String(member);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_member_point(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_u32,
      constMeta: kDaoMemberPointConstMeta,
      argValues: [client, daoId, member],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoMemberPointConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_member_point",
        argNames: ["client", "daoId", "member"],
      );

  Future<bool> daoApplyProjectFunds({required String from,
    required int client,
    required int daoId,
    required int projectId,
    required int amount,
    WithGovPs? ext,
    dynamic hint}) async {
    return false;
    var arg0 = _platform.api2wire_String(from);
    var arg1 = api2wire_u32(client);
    var arg2 = _platform.api2wire_u64(daoId);
    var arg3 = _platform.api2wire_u64(projectId);
    var arg4 = _platform.api2wire_u64(amount);
    var arg5 = _platform.api2wire_opt_box_autoadd_with_gov_ps(ext);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_dao_apply_project_funds(
              port_,
              arg0,
              arg1,
              arg2,
              arg3,
              arg4,
              arg5),
      parseSuccessData: _wire2api_bool,
      constMeta: kDaoApplyProjectFundsConstMeta,
      argValues: [from, client, daoId, projectId, amount, ext],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDaoApplyProjectFundsConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "dao_apply_project_funds",
        argNames: ["from", "client", "daoId", "projectId", "amount", "ext"],
      );

  void dispose() {
    _platform.dispose();
  }

// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  List<String> _wire2api_StringList(dynamic raw) {
    return (raw as List<dynamic>).cast<String>();
  }

  AssetAccountData _wire2api_asset_account_data(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return AssetAccountData(
      free: _wire2api_u64(arr[0]),
      reserved: _wire2api_u64(arr[1]),
      frozen: _wire2api_u64(arr[2]),
    );
  }

  bool _wire2api_bool(dynamic raw) {
    return raw as bool;
  }

  DaoInfo _wire2api_dao_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 8)
      throw Exception('unexpected arr length: expect 8 but see ${arr.length}');
    return DaoInfo(
      id: _wire2api_u64(arr[0]),
      creator: _wire2api_String(arr[1]),
      startBlock: _wire2api_u64(arr[2]),
      daoAccountId: _wire2api_String(arr[3]),
      name: _wire2api_String(arr[4]),
      purpose: _wire2api_String(arr[5]),
      metaData: _wire2api_String(arr[6]),
      chainUnit: _wire2api_u64(arr[7]),
    );
  }

  GovProps _wire2api_gov_props(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 5)
      throw Exception('unexpected arr length: expect 5 but see ${arr.length}');
    return GovProps(
      index: _wire2api_u32(arr[0]),
      hash: _wire2api_String(arr[1]),
      runtimeCall: _wire2api_String(arr[2]),
      memberGroup: _wire2api_member_group(arr[3]),
      account: _wire2api_String(arr[4]),
    );
  }

  GovReferendum _wire2api_gov_referendum(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 8)
      throw Exception('unexpected arr length: expect 8 but see ${arr.length}');
    return GovReferendum(
      id: _wire2api_u32(arr[0]),
      hash: _wire2api_String(arr[1]),
      end: _wire2api_u64(arr[2]),
      proposal: _wire2api_String(arr[3]),
      delay: _wire2api_u64(arr[4]),
      tally: _wire2api_tally(arr[5]),
      memberGroup: _wire2api_member_group(arr[6]),
      status: _wire2api_u8(arr[7]),
    );
  }

  GovVote _wire2api_gov_vote(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 6)
      throw Exception('unexpected arr length: expect 6 but see ${arr.length}');
    return GovVote(
      daoId: _wire2api_u64(arr[0]),
      pledge: _wire2api_u64(arr[1]),
      opinion: _wire2api_u8(arr[2]),
      voteWeight: _wire2api_u64(arr[3]),
      unlockBlock: _wire2api_u64(arr[4]),
      referendumIndex: _wire2api_u32(arr[5]),
    );
  }

  GuildInfo _wire2api_guild_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 8)
      throw Exception('unexpected arr length: expect 8 but see ${arr.length}');
    return GuildInfo(
      id: _wire2api_u64(arr[0]),
      creator: _wire2api_String(arr[1]),
      daoAccountId: _wire2api_String(arr[2]),
      startBlock: _wire2api_u64(arr[3]),
      name: _wire2api_String(arr[4]),
      desc: _wire2api_String(arr[5]),
      metaData: _wire2api_String(arr[6]),
      status: _wire2api_u8(arr[7]),
    );
  }

  List<GovProps> _wire2api_list_gov_props(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_gov_props).toList();
  }

  List<GovReferendum> _wire2api_list_gov_referendum(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_gov_referendum).toList();
  }

  List<GovVote> _wire2api_list_gov_vote(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_gov_vote).toList();
  }

  List<GuildInfo> _wire2api_list_guild_info(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_guild_info).toList();
  }

  List<ProjectInfo> _wire2api_list_project_info(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_project_info).toList();
  }

  List<Quarter> _wire2api_list_quarter(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_quarter).toList();
  }

  List<QuarterTask> _wire2api_list_quarter_task(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_quarter_task).toList();
  }

  List<Reward> _wire2api_list_reward(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_reward).toList();
  }

  List<TaskInfo> _wire2api_list_task_info(dynamic raw) {
    return (raw as List<dynamic>).map(_wire2api_task_info).toList();
  }

  MemberGroup _wire2api_member_group(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return MemberGroup(
      scope: _wire2api_u8(arr[0]),
      id: _wire2api_u64(arr[1]),
    );
  }

  ProjectInfo _wire2api_project_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 6)
      throw Exception('unexpected arr length: expect 6 but see ${arr.length}');
    return ProjectInfo(
      id: _wire2api_u64(arr[0]),
      name: _wire2api_String(arr[1]),
      daoAccountId: _wire2api_String(arr[2]),
      description: _wire2api_String(arr[3]),
      creator: _wire2api_String(arr[4]),
      status: _wire2api_u8(arr[5]),
    );
  }

  Quarter _wire2api_quarter(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return Quarter(
      year: _wire2api_u32(arr[0]),
      quarter: _wire2api_u32(arr[1]),
      tasks: _wire2api_list_quarter_task(arr[2]),
    );
  }

  QuarterTask _wire2api_quarter_task(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 6)
      throw Exception('unexpected arr length: expect 6 but see ${arr.length}');
    return QuarterTask(
      id: _wire2api_u64(arr[0]),
      name: _wire2api_String(arr[1]),
      priority: _wire2api_u8(arr[2]),
      creator: _wire2api_String(arr[3]),
      tags: _wire2api_uint_8_list(arr[4]),
      status: _wire2api_u8(arr[5]),
    );
  }

  Reward _wire2api_reward(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Reward(
      assetId: _wire2api_u64(arr[0]),
      amount: _wire2api_u64(arr[1]),
    );
  }

  Tally _wire2api_tally(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Tally(
      yes: _wire2api_u64(arr[0]),
      no: _wire2api_u64(arr[1]),
    );
  }

  TaskInfo _wire2api_task_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 13)
      throw Exception('unexpected arr length: expect 13 but see ${arr.length}');
    return TaskInfo(
      id: _wire2api_u64(arr[0]),
      name: _wire2api_String(arr[1]),
      description: _wire2api_String(arr[2]),
      point: _wire2api_u16(arr[3]),
      priority: _wire2api_u8(arr[4]),
      projectId: _wire2api_u64(arr[5]),
      creator: _wire2api_String(arr[6]),
      rewards: _wire2api_list_reward(arr[7]),
      maxAssignee: _wire2api_u8(arr[8]),
      assignees: _wire2api_StringList(arr[9]),
      reviewers: _wire2api_StringList(arr[10]),
      skills: _wire2api_uint_8_list(arr[11]),
      status: _wire2api_u8(arr[12]),
    );
  }

  int _wire2api_u16(dynamic raw) {
    return raw as int;
  }

  int _wire2api_u32(dynamic raw) {
    return raw as int;
  }

  int _wire2api_u64(dynamic raw) {
    return castInt(raw);
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }

  void _wire2api_unit(dynamic raw) {
    return;
  }

  int _wire2api_usize(dynamic raw) {
    return castInt(raw);
  }
}

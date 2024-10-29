// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:typed_data' as _i10;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/frame_support/pallet_id.dart' as _i14;
import '../types/sp_core/crypto/account_id32.dart' as _i6;
import '../types/wetee_org/app.dart' as _i7;
import '../types/wetee_org/guild_info.dart' as _i4;
import '../types/wetee_org/org_app.dart' as _i8;
import '../types/wetee_org/org_info.dart' as _i2;
import '../types/wetee_org/pallet/call.dart' as _i12;
import '../types/wetee_org/quarter_task.dart' as _i5;
import '../types/wetee_org/status.dart' as _i13;
import '../types/wetee_runtime/runtime_call.dart' as _i11;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, _i2.OrgInfo> _daos =
      const _i1.StorageMap<BigInt, _i2.OrgInfo>(
    prefix: 'WeTEEOrg',
    storage: 'Daos',
    valueCodec: _i2.OrgInfo.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageValue<BigInt> _nextDaoId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEOrg',
    storage: 'NextDaoId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageValue<BigInt> _nextAppId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEOrg',
    storage: 'NextAppId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, List<_i4.GuildInfo>> _guilds =
      const _i1.StorageMap<BigInt, List<_i4.GuildInfo>>(
    prefix: 'WeTEEOrg',
    storage: 'Guilds',
    valueCodec: _i3.SequenceCodec<_i4.GuildInfo>(_i4.GuildInfo.codec),
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, int, List<_i5.QuarterTask>> _roadMaps =
      const _i1.StorageDoubleMap<BigInt, int, List<_i5.QuarterTask>>(
    prefix: 'WeTEEOrg',
    storage: 'RoadMaps',
    valueCodec: _i3.SequenceCodec<_i5.QuarterTask>(_i5.QuarterTask.codec),
    hasher1: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageValue<BigInt> _nextTaskId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEOrg',
    storage: 'NextTaskId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, List<_i6.AccountId32>> _members =
      const _i1.StorageMap<BigInt, List<_i6.AccountId32>>(
    prefix: 'WeTEEOrg',
    storage: 'Members',
    valueCodec: _i3.SequenceCodec<_i6.AccountId32>(_i6.AccountId32Codec()),
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>
      _guildMembers =
      const _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>(
    prefix: 'WeTEEOrg',
    storage: 'GuildMembers',
    valueCodec: _i3.SequenceCodec<_i6.AccountId32>(_i6.AccountId32Codec()),
    hasher1: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>
      _projectMembers =
      const _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>(
    prefix: 'WeTEEOrg',
    storage: 'ProjectMembers',
    valueCodec: _i3.SequenceCodec<_i6.AccountId32>(_i6.AccountId32Codec()),
    hasher1: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i7.App> _appHubs =
      const _i1.StorageMap<BigInt, _i7.App>(
    prefix: 'WeTEEOrg',
    storage: 'AppHubs',
    valueCodec: _i7.App.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i8.OrgApp>> _orgApps =
      const _i1.StorageMap<BigInt, List<_i8.OrgApp>>(
    prefix: 'WeTEEOrg',
    storage: 'OrgApps',
    valueCodec: _i3.SequenceCodec<_i8.OrgApp>(_i8.OrgApp.codec),
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, _i6.AccountId32, int> _memberPoint =
      const _i1.StorageDoubleMap<BigInt, _i6.AccountId32, int>(
    prefix: 'WeTEEOrg',
    storage: 'MemberPoint',
    valueCodec: _i3.U32Codec.codec,
    hasher1: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i6.AccountId32Codec()),
  );

  /// All DAOs that have been created.
  /// 所有组织
  _i9.Future<_i2.OrgInfo?> daos(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _daos.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _daos.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The id of the next dao to be created.
  /// 获取下一个组织id
  _i9.Future<BigInt> nextDaoId({_i1.BlockHash? at}) async {
    final hashedKey = _nextDaoId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextDaoId.decodeValue(bytes);
    }
    return BigInt.from(5000); /* Default */
  }

  /// The id of the next dao to be created.
  /// 获取下一个组织id
  _i9.Future<BigInt> nextAppId({_i1.BlockHash? at}) async {
    final hashedKey = _nextAppId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextAppId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// the info of grutypes
  /// 组织内公会信息
  _i9.Future<List<_i4.GuildInfo>> guilds(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _guilds.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _guilds.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// the roadmap info of projects
  /// 组织内Roadmap信息
  _i9.Future<List<_i5.QuarterTask>> roadMaps(
    BigInt key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _roadMaps.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _roadMaps.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The id of the next dao to be created.
  /// 获取下一个组织id
  _i9.Future<BigInt> nextTaskId({_i1.BlockHash? at}) async {
    final hashedKey = _nextTaskId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextTaskId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// team members
  /// 团队的成员
  _i9.Future<List<_i6.AccountId32>> members(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _members.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _members.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// guild members
  /// 公会成员
  _i9.Future<List<_i6.AccountId32>> guildMembers(
    BigInt key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _guildMembers.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _guildMembers.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// project members
  /// 项目成员
  _i9.Future<List<_i6.AccountId32>> projectMembers(
    BigInt key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _projectMembers.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _projectMembers.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// apps hubs
  /// 应用中心
  _i9.Future<_i7.App?> appHubs(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _appHubs.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _appHubs.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// org apps
  /// 应用中心
  _i9.Future<List<_i8.OrgApp>> orgApps(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _orgApps.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _orgApps.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// point
  /// 成员贡献点
  _i9.Future<int> memberPoint(
    BigInt key1,
    _i6.AccountId32 key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _memberPoint.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _memberPoint.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// Returns the storage key for `daos`.
  _i10.Uint8List daosKey(BigInt key1) {
    final hashedKey = _daos.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `nextDaoId`.
  _i10.Uint8List nextDaoIdKey() {
    final hashedKey = _nextDaoId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `nextAppId`.
  _i10.Uint8List nextAppIdKey() {
    final hashedKey = _nextAppId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `guilds`.
  _i10.Uint8List guildsKey(BigInt key1) {
    final hashedKey = _guilds.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `roadMaps`.
  _i10.Uint8List roadMapsKey(
    BigInt key1,
    int key2,
  ) {
    final hashedKey = _roadMaps.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `nextTaskId`.
  _i10.Uint8List nextTaskIdKey() {
    final hashedKey = _nextTaskId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `members`.
  _i10.Uint8List membersKey(BigInt key1) {
    final hashedKey = _members.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `guildMembers`.
  _i10.Uint8List guildMembersKey(
    BigInt key1,
    BigInt key2,
  ) {
    final hashedKey = _guildMembers.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `projectMembers`.
  _i10.Uint8List projectMembersKey(
    BigInt key1,
    BigInt key2,
  ) {
    final hashedKey = _projectMembers.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `appHubs`.
  _i10.Uint8List appHubsKey(BigInt key1) {
    final hashedKey = _appHubs.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `orgApps`.
  _i10.Uint8List orgAppsKey(BigInt key1) {
    final hashedKey = _orgApps.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `memberPoint`.
  _i10.Uint8List memberPointKey(
    BigInt key1,
    _i6.AccountId32 key2,
  ) {
    final hashedKey = _memberPoint.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage map key prefix for `daos`.
  _i10.Uint8List daosMapPrefix() {
    final hashedKey = _daos.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `guilds`.
  _i10.Uint8List guildsMapPrefix() {
    final hashedKey = _guilds.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `roadMaps`.
  _i10.Uint8List roadMapsMapPrefix(BigInt key1) {
    final hashedKey = _roadMaps.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `members`.
  _i10.Uint8List membersMapPrefix() {
    final hashedKey = _members.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `guildMembers`.
  _i10.Uint8List guildMembersMapPrefix(BigInt key1) {
    final hashedKey = _guildMembers.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `projectMembers`.
  _i10.Uint8List projectMembersMapPrefix(BigInt key1) {
    final hashedKey = _projectMembers.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `appHubs`.
  _i10.Uint8List appHubsMapPrefix() {
    final hashedKey = _appHubs.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `orgApps`.
  _i10.Uint8List orgAppsMapPrefix() {
    final hashedKey = _orgApps.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `memberPoint`.
  _i10.Uint8List memberPointMapPrefix(BigInt key1) {
    final hashedKey = _memberPoint.mapPrefix(key1);
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Create a DAO
  /// 从一个通证池,创建一个组织
  _i11.RuntimeCall createDao({
    required List<int> name,
    required List<int> desc,
    required List<int> purpose,
    required List<int> metaData,
    required List<int> imApi,
    required List<int> bg,
    required List<int> logo,
    required List<int> img,
    required List<int> homeUrl,
  }) {
    final _call = _i12.Call.values.createDao(
      name: name,
      desc: desc,
      purpose: purpose,
      metaData: metaData,
      imApi: imApi,
      bg: bg,
      logo: logo,
      img: img,
      homeUrl: homeUrl,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }

  /// update dao info
  /// 更新组织信息
  _i11.RuntimeCall updateDao({
    required BigInt daoId,
    List<int>? name,
    List<int>? desc,
    List<int>? purpose,
    List<int>? metaData,
    List<int>? imApi,
    List<int>? bg,
    List<int>? logo,
    List<int>? img,
    List<int>? homeUrl,
    _i13.Status? status,
  }) {
    final _call = _i12.Call.values.updateDao(
      daoId: daoId,
      name: name,
      desc: desc,
      purpose: purpose,
      metaData: metaData,
      imApi: imApi,
      bg: bg,
      logo: logo,
      img: img,
      homeUrl: homeUrl,
      status: status,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }

  /// create task
  /// 创建任务
  _i11.RuntimeCall createRoadmapTask({
    required BigInt daoId,
    required int roadmapId,
    required List<int> name,
    required int priority,
    List<int>? tags,
  }) {
    final _call = _i12.Call.values.createRoadmapTask(
      daoId: daoId,
      roadmapId: roadmapId,
      name: name,
      priority: priority,
      tags: tags,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }

  /// update task
  /// 更新任务
  _i11.RuntimeCall updateRoadmapTask({
    required BigInt daoId,
    required int roadmapId,
    required BigInt taskId,
    required int priority,
    required int status,
    List<int>? tags,
  }) {
    final _call = _i12.Call.values.updateRoadmapTask(
      daoId: daoId,
      roadmapId: roadmapId,
      taskId: taskId,
      priority: priority,
      status: status,
      tags: tags,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }

  /// create app
  /// 创建APP
  _i11.RuntimeCall createApp({
    required List<int> name,
    required List<int> desc,
    required List<int> icon,
    required List<int> url,
  }) {
    final _call = _i12.Call.values.createApp(
      name: name,
      desc: desc,
      icon: icon,
      url: url,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }

  /// update app status
  /// 更新APP状态
  _i11.RuntimeCall updateAppStatus({
    required BigInt appId,
    required _i13.Status status,
  }) {
    final _call = _i12.Call.values.updateAppStatus(
      appId: appId,
      status: status,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }

  /// org integrate app
  /// 组织集成应用
  _i11.RuntimeCall orgIntegrateApp({
    required BigInt daoId,
    required BigInt appId,
  }) {
    final _call = _i12.Call.values.orgIntegrateApp(
      daoId: daoId,
      appId: appId,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }

  /// 更新APP状态
  _i11.RuntimeCall updateOrgAppStatus({
    required BigInt daoId,
    required BigInt appId,
    required _i13.Status status,
  }) {
    final _call = _i12.Call.values.updateOrgAppStatus(
      daoId: daoId,
      appId: appId,
      status: status,
    );
    return _i11.RuntimeCall.values.weTEEOrg(_call);
  }
}

class Constants {
  Constants();

  /// pallet id
  /// 模块id
  final _i14.PalletId palletId = const <int>[
    119,
    101,
    116,
    101,
    101,
    100,
    97,
    111,
  ];
}

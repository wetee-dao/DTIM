// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/frame_support/pallet_id.dart' as _i12;
import '../types/sp_core/crypto/account_id32.dart' as _i6;
import '../types/wetee_org/app.dart' as _i7;
import '../types/wetee_org/guild_info.dart' as _i4;
import '../types/wetee_org/org_app.dart' as _i8;
import '../types/wetee_org/org_info.dart' as _i2;
import '../types/wetee_org/pallet/call.dart' as _i11;
import '../types/wetee_org/quarter_task.dart' as _i5;
import '../types/wetee_runtime/runtime_call.dart' as _i10;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, _i2.OrgInfo> _daos =
      const _i1.StorageMap<BigInt, _i2.OrgInfo>(
    prefix: 'WeteeOrg',
    storage: 'Daos',
    valueCodec: _i2.OrgInfo.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageValue<BigInt> _nextDaoId = const _i1.StorageValue<BigInt>(
    prefix: 'WeteeOrg',
    storage: 'NextDaoId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageValue<BigInt> _nextAppId = const _i1.StorageValue<BigInt>(
    prefix: 'WeteeOrg',
    storage: 'NextAppId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, List<_i4.GuildInfo>> _guilds =
      const _i1.StorageMap<BigInt, List<_i4.GuildInfo>>(
    prefix: 'WeteeOrg',
    storage: 'Guilds',
    valueCodec: _i3.SequenceCodec<_i4.GuildInfo>(_i4.GuildInfo.codec),
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, int, List<_i5.QuarterTask>> _roadMaps =
      const _i1.StorageDoubleMap<BigInt, int, List<_i5.QuarterTask>>(
    prefix: 'WeteeOrg',
    storage: 'RoadMaps',
    valueCodec: _i3.SequenceCodec<_i5.QuarterTask>(_i5.QuarterTask.codec),
    hasher1: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageValue<BigInt> _nextTaskId = const _i1.StorageValue<BigInt>(
    prefix: 'WeteeOrg',
    storage: 'NextTaskId',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, List<_i6.AccountId32>> _members =
      const _i1.StorageMap<BigInt, List<_i6.AccountId32>>(
    prefix: 'WeteeOrg',
    storage: 'Members',
    valueCodec: _i3.SequenceCodec<_i6.AccountId32>(_i6.AccountId32Codec()),
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>
      _guildMembers =
      const _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>(
    prefix: 'WeteeOrg',
    storage: 'GuildMembers',
    valueCodec: _i3.SequenceCodec<_i6.AccountId32>(_i6.AccountId32Codec()),
    hasher1: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>
      _projectMembers =
      const _i1.StorageDoubleMap<BigInt, BigInt, List<_i6.AccountId32>>(
    prefix: 'WeteeOrg',
    storage: 'ProjectMembers',
    valueCodec: _i3.SequenceCodec<_i6.AccountId32>(_i6.AccountId32Codec()),
    hasher1: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i7.App> _appHubs =
      const _i1.StorageMap<BigInt, _i7.App>(
    prefix: 'WeteeOrg',
    storage: 'AppHubs',
    valueCodec: _i7.App.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i8.OrgApp>> _orgApps =
      const _i1.StorageMap<BigInt, List<_i8.OrgApp>>(
    prefix: 'WeteeOrg',
    storage: 'OrgApps',
    valueCodec: _i3.SequenceCodec<_i8.OrgApp>(_i8.OrgApp.codec),
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U64Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, _i6.AccountId32, int> _memberPoint =
      const _i1.StorageDoubleMap<BigInt, _i6.AccountId32, int>(
    prefix: 'WeteeOrg',
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
}

class Txs {
  const Txs();

  /// See [`Pallet::create_dao`].
  _i10.RuntimeCall createDao({
    required name,
    required desc,
    required purpose,
    required metaData,
    required imApi,
    required bg,
    required logo,
    required img,
    required homeUrl,
  }) {
    final _call = _i11.Call.values.createDao(
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
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }

  /// See [`Pallet::update_dao`].
  _i10.RuntimeCall updateDao({
    required daoId,
    name,
    desc,
    purpose,
    metaData,
    imApi,
    bg,
    logo,
    img,
    homeUrl,
    status,
  }) {
    final _call = _i11.Call.values.updateDao(
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
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }

  /// See [`Pallet::create_roadmap_task`].
  _i10.RuntimeCall createRoadmapTask({
    required daoId,
    required roadmapId,
    required name,
    required priority,
    tags,
  }) {
    final _call = _i11.Call.values.createRoadmapTask(
      daoId: daoId,
      roadmapId: roadmapId,
      name: name,
      priority: priority,
      tags: tags,
    );
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }

  /// See [`Pallet::update_roadmap_task`].
  _i10.RuntimeCall updateRoadmapTask({
    required daoId,
    required roadmapId,
    required taskId,
    required priority,
    required status,
    tags,
  }) {
    final _call = _i11.Call.values.updateRoadmapTask(
      daoId: daoId,
      roadmapId: roadmapId,
      taskId: taskId,
      priority: priority,
      status: status,
      tags: tags,
    );
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }

  /// See [`Pallet::create_app`].
  _i10.RuntimeCall createApp({
    required name,
    required desc,
    required icon,
    required url,
  }) {
    final _call = _i11.Call.values.createApp(
      name: name,
      desc: desc,
      icon: icon,
      url: url,
    );
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }

  /// See [`Pallet::update_app_status`].
  _i10.RuntimeCall updateAppStatus({
    required appId,
    required status,
  }) {
    final _call = _i11.Call.values.updateAppStatus(
      appId: appId,
      status: status,
    );
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }

  /// See [`Pallet::org_integrate_app`].
  _i10.RuntimeCall orgIntegrateApp({
    required daoId,
    required appId,
  }) {
    final _call = _i11.Call.values.orgIntegrateApp(
      daoId: daoId,
      appId: appId,
    );
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }

  /// See [`Pallet::update_org_app_status`].
  _i10.RuntimeCall updateOrgAppStatus({
    required daoId,
    required appId,
    required status,
  }) {
    final _call = _i11.Call.values.updateOrgAppStatus(
      daoId: daoId,
      appId: appId,
      status: status,
    );
    return _i10.RuntimeCall.values.weteeOrg(_call);
  }
}

class Constants {
  Constants();

  /// pallet id
  /// 模块id
  final _i12.PalletId palletId = const <int>[
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

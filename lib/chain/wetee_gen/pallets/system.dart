// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i4;

import '../types/frame_support/dispatch/per_dispatch_class_1.dart' as _i5;
import '../types/frame_support/dispatch/per_dispatch_class_2.dart' as _i18;
import '../types/frame_support/dispatch/per_dispatch_class_3.dart' as _i21;
import '../types/frame_system/account_info.dart' as _i3;
import '../types/frame_system/event_record.dart' as _i8;
import '../types/frame_system/last_runtime_upgrade_info.dart' as _i10;
import '../types/frame_system/limits/block_length.dart' as _i20;
import '../types/frame_system/limits/block_weights.dart' as _i17;
import '../types/frame_system/limits/weights_per_class.dart' as _i19;
import '../types/frame_system/pallet/call.dart' as _i16;
import '../types/frame_system/phase.dart' as _i11;
import '../types/pallet_balances/types/account_data.dart' as _i13;
import '../types/primitive_types/h256.dart' as _i6;
import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/sp_runtime/generic/digest/digest.dart' as _i7;
import '../types/sp_version/runtime_version.dart' as _i23;
import '../types/sp_weights/runtime_db_weight.dart' as _i22;
import '../types/sp_weights/weight_v2/weight.dart' as _i14;
import '../types/tuples.dart' as _i9;
import '../types/wetee_runtime/runtime_call.dart' as _i15;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.AccountId32, _i3.AccountInfo> _account =
      const _i1.StorageMap<_i2.AccountId32, _i3.AccountInfo>(
    prefix: 'System',
    storage: 'Account',
    valueCodec: _i3.AccountInfo.codec,
    hasher: _i1.StorageHasher.blake2b128Concat(_i2.AccountId32Codec()),
  );

  final _i1.StorageValue<int> _extrinsicCount = const _i1.StorageValue<int>(
    prefix: 'System',
    storage: 'ExtrinsicCount',
    valueCodec: _i4.U32Codec.codec,
  );

  final _i1.StorageValue<_i5.PerDispatchClass> _blockWeight =
      const _i1.StorageValue<_i5.PerDispatchClass>(
    prefix: 'System',
    storage: 'BlockWeight',
    valueCodec: _i5.PerDispatchClass.codec,
  );

  final _i1.StorageValue<int> _allExtrinsicsLen = const _i1.StorageValue<int>(
    prefix: 'System',
    storage: 'AllExtrinsicsLen',
    valueCodec: _i4.U32Codec.codec,
  );

  final _i1.StorageMap<BigInt, _i6.H256> _blockHash =
      const _i1.StorageMap<BigInt, _i6.H256>(
    prefix: 'System',
    storage: 'BlockHash',
    valueCodec: _i6.H256Codec(),
    hasher: _i1.StorageHasher.twoxx64Concat(_i4.U64Codec.codec),
  );

  final _i1.StorageMap<int, List<int>> _extrinsicData =
      const _i1.StorageMap<int, List<int>>(
    prefix: 'System',
    storage: 'ExtrinsicData',
    valueCodec: _i4.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i4.U32Codec.codec),
  );

  final _i1.StorageValue<BigInt> _number = const _i1.StorageValue<BigInt>(
    prefix: 'System',
    storage: 'Number',
    valueCodec: _i4.U64Codec.codec,
  );

  final _i1.StorageValue<_i6.H256> _parentHash =
      const _i1.StorageValue<_i6.H256>(
    prefix: 'System',
    storage: 'ParentHash',
    valueCodec: _i6.H256Codec(),
  );

  final _i1.StorageValue<_i7.Digest> _digest =
      const _i1.StorageValue<_i7.Digest>(
    prefix: 'System',
    storage: 'Digest',
    valueCodec: _i7.Digest.codec,
  );

  final _i1.StorageValue<List<_i8.EventRecord>> _events =
      const _i1.StorageValue<List<_i8.EventRecord>>(
    prefix: 'System',
    storage: 'Events',
    valueCodec: _i4.SequenceCodec<_i8.EventRecord>(_i8.EventRecord.codec),
  );

  final _i1.StorageValue<int> _eventCount = const _i1.StorageValue<int>(
    prefix: 'System',
    storage: 'EventCount',
    valueCodec: _i4.U32Codec.codec,
  );

  final _i1.StorageMap<_i6.H256, List<_i9.Tuple2<BigInt, int>>> _eventTopics =
      const _i1.StorageMap<_i6.H256, List<_i9.Tuple2<BigInt, int>>>(
    prefix: 'System',
    storage: 'EventTopics',
    valueCodec:
        _i4.SequenceCodec<_i9.Tuple2<BigInt, int>>(_i9.Tuple2Codec<BigInt, int>(
      _i4.U64Codec.codec,
      _i4.U32Codec.codec,
    )),
    hasher: _i1.StorageHasher.blake2b128Concat(_i6.H256Codec()),
  );

  final _i1.StorageValue<_i10.LastRuntimeUpgradeInfo> _lastRuntimeUpgrade =
      const _i1.StorageValue<_i10.LastRuntimeUpgradeInfo>(
    prefix: 'System',
    storage: 'LastRuntimeUpgrade',
    valueCodec: _i10.LastRuntimeUpgradeInfo.codec,
  );

  final _i1.StorageValue<bool> _upgradedToU32RefCount =
      const _i1.StorageValue<bool>(
    prefix: 'System',
    storage: 'UpgradedToU32RefCount',
    valueCodec: _i4.BoolCodec.codec,
  );

  final _i1.StorageValue<bool> _upgradedToTripleRefCount =
      const _i1.StorageValue<bool>(
    prefix: 'System',
    storage: 'UpgradedToTripleRefCount',
    valueCodec: _i4.BoolCodec.codec,
  );

  final _i1.StorageValue<_i11.Phase> _executionPhase =
      const _i1.StorageValue<_i11.Phase>(
    prefix: 'System',
    storage: 'ExecutionPhase',
    valueCodec: _i11.Phase.codec,
  );

  /// The full account information for a particular account ID.
  _i12.Future<_i3.AccountInfo> account(
    _i2.AccountId32 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _account.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _account.decodeValue(bytes);
    }
    return _i3.AccountInfo(
      nonce: BigInt.zero,
      consumers: 0,
      providers: 0,
      sufficients: 0,
      data: _i13.AccountData(
        free: BigInt.zero,
        reserved: BigInt.zero,
        frozen: BigInt.zero,
        flags: BigInt.parse(
          '170141183460469231731687303715884105728',
          radix: 10,
        ),
      ),
    ); /* Default */
  }

  /// Total extrinsics count for the current block.
  _i12.Future<int?> extrinsicCount({_i1.BlockHash? at}) async {
    final hashedKey = _extrinsicCount.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _extrinsicCount.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The current weight for the block.
  _i12.Future<_i5.PerDispatchClass> blockWeight({_i1.BlockHash? at}) async {
    final hashedKey = _blockWeight.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _blockWeight.decodeValue(bytes);
    }
    return _i5.PerDispatchClass(
      normal: _i14.Weight(
        refTime: BigInt.zero,
        proofSize: BigInt.zero,
      ),
      operational: _i14.Weight(
        refTime: BigInt.zero,
        proofSize: BigInt.zero,
      ),
      mandatory: _i14.Weight(
        refTime: BigInt.zero,
        proofSize: BigInt.zero,
      ),
    ); /* Default */
  }

  /// Total length (in bytes) for all extrinsics put together, for the current block.
  _i12.Future<int?> allExtrinsicsLen({_i1.BlockHash? at}) async {
    final hashedKey = _allExtrinsicsLen.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _allExtrinsicsLen.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Map of block numbers to block hashes.
  _i12.Future<_i6.H256> blockHash(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _blockHash.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _blockHash.decodeValue(bytes);
    }
    return List<int>.filled(
      32,
      0,
      growable: false,
    ); /* Default */
  }

  /// Extrinsics data for the current block (maps an extrinsic's index to its data).
  _i12.Future<List<int>> extrinsicData(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _extrinsicData.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _extrinsicData.decodeValue(bytes);
    }
    return List<int>.filled(
      0,
      0,
      growable: true,
    ); /* Default */
  }

  /// The current block number being processed. Set by `execute_block`.
  _i12.Future<BigInt> number({_i1.BlockHash? at}) async {
    final hashedKey = _number.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _number.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// Hash of the previous block.
  _i12.Future<_i6.H256> parentHash({_i1.BlockHash? at}) async {
    final hashedKey = _parentHash.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _parentHash.decodeValue(bytes);
    }
    return List<int>.filled(
      32,
      0,
      growable: false,
    ); /* Default */
  }

  /// Digest of the current block, also part of the block header.
  _i12.Future<_i7.Digest> digest({_i1.BlockHash? at}) async {
    final hashedKey = _digest.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _digest.decodeValue(bytes);
    }
    return _i7.Digest(logs: []); /* Default */
  }

  /// Events deposited for the current block.
  ///
  /// NOTE: The item is unbound and should therefore never be read on chain.
  /// It could otherwise inflate the PoV size of a block.
  ///
  /// Events have a large in-memory size. Box the events to not go out-of-memory
  /// just in case someone still reads them from within the runtime.
  _i12.Future<List<_i8.EventRecord>> events({_i1.BlockHash? at}) async {
    final hashedKey = _events.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _events.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The number of events in the `Events<T>` list.
  _i12.Future<int> eventCount({_i1.BlockHash? at}) async {
    final hashedKey = _eventCount.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _eventCount.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// Mapping between a topic (represented by T::Hash) and a vector of indexes
  /// of events in the `<Events<T>>` list.
  ///
  /// All topic vectors have deterministic storage locations depending on the topic. This
  /// allows light-clients to leverage the changes trie storage tracking mechanism and
  /// in case of changes fetch the list of events of interest.
  ///
  /// The value has the type `(BlockNumberFor<T>, EventIndex)` because if we used only just
  /// the `EventIndex` then in case if the topic has the same contents on the next block
  /// no notification will be triggered thus the event might be lost.
  _i12.Future<List<_i9.Tuple2<BigInt, int>>> eventTopics(
    _i6.H256 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _eventTopics.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _eventTopics.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Stores the `spec_version` and `spec_name` of when the last runtime upgrade happened.
  _i12.Future<_i10.LastRuntimeUpgradeInfo?> lastRuntimeUpgrade(
      {_i1.BlockHash? at}) async {
    final hashedKey = _lastRuntimeUpgrade.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _lastRuntimeUpgrade.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// True if we have upgraded so that `type RefCount` is `u32`. False (default) if not.
  _i12.Future<bool> upgradedToU32RefCount({_i1.BlockHash? at}) async {
    final hashedKey = _upgradedToU32RefCount.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _upgradedToU32RefCount.decodeValue(bytes);
    }
    return false; /* Default */
  }

  /// True if we have upgraded so that AccountInfo contains three types of `RefCount`. False
  /// (default) if not.
  _i12.Future<bool> upgradedToTripleRefCount({_i1.BlockHash? at}) async {
    final hashedKey = _upgradedToTripleRefCount.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _upgradedToTripleRefCount.decodeValue(bytes);
    }
    return false; /* Default */
  }

  /// The execution phase of the block.
  _i12.Future<_i11.Phase?> executionPhase({_i1.BlockHash? at}) async {
    final hashedKey = _executionPhase.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _executionPhase.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::remark`].
  _i15.RuntimeCall remark({required remark}) {
    final _call = _i16.Call.values.remark(remark: remark);
    return _i15.RuntimeCall.values.system(_call);
  }

  /// See [`Pallet::set_heap_pages`].
  _i15.RuntimeCall setHeapPages({required pages}) {
    final _call = _i16.Call.values.setHeapPages(pages: pages);
    return _i15.RuntimeCall.values.system(_call);
  }

  /// See [`Pallet::set_code`].
  _i15.RuntimeCall setCode({required code}) {
    final _call = _i16.Call.values.setCode(code: code);
    return _i15.RuntimeCall.values.system(_call);
  }

  /// See [`Pallet::set_code_without_checks`].
  _i15.RuntimeCall setCodeWithoutChecks({required code}) {
    final _call = _i16.Call.values.setCodeWithoutChecks(code: code);
    return _i15.RuntimeCall.values.system(_call);
  }

  /// See [`Pallet::set_storage`].
  _i15.RuntimeCall setStorage({required items}) {
    final _call = _i16.Call.values.setStorage(items: items);
    return _i15.RuntimeCall.values.system(_call);
  }

  /// See [`Pallet::kill_storage`].
  _i15.RuntimeCall killStorage({required keys}) {
    final _call = _i16.Call.values.killStorage(keys: keys);
    return _i15.RuntimeCall.values.system(_call);
  }

  /// See [`Pallet::kill_prefix`].
  _i15.RuntimeCall killPrefix({
    required prefix,
    required subkeys,
  }) {
    final _call = _i16.Call.values.killPrefix(
      prefix: prefix,
      subkeys: subkeys,
    );
    return _i15.RuntimeCall.values.system(_call);
  }

  /// See [`Pallet::remark_with_event`].
  _i15.RuntimeCall remarkWithEvent({required remark}) {
    final _call = _i16.Call.values.remarkWithEvent(remark: remark);
    return _i15.RuntimeCall.values.system(_call);
  }
}

class Constants {
  Constants();

  /// Block & extrinsics weights: base values and limits.
  final _i17.BlockWeights blockWeights = _i17.BlockWeights(
    baseBlock: _i14.Weight(
      refTime: BigInt.from(390584000),
      proofSize: BigInt.zero,
    ),
    maxBlock: _i14.Weight(
      refTime: BigInt.from(2000000000000),
      proofSize: BigInt.parse(
        '18446744073709551615',
        radix: 10,
      ),
    ),
    perClass: _i18.PerDispatchClass(
      normal: _i19.WeightsPerClass(
        baseExtrinsic: _i14.Weight(
          refTime: BigInt.from(124414000),
          proofSize: BigInt.zero,
        ),
        maxExtrinsic: _i14.Weight(
          refTime: BigInt.from(1299875586000),
          proofSize: BigInt.parse(
            '11990383647911208550',
            radix: 10,
          ),
        ),
        maxTotal: _i14.Weight(
          refTime: BigInt.from(1500000000000),
          proofSize: BigInt.parse(
            '13835058055282163711',
            radix: 10,
          ),
        ),
        reserved: _i14.Weight(
          refTime: BigInt.zero,
          proofSize: BigInt.zero,
        ),
      ),
      operational: _i19.WeightsPerClass(
        baseExtrinsic: _i14.Weight(
          refTime: BigInt.from(124414000),
          proofSize: BigInt.zero,
        ),
        maxExtrinsic: _i14.Weight(
          refTime: BigInt.from(1799875586000),
          proofSize: BigInt.parse(
            '16602069666338596454',
            radix: 10,
          ),
        ),
        maxTotal: _i14.Weight(
          refTime: BigInt.from(2000000000000),
          proofSize: BigInt.parse(
            '18446744073709551615',
            radix: 10,
          ),
        ),
        reserved: _i14.Weight(
          refTime: BigInt.from(500000000000),
          proofSize: BigInt.parse(
            '4611686018427387904',
            radix: 10,
          ),
        ),
      ),
      mandatory: _i19.WeightsPerClass(
        baseExtrinsic: _i14.Weight(
          refTime: BigInt.from(124414000),
          proofSize: BigInt.zero,
        ),
        maxExtrinsic: null,
        maxTotal: null,
        reserved: null,
      ),
    ),
  );

  /// The maximum length of a block (in bytes).
  final _i20.BlockLength blockLength = const _i20.BlockLength(
      max: _i21.PerDispatchClass(
    normal: 3932160,
    operational: 5242880,
    mandatory: 5242880,
  ));

  /// Maximum number of block number to block hash mappings to keep (oldest pruned first).
  final BigInt blockHashCount = BigInt.from(2400);

  /// The weight of runtime database operations the runtime can invoke.
  final _i22.RuntimeDbWeight dbWeight = _i22.RuntimeDbWeight(
    read: BigInt.from(25000000),
    write: BigInt.from(100000000),
  );

  /// Get the chain's current version.
  final _i23.RuntimeVersion version = const _i23.RuntimeVersion(
    specName: 'WeTEE',
    implName: 'WeTEE runtime',
    authoringVersion: 1,
    specVersion: 100,
    implVersion: 1,
    apis: [
      _i9.Tuple2<List<int>, int>(
        <int>[
          223,
          106,
          203,
          104,
          153,
          7,
          96,
          155,
        ],
        4,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          55,
          227,
          151,
          252,
          124,
          145,
          245,
          228,
        ],
        2,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          64,
          254,
          58,
          212,
          1,
          248,
          149,
          154,
        ],
        6,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          210,
          188,
          152,
          151,
          238,
          208,
          143,
          21,
        ],
        3,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          247,
          139,
          39,
          139,
          229,
          63,
          69,
          76,
        ],
        2,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          221,
          113,
          141,
          92,
          197,
          50,
          98,
          212,
        ],
        1,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          171,
          60,
          5,
          114,
          41,
          31,
          235,
          139,
        ],
        1,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          237,
          153,
          197,
          172,
          178,
          94,
          237,
          245,
        ],
        3,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          188,
          157,
          137,
          144,
          79,
          91,
          146,
          63,
        ],
        1,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          55,
          200,
          187,
          19,
          80,
          169,
          162,
          168,
        ],
        4,
      ),
      _i9.Tuple2<List<int>, int>(
        <int>[
          243,
          255,
          20,
          213,
          171,
          82,
          112,
          89,
        ],
        3,
      ),
    ],
    transactionVersion: 1,
    stateVersion: 1,
  );

  /// The designated SS58 prefix of this chain.
  ///
  /// This replaces the "ss58Format" property declared in the chain spec. Reason is
  /// that the runtime should know about the prefix in order to make use of it as
  /// an identifier of the chain.
  final int sS58Prefix = 42;
}

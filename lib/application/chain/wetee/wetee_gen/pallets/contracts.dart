// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:typed_data' as _i9;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/pallet_contracts/api_version.dart' as _i20;
import '../types/pallet_contracts/environment.dart' as _i19;
import '../types/pallet_contracts/pallet/call.dart' as _i12;
import '../types/pallet_contracts/schedule/instruction_weights.dart' as _i17;
import '../types/pallet_contracts/schedule/limits.dart' as _i16;
import '../types/pallet_contracts/schedule/schedule.dart' as _i15;
import '../types/pallet_contracts/storage/contract_info.dart' as _i6;
import '../types/pallet_contracts/storage/deletion_queue_manager.dart' as _i7;
import '../types/pallet_contracts/wasm/code_info.dart' as _i4;
import '../types/pallet_contracts/wasm/determinism.dart' as _i13;
import '../types/primitive_types/h256.dart' as _i2;
import '../types/sp_arithmetic/per_things/perbill.dart' as _i18;
import '../types/sp_core/crypto/account_id32.dart' as _i5;
import '../types/sp_runtime/multiaddress/multi_address.dart' as _i11;
import '../types/sp_weights/weight_v2/weight.dart' as _i14;
import '../types/wetee_runtime/runtime_call.dart' as _i10;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.H256, List<int>> _pristineCode =
      const _i1.StorageMap<_i2.H256, List<int>>(
    prefix: 'Contracts',
    storage: 'PristineCode',
    valueCodec: _i3.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.identity(_i2.H256Codec()),
  );

  final _i1.StorageMap<_i2.H256, _i4.CodeInfo> _codeInfoOf =
      const _i1.StorageMap<_i2.H256, _i4.CodeInfo>(
    prefix: 'Contracts',
    storage: 'CodeInfoOf',
    valueCodec: _i4.CodeInfo.codec,
    hasher: _i1.StorageHasher.identity(_i2.H256Codec()),
  );

  final _i1.StorageValue<BigInt> _nonce = const _i1.StorageValue<BigInt>(
    prefix: 'Contracts',
    storage: 'Nonce',
    valueCodec: _i3.U64Codec.codec,
  );

  final _i1.StorageMap<_i5.AccountId32, _i6.ContractInfo> _contractInfoOf =
      const _i1.StorageMap<_i5.AccountId32, _i6.ContractInfo>(
    prefix: 'Contracts',
    storage: 'ContractInfoOf',
    valueCodec: _i6.ContractInfo.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i5.AccountId32Codec()),
  );

  final _i1.StorageMap<int, List<int>> _deletionQueue =
      const _i1.StorageMap<int, List<int>>(
    prefix: 'Contracts',
    storage: 'DeletionQueue',
    valueCodec: _i3.U8SequenceCodec.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i3.U32Codec.codec),
  );

  final _i1.StorageValue<_i7.DeletionQueueManager> _deletionQueueCounter =
      const _i1.StorageValue<_i7.DeletionQueueManager>(
    prefix: 'Contracts',
    storage: 'DeletionQueueCounter',
    valueCodec: _i7.DeletionQueueManager.codec,
  );

  final _i1.StorageValue<List<int>> _migrationInProgress =
      const _i1.StorageValue<List<int>>(
    prefix: 'Contracts',
    storage: 'MigrationInProgress',
    valueCodec: _i3.U8SequenceCodec.codec,
  );

  /// A mapping from a contract's code hash to its code.
  _i8.Future<List<int>?> pristineCode(
    _i2.H256 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _pristineCode.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _pristineCode.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// A mapping from a contract's code hash to its code info.
  _i8.Future<_i4.CodeInfo?> codeInfoOf(
    _i2.H256 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _codeInfoOf.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _codeInfoOf.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// This is a **monotonic** counter incremented on contract instantiation.
  ///
  /// This is used in order to generate unique trie ids for contracts.
  /// The trie id of a new contract is calculated from hash(account_id, nonce).
  /// The nonce is required because otherwise the following sequence would lead to
  /// a possible collision of storage:
  ///
  /// 1. Create a new contract.
  /// 2. Terminate the contract.
  /// 3. Immediately recreate the contract with the same account_id.
  ///
  /// This is bad because the contents of a trie are deleted lazily and there might be
  /// storage of the old instantiation still in it when the new contract is created. Please
  /// note that we can't replace the counter by the block number because the sequence above
  /// can happen in the same block. We also can't keep the account counter in memory only
  /// because storage is the only way to communicate across different extrinsics in the
  /// same block.
  ///
  /// # Note
  ///
  /// Do not use it to determine the number of contracts. It won't be decremented if
  /// a contract is destroyed.
  _i8.Future<BigInt> nonce({_i1.BlockHash? at}) async {
    final hashedKey = _nonce.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nonce.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// The code associated with a given account.
  ///
  /// TWOX-NOTE: SAFE since `AccountId` is a secure hash.
  _i8.Future<_i6.ContractInfo?> contractInfoOf(
    _i5.AccountId32 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _contractInfoOf.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _contractInfoOf.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Evicted contracts that await child trie deletion.
  ///
  /// Child trie deletion is a heavy operation depending on the amount of storage items
  /// stored in said trie. Therefore this operation is performed lazily in `on_idle`.
  _i8.Future<List<int>?> deletionQueue(
    int key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _deletionQueue.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _deletionQueue.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// A pair of monotonic counters used to track the latest contract marked for deletion
  /// and the latest deleted contract in queue.
  _i8.Future<_i7.DeletionQueueManager> deletionQueueCounter(
      {_i1.BlockHash? at}) async {
    final hashedKey = _deletionQueueCounter.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _deletionQueueCounter.decodeValue(bytes);
    }
    return _i7.DeletionQueueManager(
      insertCounter: 0,
      deleteCounter: 0,
    ); /* Default */
  }

  /// A migration can span across multiple blocks. This storage defines a cursor to track the
  /// progress of the migration, enabling us to resume from the last completed position.
  _i8.Future<List<int>?> migrationInProgress({_i1.BlockHash? at}) async {
    final hashedKey = _migrationInProgress.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _migrationInProgress.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `pristineCode`.
  _i9.Uint8List pristineCodeKey(_i2.H256 key1) {
    final hashedKey = _pristineCode.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `codeInfoOf`.
  _i9.Uint8List codeInfoOfKey(_i2.H256 key1) {
    final hashedKey = _codeInfoOf.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `nonce`.
  _i9.Uint8List nonceKey() {
    final hashedKey = _nonce.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `contractInfoOf`.
  _i9.Uint8List contractInfoOfKey(_i5.AccountId32 key1) {
    final hashedKey = _contractInfoOf.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `deletionQueue`.
  _i9.Uint8List deletionQueueKey(int key1) {
    final hashedKey = _deletionQueue.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `deletionQueueCounter`.
  _i9.Uint8List deletionQueueCounterKey() {
    final hashedKey = _deletionQueueCounter.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `migrationInProgress`.
  _i9.Uint8List migrationInProgressKey() {
    final hashedKey = _migrationInProgress.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `pristineCode`.
  _i9.Uint8List pristineCodeMapPrefix() {
    final hashedKey = _pristineCode.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `codeInfoOf`.
  _i9.Uint8List codeInfoOfMapPrefix() {
    final hashedKey = _codeInfoOf.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `contractInfoOf`.
  _i9.Uint8List contractInfoOfMapPrefix() {
    final hashedKey = _contractInfoOf.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `deletionQueue`.
  _i9.Uint8List deletionQueueMapPrefix() {
    final hashedKey = _deletionQueue.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Deprecated version if [`Self::call`] for use in an in-storage `Call`.
  _i10.RuntimeCall callOldWeight({
    required _i11.MultiAddress dest,
    required BigInt value,
    required BigInt gasLimit,
    BigInt? storageDepositLimit,
    required List<int> data,
  }) {
    final _call = _i12.Call.values.callOldWeight(
      dest: dest,
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      data: data,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Deprecated version if [`Self::instantiate_with_code`] for use in an in-storage `Call`.
  _i10.RuntimeCall instantiateWithCodeOldWeight({
    required BigInt value,
    required BigInt gasLimit,
    BigInt? storageDepositLimit,
    required List<int> code,
    required List<int> data,
    required List<int> salt,
  }) {
    final _call = _i12.Call.values.instantiateWithCodeOldWeight(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      code: code,
      data: data,
      salt: salt,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Deprecated version if [`Self::instantiate`] for use in an in-storage `Call`.
  _i10.RuntimeCall instantiateOldWeight({
    required BigInt value,
    required BigInt gasLimit,
    BigInt? storageDepositLimit,
    required _i2.H256 codeHash,
    required List<int> data,
    required List<int> salt,
  }) {
    final _call = _i12.Call.values.instantiateOldWeight(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      codeHash: codeHash,
      data: data,
      salt: salt,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Upload new `code` without instantiating a contract from it.
  ///
  /// If the code does not already exist a deposit is reserved from the caller
  /// and unreserved only when [`Self::remove_code`] is called. The size of the reserve
  /// depends on the size of the supplied `code`.
  ///
  /// If the code already exists in storage it will still return `Ok` and upgrades
  /// the in storage version to the current
  /// [`InstructionWeights::version`](InstructionWeights).
  ///
  /// - `determinism`: If this is set to any other value but [`Determinism::Enforced`] then
  ///  the only way to use this code is to delegate call into it from an offchain execution.
  ///  Set to [`Determinism::Enforced`] if in doubt.
  ///
  /// # Note
  ///
  /// Anyone can instantiate a contract from any uploaded code and thus prevent its removal.
  /// To avoid this situation a constructor could employ access control so that it can
  /// only be instantiated by permissioned entities. The same is true when uploading
  /// through [`Self::instantiate_with_code`].
  ///
  /// Use [`Determinism::Relaxed`] exclusively for non-deterministic code. If the uploaded
  /// code is deterministic, specifying [`Determinism::Relaxed`] will be disregarded and
  /// result in higher gas costs.
  _i10.RuntimeCall uploadCode({
    required List<int> code,
    BigInt? storageDepositLimit,
    required _i13.Determinism determinism,
  }) {
    final _call = _i12.Call.values.uploadCode(
      code: code,
      storageDepositLimit: storageDepositLimit,
      determinism: determinism,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Remove the code stored under `code_hash` and refund the deposit to its owner.
  ///
  /// A code can only be removed by its original uploader (its owner) and only if it is
  /// not used by any contract.
  _i10.RuntimeCall removeCode({required _i2.H256 codeHash}) {
    final _call = _i12.Call.values.removeCode(codeHash: codeHash);
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Privileged function that changes the code of an existing contract.
  ///
  /// This takes care of updating refcounts and all other necessary operations. Returns
  /// an error if either the `code_hash` or `dest` do not exist.
  ///
  /// # Note
  ///
  /// This does **not** change the address of the contract in question. This means
  /// that the contract address is no longer derived from its code hash after calling
  /// this dispatchable.
  _i10.RuntimeCall setCode({
    required _i11.MultiAddress dest,
    required _i2.H256 codeHash,
  }) {
    final _call = _i12.Call.values.setCode(
      dest: dest,
      codeHash: codeHash,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Makes a call to an account, optionally transferring some balance.
  ///
  /// # Parameters
  ///
  /// * `dest`: Address of the contract to call.
  /// * `value`: The balance to transfer from the `origin` to `dest`.
  /// * `gas_limit`: The gas limit enforced when executing the constructor.
  /// * `storage_deposit_limit`: The maximum amount of balance that can be charged from the
  ///  caller to pay for the storage consumed.
  /// * `data`: The input data to pass to the contract.
  ///
  /// * If the account is a smart-contract account, the associated code will be
  /// executed and any value will be transferred.
  /// * If the account is a regular account, any value will be transferred.
  /// * If no account exists and the call value is not less than `existential_deposit`,
  /// a regular account will be created and any value will be transferred.
  _i10.RuntimeCall call({
    required _i11.MultiAddress dest,
    required BigInt value,
    required _i14.Weight gasLimit,
    BigInt? storageDepositLimit,
    required List<int> data,
  }) {
    final _call = _i12.Call.values.callVariant(
      dest: dest,
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      data: data,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Instantiates a new contract from the supplied `code` optionally transferring
  /// some balance.
  ///
  /// This dispatchable has the same effect as calling [`Self::upload_code`] +
  /// [`Self::instantiate`]. Bundling them together provides efficiency gains. Please
  /// also check the documentation of [`Self::upload_code`].
  ///
  /// # Parameters
  ///
  /// * `value`: The balance to transfer from the `origin` to the newly created contract.
  /// * `gas_limit`: The gas limit enforced when executing the constructor.
  /// * `storage_deposit_limit`: The maximum amount of balance that can be charged/reserved
  ///  from the caller to pay for the storage consumed.
  /// * `code`: The contract code to deploy in raw bytes.
  /// * `data`: The input data to pass to the contract constructor.
  /// * `salt`: Used for the address derivation. See [`Pallet::contract_address`].
  ///
  /// Instantiation is executed as follows:
  ///
  /// - The supplied `code` is deployed, and a `code_hash` is created for that code.
  /// - If the `code_hash` already exists on the chain the underlying `code` will be shared.
  /// - The destination address is computed based on the sender, code_hash and the salt.
  /// - The smart-contract account is created at the computed address.
  /// - The `value` is transferred to the new account.
  /// - The `deploy` function is executed in the context of the newly-created account.
  _i10.RuntimeCall instantiateWithCode({
    required BigInt value,
    required _i14.Weight gasLimit,
    BigInt? storageDepositLimit,
    required List<int> code,
    required List<int> data,
    required List<int> salt,
  }) {
    final _call = _i12.Call.values.instantiateWithCode(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      code: code,
      data: data,
      salt: salt,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// Instantiates a contract from a previously deployed wasm binary.
  ///
  /// This function is identical to [`Self::instantiate_with_code`] but without the
  /// code deployment step. Instead, the `code_hash` of an on-chain deployed wasm binary
  /// must be supplied.
  _i10.RuntimeCall instantiate({
    required BigInt value,
    required _i14.Weight gasLimit,
    BigInt? storageDepositLimit,
    required _i2.H256 codeHash,
    required List<int> data,
    required List<int> salt,
  }) {
    final _call = _i12.Call.values.instantiate(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      codeHash: codeHash,
      data: data,
      salt: salt,
    );
    return _i10.RuntimeCall.values.contracts(_call);
  }

  /// When a migration is in progress, this dispatchable can be used to run migration steps.
  /// Calls that contribute to advancing the migration have their fees waived, as it's helpful
  /// for the chain. Note that while the migration is in progress, the pallet will also
  /// leverage the `on_idle` hooks to run migration steps.
  _i10.RuntimeCall migrate({required _i14.Weight weightLimit}) {
    final _call = _i12.Call.values.migrate(weightLimit: weightLimit);
    return _i10.RuntimeCall.values.contracts(_call);
  }
}

class Constants {
  Constants();

  /// Cost schedule and limits.
  final _i15.Schedule schedule = const _i15.Schedule(
    limits: _i16.Limits(
      eventTopics: 4,
      memoryPages: 16,
      subjectLen: 32,
      payloadLen: 16384,
      runtimeMemory: 1073741824,
    ),
    instructionWeights: _i17.InstructionWeights(base: 2552),
  );

  /// The amount of balance a caller has to pay for each byte of storage.
  ///
  /// # Note
  ///
  /// Changing this value for an existing chain might need a storage migration.
  final BigInt depositPerByte = BigInt.from(5000000);

  /// Fallback value to limit the storage deposit if it's not being set by the caller.
  final BigInt defaultDepositLimit = BigInt.from(107642880000000);

  /// The amount of balance a caller has to pay for each storage item.
  ///
  /// # Note
  ///
  /// Changing this value for an existing chain might need a storage migration.
  final BigInt depositPerItem = BigInt.from(100000000000);

  /// The percentage of the storage deposit that should be held for using a code hash.
  /// Instantiating a contract, or calling [`chain_extension::Ext::lock_delegate_dependency`]
  /// protects the code from being removed. In order to prevent abuse these actions are
  /// protected with a percentage of the code deposit.
  final _i18.Perbill codeHashLockupDepositPercent = 0;

  /// The maximum length of a contract code in bytes.
  ///
  /// The value should be chosen carefully taking into the account the overall memory limit
  /// your runtime has, as well as the [maximum allowed callstack
  /// depth](#associatedtype.CallStack). Look into the `integrity_test()` for some insights.
  final int maxCodeLen = 262144;

  /// The maximum allowable length in bytes for storage keys.
  final int maxStorageKeyLen = 128;

  /// The maximum number of delegate_dependencies that a contract can lock with
  /// [`chain_extension::Ext::lock_delegate_dependency`].
  final int maxDelegateDependencies = 32;

  /// Make contract callable functions marked as `#[unstable]` available.
  ///
  /// Contracts that use `#[unstable]` functions won't be able to be uploaded unless
  /// this is set to `true`. This is only meant for testnets and dev nodes in order to
  /// experiment with new features.
  ///
  /// # Warning
  ///
  /// Do **not** set to `true` on productions chains.
  final bool unsafeUnstableInterface = true;

  /// The maximum length of the debug buffer in bytes.
  final int maxDebugBufferLen = 2097152;

  /// Type that bundles together all the runtime configurable interface types.
  ///
  /// This is not a real config. We just mention the type here as constant so that
  /// its type appears in the metadata. Only valid value is `()`.
  final _i19.Environment environment = const _i19.Environment(
    accountId: null,
    balance: null,
    hash: null,
    hasher: null,
    timestamp: null,
    blockNumber: null,
  );

  /// The version of the HostFn APIs that are available in the runtime.
  ///
  /// Only valid value is `()`.
  final _i20.ApiVersion apiVersion = 4;
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:typed_data' as _i9;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i4;

import '../types/pallet_grandpa/pallet/call.dart' as _i13;
import '../types/pallet_grandpa/stored_pending_change.dart' as _i3;
import '../types/pallet_grandpa/stored_state.dart' as _i2;
import '../types/sp_consensus_grandpa/app/public.dart' as _i7;
import '../types/sp_consensus_grandpa/equivocation_proof.dart' as _i11;
import '../types/sp_core/void.dart' as _i12;
import '../types/tuples.dart' as _i5;
import '../types/tuples_1.dart' as _i6;
import '../types/wetee_runtime/runtime_call.dart' as _i10;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<_i2.StoredState> _state =
      const _i1.StorageValue<_i2.StoredState>(
    prefix: 'Grandpa',
    storage: 'State',
    valueCodec: _i2.StoredState.codec,
  );

  final _i1.StorageValue<_i3.StoredPendingChange> _pendingChange =
      const _i1.StorageValue<_i3.StoredPendingChange>(
    prefix: 'Grandpa',
    storage: 'PendingChange',
    valueCodec: _i3.StoredPendingChange.codec,
  );

  final _i1.StorageValue<BigInt> _nextForced = const _i1.StorageValue<BigInt>(
    prefix: 'Grandpa',
    storage: 'NextForced',
    valueCodec: _i4.U64Codec.codec,
  );

  final _i1.StorageValue<_i5.Tuple2<BigInt, BigInt>> _stalled =
      const _i1.StorageValue<_i5.Tuple2<BigInt, BigInt>>(
    prefix: 'Grandpa',
    storage: 'Stalled',
    valueCodec: _i5.Tuple2Codec<BigInt, BigInt>(
      _i4.U64Codec.codec,
      _i4.U64Codec.codec,
    ),
  );

  final _i1.StorageValue<BigInt> _currentSetId = const _i1.StorageValue<BigInt>(
    prefix: 'Grandpa',
    storage: 'CurrentSetId',
    valueCodec: _i4.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, int> _setIdSession =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'Grandpa',
    storage: 'SetIdSession',
    valueCodec: _i4.U32Codec.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i4.U64Codec.codec),
  );

  final _i1.StorageValue<List<_i6.Tuple2<_i7.Public, BigInt>>> _authorities =
      const _i1.StorageValue<List<_i6.Tuple2<_i7.Public, BigInt>>>(
    prefix: 'Grandpa',
    storage: 'Authorities',
    valueCodec: _i4.SequenceCodec<_i6.Tuple2<_i7.Public, BigInt>>(
        _i6.Tuple2Codec<_i7.Public, BigInt>(
      _i7.PublicCodec(),
      _i4.U64Codec.codec,
    )),
  );

  /// State of the current authority set.
  _i8.Future<_i2.StoredState> state({_i1.BlockHash? at}) async {
    final hashedKey = _state.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _state.decodeValue(bytes);
    }
    return _i2.Live(); /* Default */
  }

  /// Pending change: (signaled at, scheduled change).
  _i8.Future<_i3.StoredPendingChange?> pendingChange(
      {_i1.BlockHash? at}) async {
    final hashedKey = _pendingChange.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _pendingChange.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// next block number where we can force a change.
  _i8.Future<BigInt?> nextForced({_i1.BlockHash? at}) async {
    final hashedKey = _nextForced.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextForced.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// `true` if we are currently stalled.
  _i8.Future<_i5.Tuple2<BigInt, BigInt>?> stalled({_i1.BlockHash? at}) async {
    final hashedKey = _stalled.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _stalled.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The number of changes (both in terms of keys and underlying economic responsibilities)
  /// in the "set" of Grandpa validators from genesis.
  _i8.Future<BigInt> currentSetId({_i1.BlockHash? at}) async {
    final hashedKey = _currentSetId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _currentSetId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// A mapping from grandpa set ID to the index of the *most recent* session for which its
  /// members were responsible.
  ///
  /// This is only used for validating equivocation proofs. An equivocation proof must
  /// contains a key-ownership proof for a given session, therefore we need a way to tie
  /// together sessions and GRANDPA set ids, i.e. we need to validate that a validator
  /// was the owner of a given key on a given session, and what the active set ID was
  /// during that session.
  ///
  /// TWOX-NOTE: `SetId` is not under user control.
  _i8.Future<int?> setIdSession(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _setIdSession.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _setIdSession.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The current list of authorities.
  _i8.Future<List<_i6.Tuple2<_i7.Public, BigInt>>> authorities(
      {_i1.BlockHash? at}) async {
    final hashedKey = _authorities.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _authorities.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Returns the storage key for `state`.
  _i9.Uint8List stateKey() {
    final hashedKey = _state.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `pendingChange`.
  _i9.Uint8List pendingChangeKey() {
    final hashedKey = _pendingChange.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `nextForced`.
  _i9.Uint8List nextForcedKey() {
    final hashedKey = _nextForced.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `stalled`.
  _i9.Uint8List stalledKey() {
    final hashedKey = _stalled.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `currentSetId`.
  _i9.Uint8List currentSetIdKey() {
    final hashedKey = _currentSetId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `setIdSession`.
  _i9.Uint8List setIdSessionKey(BigInt key1) {
    final hashedKey = _setIdSession.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `authorities`.
  _i9.Uint8List authoritiesKey() {
    final hashedKey = _authorities.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `setIdSession`.
  _i9.Uint8List setIdSessionMapPrefix() {
    final hashedKey = _setIdSession.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Report voter equivocation/misbehavior. This method will verify the
  /// equivocation proof and validate the given key ownership proof
  /// against the extracted offender. If both are valid, the offence
  /// will be reported.
  _i10.RuntimeCall reportEquivocation({
    required _i11.EquivocationProof equivocationProof,
    required _i12.Void keyOwnerProof,
  }) {
    final _call = _i13.Call.values.reportEquivocation(
      equivocationProof: equivocationProof,
      keyOwnerProof: keyOwnerProof,
    );
    return _i10.RuntimeCall.values.grandpa(_call);
  }

  /// Report voter equivocation/misbehavior. This method will verify the
  /// equivocation proof and validate the given key ownership proof
  /// against the extracted offender. If both are valid, the offence
  /// will be reported.
  ///
  /// This extrinsic must be called unsigned and it is expected that only
  /// block authors will call it (validated in `ValidateUnsigned`), as such
  /// if the block author is defined it will be defined as the equivocation
  /// reporter.
  _i10.RuntimeCall reportEquivocationUnsigned({
    required _i11.EquivocationProof equivocationProof,
    required _i12.Void keyOwnerProof,
  }) {
    final _call = _i13.Call.values.reportEquivocationUnsigned(
      equivocationProof: equivocationProof,
      keyOwnerProof: keyOwnerProof,
    );
    return _i10.RuntimeCall.values.grandpa(_call);
  }

  /// Note that the current authority set of the GRANDPA finality gadget has stalled.
  ///
  /// This will trigger a forced authority set change at the beginning of the next session, to
  /// be enacted `delay` blocks after that. The `delay` should be high enough to safely assume
  /// that the block signalling the forced change will not be re-orged e.g. 1000 blocks.
  /// The block production rate (which may be slowed down because of finality lagging) should
  /// be taken into account when choosing the `delay`. The GRANDPA voters based on the new
  /// authority will start voting on top of `best_finalized_block_number` for new finalized
  /// blocks. `best_finalized_block_number` should be the highest of the latest finalized
  /// block of all validators of the new authority set.
  ///
  /// Only callable by root.
  _i10.RuntimeCall noteStalled({
    required BigInt delay,
    required BigInt bestFinalizedBlockNumber,
  }) {
    final _call = _i13.Call.values.noteStalled(
      delay: delay,
      bestFinalizedBlockNumber: bestFinalizedBlockNumber,
    );
    return _i10.RuntimeCall.values.grandpa(_call);
  }
}

class Constants {
  Constants();

  /// Max Authorities in use
  final int maxAuthorities = 32;

  /// The maximum number of nominators for each validator.
  final int maxNominators = 0;

  /// The maximum number of entries to keep in the set id to session index mapping.
  ///
  /// Since the `SetIdSession` map is only used for validating equivocations this
  /// value should relate to the bonding duration of whatever staking system is
  /// being used (if any). If equivocation handling is not enabled then this value
  /// can be zero.
  final BigInt maxSetIdSessionEntries = BigInt.zero;
}

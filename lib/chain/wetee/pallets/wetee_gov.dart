// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/primitive_types/h256.dart' as _i5;
import '../types/sp_core/crypto/account_id32.dart' as _i8;
import '../types/tuples.dart' as _i9;
import '../types/tuples_2.dart' as _i4;
import '../types/wetee_gov/memmber_data.dart' as _i7;
import '../types/wetee_gov/pallet/call.dart' as _i13;
import '../types/wetee_gov/period.dart' as _i3;
import '../types/wetee_gov/prop.dart' as _i10;
import '../types/wetee_gov/vote_info.dart' as _i11;
import '../types/wetee_runtime/runtime_call.dart' as _i6;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, int> _prePropCount =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeteeGov',
    storage: 'PrePropCount',
    valueCodec: _i2.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, int> _maxPreProps =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeteeGov',
    storage: 'MaxPreProps',
    valueCodec: _i2.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i3.Period>> _periods =
      const _i1.StorageMap<BigInt, List<_i3.Period>>(
    prefix: 'WeteeGov',
    storage: 'Periods',
    valueCodec: _i2.SequenceCodec<_i3.Period>(_i3.Period.codec),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageValue<List<_i3.Period>> _defaultPeriods =
      const _i1.StorageValue<List<_i3.Period>>(
    prefix: 'WeteeGov',
    storage: 'DefaultPeriods',
    valueCodec: _i2.SequenceCodec<_i3.Period>(_i3.Period.codec),
  );

  final _i1.StorageMap<
      BigInt,
      List<
          _i4.Tuple7<int, _i5.H256, _i6.RuntimeCall, _i7.MemmberData,
              _i8.AccountId32, int, BigInt>>> _preProps = const _i1.StorageMap<
      BigInt,
      List<
          _i4.Tuple7<int, _i5.H256, _i6.RuntimeCall, _i7.MemmberData,
              _i8.AccountId32, int, BigInt>>>(
    prefix: 'WeteeGov',
    storage: 'PreProps',
    valueCodec: _i2.SequenceCodec<
        _i4.Tuple7<int, _i5.H256, _i6.RuntimeCall, _i7.MemmberData,
            _i8.AccountId32, int, BigInt>>(_i4.Tuple7Codec<int, _i5.H256,
        _i6.RuntimeCall, _i7.MemmberData, _i8.AccountId32, int, BigInt>(
      _i2.U32Codec.codec,
      _i5.H256Codec(),
      _i6.RuntimeCall.codec,
      _i7.MemmberData.codec,
      _i8.AccountId32Codec(),
      _i2.U32Codec.codec,
      _i2.U64Codec.codec,
    )),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1
      .StorageDoubleMap<BigInt, int, _i9.Tuple2<List<_i8.AccountId32>, BigInt>>
      _depositOf = const _i1.StorageDoubleMap<BigInt, int,
          _i9.Tuple2<List<_i8.AccountId32>, BigInt>>(
    prefix: 'WeteeGov',
    storage: 'DepositOf',
    valueCodec: _i9.Tuple2Codec<List<_i8.AccountId32>, BigInt>(
      _i2.SequenceCodec<_i8.AccountId32>(_i8.AccountId32Codec()),
      _i2.U128Codec.codec,
    ),
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U32Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, int, _i10.Prop> _propInfoOf =
      const _i1.StorageDoubleMap<BigInt, int, _i10.Prop>(
    prefix: 'WeteeGov',
    storage: 'PropInfoOf',
    valueCodec: _i10.Prop.codec,
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U32Codec.codec),
  );

  final _i1.StorageMap<_i8.AccountId32, List<_i9.Tuple2<BigInt, BigInt>>>
      _reserveOf =
      const _i1.StorageMap<_i8.AccountId32, List<_i9.Tuple2<BigInt, BigInt>>>(
    prefix: 'WeteeGov',
    storage: 'ReserveOf',
    valueCodec: _i2.SequenceCodec<_i9.Tuple2<BigInt, BigInt>>(
        _i9.Tuple2Codec<BigInt, BigInt>(
      _i2.U128Codec.codec,
      _i2.U64Codec.codec,
    )),
    hasher: _i1.StorageHasher.identity(_i8.AccountId32Codec()),
  );

  final _i1.StorageMap<BigInt, int> _propCount =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeteeGov',
    storage: 'PropCount',
    valueCodec: _i2.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, int> _voteModel =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeteeGov',
    storage: 'VoteModel',
    valueCodec: _i2.U8Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<_i8.AccountId32, List<_i11.VoteInfo>> _votesOf =
      const _i1.StorageMap<_i8.AccountId32, List<_i11.VoteInfo>>(
    prefix: 'WeteeGov',
    storage: 'VotesOf',
    valueCodec: _i2.SequenceCodec<_i11.VoteInfo>(_i11.VoteInfo.codec),
    hasher: _i1.StorageHasher.identity(_i8.AccountId32Codec()),
  );

  /// Number of public proposals so for.
  _i12.Future<int> prePropCount(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _prePropCount.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _prePropCount.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// Maximum number of public proposals at one time.
  _i12.Future<int> maxPreProps(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _maxPreProps.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _maxPreProps.decodeValue(bytes);
    }
    return 100; /* Default */
  }

  /// 投票轨道
  _i12.Future<List<_i3.Period>> periods(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _periods.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _periods.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// 投票轨道
  _i12.Future<List<_i3.Period>> defaultPeriods({_i1.BlockHash? at}) async {
    final hashedKey = _defaultPeriods.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _defaultPeriods.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The public proposals.
  /// Unsorted.
  /// The second item is the proposal's hash.
  _i12.Future<
      List<
          _i4.Tuple7<int, _i5.H256, _i6.RuntimeCall, _i7.MemmberData,
              _i8.AccountId32, int, BigInt>>> preProps(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _preProps.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _preProps.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// 提案
  /// Those who have locked a deposit.
  /// TWOX-NOTE: Safe, as increasing integer keys are safe.
  _i12.Future<_i9.Tuple2<List<_i8.AccountId32>, BigInt>?> depositOf(
    BigInt key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _depositOf.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _depositOf.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// 全民投票
  /// Prop specific information.
  _i12.Future<_i10.Prop?> propInfoOf(
    BigInt key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _propInfoOf.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _propInfoOf.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Amount of proposal locked.
  _i12.Future<List<_i9.Tuple2<BigInt, BigInt>>> reserveOf(
    _i8.AccountId32 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _reserveOf.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _reserveOf.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Number of props so far.
  _i12.Future<int> propCount(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _propCount.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _propCount.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// WETEE 投票模式默认 0，1 TOKEN 1 票
  _i12.Future<int> voteModel(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _voteModel.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _voteModel.decodeValue(bytes);
    }
    return 0; /* Default */
  }

  /// Everyone's voting information.
  _i12.Future<List<_i11.VoteInfo>> votesOf(
    _i8.AccountId32 key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _votesOf.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _votesOf.decodeValue(bytes);
    }
    return []; /* Default */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::submit_proposal`].
  _i6.RuntimeCall submitProposal({
    required daoId,
    required memberData,
    required proposal,
    required periodIndex,
  }) {
    final _call = _i13.Call.values.submitProposal(
      daoId: daoId,
      memberData: memberData,
      proposal: proposal,
      periodIndex: periodIndex,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::deposit_proposal`].
  _i6.RuntimeCall depositProposal({
    required daoId,
    required proposeId,
    required deposit,
  }) {
    final _call = _i13.Call.values.depositProposal(
      daoId: daoId,
      proposeId: proposeId,
      deposit: deposit,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::vote_for_prop`].
  _i6.RuntimeCall voteForProp({
    required daoId,
    required propIndex,
    required pledge,
    required opinion,
  }) {
    final _call = _i13.Call.values.voteForProp(
      daoId: daoId,
      propIndex: propIndex,
      pledge: pledge,
      opinion: opinion,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::cancel_vote`].
  _i6.RuntimeCall cancelVote({
    required daoId,
    required index,
  }) {
    final _call = _i13.Call.values.cancelVote(
      daoId: daoId,
      index: index,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::run_proposal`].
  _i6.RuntimeCall runProposal({
    required daoId,
    required index,
  }) {
    final _call = _i13.Call.values.runProposal(
      daoId: daoId,
      index: index,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::unlock`].
  _i6.RuntimeCall unlock({required daoId}) {
    final _call = _i13.Call.values.unlock(daoId: daoId);
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::set_max_pre_props`].
  _i6.RuntimeCall setMaxPreProps({
    required daoId,
    required max,
  }) {
    final _call = _i13.Call.values.setMaxPreProps(
      daoId: daoId,
      max: max,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::update_vote_model`].
  _i6.RuntimeCall updateVoteModel({
    required daoId,
    required model,
  }) {
    final _call = _i13.Call.values.updateVoteModel(
      daoId: daoId,
      model: model,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }

  /// See [`Pallet::set_periods`].
  _i6.RuntimeCall setPeriods({
    required daoId,
    required periods,
  }) {
    final _call = _i13.Call.values.setPeriods(
      daoId: daoId,
      periods: periods,
    );
    return _i6.RuntimeCall.values.weteeGov(_call);
  }
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:typed_data' as _i10;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i6;
import '../types/tuples.dart' as _i5;
import '../types/wetee_gov/member_data.dart' as _i12;
import '../types/wetee_gov/opinion.dart' as _i14;
import '../types/wetee_gov/pallet/call.dart' as _i13;
import '../types/wetee_gov/period.dart' as _i3;
import '../types/wetee_gov/pre_prop.dart' as _i4;
import '../types/wetee_gov/prop.dart' as _i7;
import '../types/wetee_gov/vote_info.dart' as _i8;
import '../types/wetee_runtime/runtime_call.dart' as _i11;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, int> _prePropCount =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeTEEGov',
    storage: 'PrePropCount',
    valueCodec: _i2.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, int> _maxPreProps =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeTEEGov',
    storage: 'MaxPreProps',
    valueCodec: _i2.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i3.Period>> _periods =
      const _i1.StorageMap<BigInt, List<_i3.Period>>(
    prefix: 'WeTEEGov',
    storage: 'Periods',
    valueCodec: _i2.SequenceCodec<_i3.Period>(_i3.Period.codec),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageValue<List<_i3.Period>> _defaultPeriods =
      const _i1.StorageValue<List<_i3.Period>>(
    prefix: 'WeTEEGov',
    storage: 'DefaultPeriods',
    valueCodec: _i2.SequenceCodec<_i3.Period>(_i3.Period.codec),
  );

  final _i1.StorageMap<BigInt, List<_i4.PreProp>> _preProps =
      const _i1.StorageMap<BigInt, List<_i4.PreProp>>(
    prefix: 'WeTEEGov',
    storage: 'PreProps',
    valueCodec: _i2.SequenceCodec<_i4.PreProp>(_i4.PreProp.codec),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1
      .StorageDoubleMap<BigInt, int, _i5.Tuple2<List<_i6.AccountId32>, BigInt>>
      _depositOf = const _i1.StorageDoubleMap<BigInt, int,
          _i5.Tuple2<List<_i6.AccountId32>, BigInt>>(
    prefix: 'WeTEEGov',
    storage: 'DepositOf',
    valueCodec: _i5.Tuple2Codec<List<_i6.AccountId32>, BigInt>(
      _i2.SequenceCodec<_i6.AccountId32>(_i6.AccountId32Codec()),
      _i2.U128Codec.codec,
    ),
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U32Codec.codec),
  );

  final _i1.StorageDoubleMap<BigInt, int, _i7.Prop> _props =
      const _i1.StorageDoubleMap<BigInt, int, _i7.Prop>(
    prefix: 'WeTEEGov',
    storage: 'Props',
    valueCodec: _i7.Prop.codec,
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U32Codec.codec),
  );

  final _i1.StorageMap<_i6.AccountId32, List<_i5.Tuple2<BigInt, BigInt>>>
      _reserveOf =
      const _i1.StorageMap<_i6.AccountId32, List<_i5.Tuple2<BigInt, BigInt>>>(
    prefix: 'WeTEEGov',
    storage: 'ReserveOf',
    valueCodec: _i2.SequenceCodec<_i5.Tuple2<BigInt, BigInt>>(
        _i5.Tuple2Codec<BigInt, BigInt>(
      _i2.U128Codec.codec,
      _i2.U64Codec.codec,
    )),
    hasher: _i1.StorageHasher.identity(_i6.AccountId32Codec()),
  );

  final _i1.StorageMap<BigInt, int> _propCount =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeTEEGov',
    storage: 'PropCount',
    valueCodec: _i2.U32Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, int> _voteModel =
      const _i1.StorageMap<BigInt, int>(
    prefix: 'WeTEEGov',
    storage: 'VoteModel',
    valueCodec: _i2.U8Codec.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<_i6.AccountId32, List<_i8.VoteInfo>> _votesOf =
      const _i1.StorageMap<_i6.AccountId32, List<_i8.VoteInfo>>(
    prefix: 'WeTEEGov',
    storage: 'VotesOf',
    valueCodec: _i2.SequenceCodec<_i8.VoteInfo>(_i8.VoteInfo.codec),
    hasher: _i1.StorageHasher.identity(_i6.AccountId32Codec()),
  );

  /// Number of public proposals so for.
  _i9.Future<int> prePropCount(
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
  _i9.Future<int> maxPreProps(
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
  _i9.Future<List<_i3.Period>> periods(
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
  _i9.Future<List<_i3.Period>> defaultPeriods({_i1.BlockHash? at}) async {
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
  _i9.Future<List<_i4.PreProp>> preProps(
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
  _i9.Future<_i5.Tuple2<List<_i6.AccountId32>, BigInt>?> depositOf(
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
  _i9.Future<_i7.Prop?> props(
    BigInt key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _props.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _props.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Amount of proposal locked.
  _i9.Future<List<_i5.Tuple2<BigInt, BigInt>>> reserveOf(
    _i6.AccountId32 key1, {
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
  _i9.Future<int> propCount(
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
  _i9.Future<int> voteModel(
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
  _i9.Future<List<_i8.VoteInfo>> votesOf(
    _i6.AccountId32 key1, {
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

  /// Returns the storage key for `prePropCount`.
  _i10.Uint8List prePropCountKey(BigInt key1) {
    final hashedKey = _prePropCount.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `maxPreProps`.
  _i10.Uint8List maxPrePropsKey(BigInt key1) {
    final hashedKey = _maxPreProps.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `periods`.
  _i10.Uint8List periodsKey(BigInt key1) {
    final hashedKey = _periods.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `defaultPeriods`.
  _i10.Uint8List defaultPeriodsKey() {
    final hashedKey = _defaultPeriods.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `preProps`.
  _i10.Uint8List prePropsKey(BigInt key1) {
    final hashedKey = _preProps.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `depositOf`.
  _i10.Uint8List depositOfKey(
    BigInt key1,
    int key2,
  ) {
    final hashedKey = _depositOf.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `props`.
  _i10.Uint8List propsKey(
    BigInt key1,
    int key2,
  ) {
    final hashedKey = _props.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `reserveOf`.
  _i10.Uint8List reserveOfKey(_i6.AccountId32 key1) {
    final hashedKey = _reserveOf.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `propCount`.
  _i10.Uint8List propCountKey(BigInt key1) {
    final hashedKey = _propCount.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `voteModel`.
  _i10.Uint8List voteModelKey(BigInt key1) {
    final hashedKey = _voteModel.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `votesOf`.
  _i10.Uint8List votesOfKey(_i6.AccountId32 key1) {
    final hashedKey = _votesOf.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `prePropCount`.
  _i10.Uint8List prePropCountMapPrefix() {
    final hashedKey = _prePropCount.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `maxPreProps`.
  _i10.Uint8List maxPrePropsMapPrefix() {
    final hashedKey = _maxPreProps.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `periods`.
  _i10.Uint8List periodsMapPrefix() {
    final hashedKey = _periods.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `preProps`.
  _i10.Uint8List prePropsMapPrefix() {
    final hashedKey = _preProps.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `depositOf`.
  _i10.Uint8List depositOfMapPrefix(BigInt key1) {
    final hashedKey = _depositOf.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `props`.
  _i10.Uint8List propsMapPrefix(BigInt key1) {
    final hashedKey = _props.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `reserveOf`.
  _i10.Uint8List reserveOfMapPrefix() {
    final hashedKey = _reserveOf.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `propCount`.
  _i10.Uint8List propCountMapPrefix() {
    final hashedKey = _propCount.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `voteModel`.
  _i10.Uint8List voteModelMapPrefix() {
    final hashedKey = _voteModel.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `votesOf`.
  _i10.Uint8List votesOfMapPrefix() {
    final hashedKey = _votesOf.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// create a proposal
  /// 创建一个提案
  _i11.RuntimeCall submitProposal({
    required BigInt daoId,
    required _i12.MemberData memberData,
    required _i11.RuntimeCall proposal,
    required int periodIndex,
  }) {
    final _call = _i13.Call.values.submitProposal(
      daoId: daoId,
      memberData: memberData,
      proposal: proposal,
      periodIndex: periodIndex,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  /// Open a prop.
  /// 开始全民公投
  _i11.RuntimeCall depositProposal({
    required BigInt daoId,
    required int proposeId,
    required BigInt deposit,
  }) {
    final _call = _i13.Call.values.depositProposal(
      daoId: daoId,
      proposeId: proposeId,
      deposit: deposit,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  /// Vote for the prop
  /// 为全民公投投票
  _i11.RuntimeCall voteForProp({
    required BigInt daoId,
    required int propIndex,
    required BigInt pledge,
    required _i14.Opinion opinion,
  }) {
    final _call = _i13.Call.values.voteForProp(
      daoId: daoId,
      propIndex: propIndex,
      pledge: pledge,
      opinion: opinion,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  /// Cancel a vote on a prop
  /// 取消一个投票
  _i11.RuntimeCall cancelVote({
    required BigInt daoId,
    required int index,
  }) {
    final _call = _i13.Call.values.cancelVote(
      daoId: daoId,
      index: index,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  /// Vote and execute the transaction corresponding to the proposa
  /// 执行一个投票通过提案
  _i11.RuntimeCall runProposal({
    required BigInt daoId,
    required int index,
  }) {
    final _call = _i13.Call.values.runProposal(
      daoId: daoId,
      index: index,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  /// Unlock
  _i11.RuntimeCall unlock({required BigInt daoId}) {
    final _call = _i13.Call.values.unlock(daoId: daoId);
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  /// Set the maximum number of proposals at the same time
  _i11.RuntimeCall setMaxPreProps({
    required BigInt daoId,
    required int max,
  }) {
    final _call = _i13.Call.values.setMaxPreProps(
      daoId: daoId,
      max: max,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  _i11.RuntimeCall updateVoteModel({
    required BigInt daoId,
    required int model,
  }) {
    final _call = _i13.Call.values.updateVoteModel(
      daoId: daoId,
      model: model,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }

  _i11.RuntimeCall setPeriods({
    required BigInt daoId,
    required List<_i3.Period> periods,
  }) {
    final _call = _i13.Call.values.setPeriods(
      daoId: daoId,
      periods: periods,
    );
    return _i11.RuntimeCall.values.weTEEGov(_call);
  }
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../types/wetee_runtime/runtime_call.dart' as _i1;
import '../types/wetee_treasury/pallet/call.dart' as _i2;

class Txs {
  const Txs();

  /// See [`Pallet::spend`].
  _i1.RuntimeCall spend({
    required daoId,
    required beneficiary,
    required amount,
  }) {
    final _call = _i2.Call.values.spend(
      daoId: daoId,
      beneficiary: beneficiary,
      amount: amount,
    );
    return _i1.RuntimeCall.values.weteeTreasury(_call);
  }
}

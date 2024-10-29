// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/wetee_runtime/runtime_call.dart' as _i1;
import '../types/wetee_treasury/pallet/call.dart' as _i3;

class Txs {
  const Txs();

  _i1.RuntimeCall spend({
    required BigInt daoId,
    required _i2.AccountId32 beneficiary,
    required BigInt amount,
  }) {
    final _call = _i3.Call.values.spend(
      daoId: daoId,
      beneficiary: beneficiary,
      amount: amount,
    );
    return _i1.RuntimeCall.values.weTEETreasury(_call);
  }
}

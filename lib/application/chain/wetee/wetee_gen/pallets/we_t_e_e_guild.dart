// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/wetee_guild/pallet/call.dart' as _i3;
import '../types/wetee_runtime/runtime_call.dart' as _i1;

class Txs {
  const Txs();

  _i1.RuntimeCall guildJoin({
    required BigInt daoId,
    required BigInt guildId,
    required _i2.AccountId32 who,
  }) {
    final _call = _i3.Call.values.guildJoin(
      daoId: daoId,
      guildId: guildId,
      who: who,
    );
    return _i1.RuntimeCall.values.weTEEGuild(_call);
  }

  /// 创建公会
  _i1.RuntimeCall createGuild({
    required BigInt daoId,
    required List<int> name,
    required List<int> desc,
    required List<int> metaData,
    required _i2.AccountId32 creator,
  }) {
    final _call = _i3.Call.values.createGuild(
      daoId: daoId,
      name: name,
      desc: desc,
      metaData: metaData,
      creator: creator,
    );
    return _i1.RuntimeCall.values.weTEEGuild(_call);
  }
}

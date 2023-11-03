// ignore_for_file: no_leading_underscores_for_library_prefixes
import '../types/wetee_guild/pallet/call.dart' as _i2;
import '../types/wetee_runtime/runtime_call.dart' as _i1;

class Txs {
  const Txs();

  /// See [`Pallet::guild_join`].
  _i1.RuntimeCall guildJoin({
    required daoId,
    required guildId,
    required who,
  }) {
    final _call = _i2.Call.values.guildJoin(
      daoId: daoId,
      guildId: guildId,
      who: who,
    );
    return _i1.RuntimeCall.values.weteeGuild(_call);
  }

  /// See [`Pallet::create_guild`].
  _i1.RuntimeCall createGuild({
    required daoId,
    required name,
    required desc,
    required metaData,
    required creator,
  }) {
    final _call = _i2.Call.values.createGuild(
      daoId: daoId,
      name: name,
      desc: desc,
      metaData: metaData,
      creator: creator,
    );
    return _i1.RuntimeCall.values.weteeGuild(_call);
  }
}

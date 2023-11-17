// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  GuildJoin guildJoin({
    required BigInt daoId,
    required BigInt guildId,
    required _i3.AccountId32 who,
  }) {
    return GuildJoin(
      daoId: daoId,
      guildId: guildId,
      who: who,
    );
  }

  CreateGuild createGuild({
    required BigInt daoId,
    required List<int> name,
    required List<int> desc,
    required List<int> metaData,
    required _i3.AccountId32 creator,
  }) {
    return CreateGuild(
      daoId: daoId,
      name: name,
      desc: desc,
      metaData: metaData,
      creator: creator,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return GuildJoin._decode(input);
      case 2:
        return CreateGuild._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case GuildJoin:
        (value as GuildJoin).encodeTo(output);
        break;
      case CreateGuild:
        (value as CreateGuild).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case GuildJoin:
        return (value as GuildJoin)._sizeHint();
      case CreateGuild:
        return (value as CreateGuild)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::guild_join`].
class GuildJoin extends Call {
  const GuildJoin({
    required this.daoId,
    required this.guildId,
    required this.who,
  });

  factory GuildJoin._decode(_i1.Input input) {
    return GuildJoin(
      daoId: _i1.U64Codec.codec.decode(input),
      guildId: _i1.U64Codec.codec.decode(input),
      who: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u64
  final BigInt guildId;

  /// T::AccountId
  final _i3.AccountId32 who;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'guild_join': {
          'daoId': daoId,
          'guildId': guildId,
          'who': who.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(guildId);
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      guildId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is GuildJoin &&
          other.daoId == daoId &&
          other.guildId == guildId &&
          _i4.listsEqual(
            other.who,
            who,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        guildId,
        who,
      );
}

/// See [`Pallet::create_guild`].
class CreateGuild extends Call {
  const CreateGuild({
    required this.daoId,
    required this.name,
    required this.desc,
    required this.metaData,
    required this.creator,
  });

  factory CreateGuild._decode(_i1.Input input) {
    return CreateGuild(
      daoId: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      desc: _i1.U8SequenceCodec.codec.decode(input),
      metaData: _i1.U8SequenceCodec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> desc;

  /// Vec<u8>
  final List<int> metaData;

  /// T::AccountId
  final _i3.AccountId32 creator;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create_guild': {
          'daoId': daoId,
          'name': name,
          'desc': desc,
          'metaData': metaData,
          'creator': creator.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(desc);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(metaData);
    size = size + const _i3.AccountId32Codec().sizeHint(creator);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      desc,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      metaData,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      creator,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateGuild &&
          other.daoId == daoId &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.desc,
            desc,
          ) &&
          _i4.listsEqual(
            other.metaData,
            metaData,
          ) &&
          _i4.listsEqual(
            other.creator,
            creator,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        name,
        desc,
        metaData,
        creator,
      );
}

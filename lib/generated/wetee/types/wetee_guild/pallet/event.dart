// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, List<dynamic>> toJson();
}

class $Event {
  const $Event();

  GuildCreated guildCreated(
    BigInt value0,
    BigInt value1,
    _i3.AccountId32 value2,
  ) {
    return GuildCreated(
      value0,
      value1,
      value2,
    );
  }

  GuildJoined guildJoined(
    BigInt value0,
    BigInt value1,
    _i3.AccountId32 value2,
  ) {
    return GuildJoined(
      value0,
      value1,
      value2,
    );
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return GuildCreated._decode(input);
      case 1:
        return GuildJoined._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case GuildCreated:
        (value as GuildCreated).encodeTo(output);
        break;
      case GuildJoined:
        (value as GuildJoined).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case GuildCreated:
        return (value as GuildCreated)._sizeHint();
      case GuildJoined:
        return (value as GuildJoined)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class GuildCreated extends Event {
  const GuildCreated(
    this.value0,
    this.value1,
    this.value2,
  );

  factory GuildCreated._decode(_i1.Input input) {
    return GuildCreated(
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// u64
  final BigInt value1;

  /// T::AccountId
  final _i3.AccountId32 value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'GuildCreated': [
          value0,
          value1,
          value2.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + const _i3.AccountId32Codec().sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value2,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is GuildCreated &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          _i4.listsEqual(
            other.value2,
            value2,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

class GuildJoined extends Event {
  const GuildJoined(
    this.value0,
    this.value1,
    this.value2,
  );

  factory GuildJoined._decode(_i1.Input input) {
    return GuildJoined(
      _i1.U64Codec.codec.decode(input),
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// u64
  final BigInt value1;

  /// T::AccountId
  final _i3.AccountId32 value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'GuildJoined': [
          value0,
          value1,
          value2.toList(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + const _i3.AccountId32Codec().sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value2,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is GuildJoined &&
          other.value0 == value0 &&
          other.value1 == value1 &&
          _i4.listsEqual(
            other.value2,
            value2,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

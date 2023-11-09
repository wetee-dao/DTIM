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

  Map<String, Map<String, dynamic>> toJson();
}

class $Event {
  const $Event();

  CreatedApp createdApp({
    required _i3.AccountId32 creator,
    required BigInt id,
  }) {
    return CreatedApp(
      creator: creator,
      id: id,
    );
  }

  AppRuning appRuning({
    required _i3.AccountId32 minter,
    required BigInt id,
  }) {
    return AppRuning(
      minter: minter,
      id: id,
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
        return CreatedApp._decode(input);
      case 1:
        return AppRuning._decode(input);
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
      case CreatedApp:
        (value as CreatedApp).encodeTo(output);
        break;
      case AppRuning:
        (value as AppRuning).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case CreatedApp:
        return (value as CreatedApp)._sizeHint();
      case AppRuning:
        return (value as AppRuning)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class CreatedApp extends Event {
  const CreatedApp({
    required this.creator,
    required this.id,
  });

  factory CreatedApp._decode(_i1.Input input) {
    return CreatedApp(
      creator: const _i1.U8ArrayCodec(32).decode(input),
      id: _i1.U64Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 creator;

  /// u64
  final BigInt id;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'CreatedApp': {
          'creator': creator.toList(),
          'id': id,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(creator);
    size = size + _i1.U64Codec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      creator,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreatedApp &&
          _i4.listsEqual(
            other.creator,
            creator,
          ) &&
          other.id == id;

  @override
  int get hashCode => Object.hash(
        creator,
        id,
      );
}

class AppRuning extends Event {
  const AppRuning({
    required this.minter,
    required this.id,
  });

  factory AppRuning._decode(_i1.Input input) {
    return AppRuning(
      minter: const _i1.U8ArrayCodec(32).decode(input),
      id: _i1.U64Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 minter;

  /// u64
  final BigInt id;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'AppRuning': {
          'minter': minter.toList(),
          'id': id,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(minter);
    size = size + _i1.U64Codec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      minter,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AppRuning &&
          _i4.listsEqual(
            other.minter,
            minter,
          ) &&
          other.id == id;

  @override
  int get hashCode => Object.hash(
        minter,
        id,
      );
}

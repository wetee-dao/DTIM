// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_consensus_grandpa/app/public.dart' as _i4;
import '../../tuples_1.dart' as _i3;

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

  Map<String, dynamic> toJson();
}

class $Event {
  const $Event();

  NewAuthorities newAuthorities(
      {required List<_i3.Tuple2<_i4.Public, BigInt>> authoritySet}) {
    return NewAuthorities(authoritySet: authoritySet);
  }

  Paused paused() {
    return Paused();
  }

  Resumed resumed() {
    return Resumed();
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return NewAuthorities._decode(input);
      case 1:
        return const Paused();
      case 2:
        return const Resumed();
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
      case NewAuthorities:
        (value as NewAuthorities).encodeTo(output);
        break;
      case Paused:
        (value as Paused).encodeTo(output);
        break;
      case Resumed:
        (value as Resumed).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case NewAuthorities:
        return (value as NewAuthorities)._sizeHint();
      case Paused:
        return 1;
      case Resumed:
        return 1;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// New authority set has been applied.
class NewAuthorities extends Event {
  const NewAuthorities({required this.authoritySet});

  factory NewAuthorities._decode(_i1.Input input) {
    return NewAuthorities(
        authoritySet: const _i1.SequenceCodec<_i3.Tuple2<_i4.Public, BigInt>>(
            _i3.Tuple2Codec<_i4.Public, BigInt>(
      _i4.PublicCodec(),
      _i1.U64Codec.codec,
    )).decode(input));
  }

  /// AuthorityList
  final List<_i3.Tuple2<_i4.Public, BigInt>> authoritySet;

  @override
  Map<String, Map<String, List<List<dynamic>>>> toJson() => {
        'NewAuthorities': {
          'authoritySet': authoritySet
              .map((value) => [
                    value.value0.toList(),
                    value.value1,
                  ])
              .toList()
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.SequenceCodec<_i3.Tuple2<_i4.Public, BigInt>>(
            _i3.Tuple2Codec<_i4.Public, BigInt>(
          _i4.PublicCodec(),
          _i1.U64Codec.codec,
        )).sizeHint(authoritySet);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.SequenceCodec<_i3.Tuple2<_i4.Public, BigInt>>(
        _i3.Tuple2Codec<_i4.Public, BigInt>(
      _i4.PublicCodec(),
      _i1.U64Codec.codec,
    )).encodeTo(
      authoritySet,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NewAuthorities &&
          _i5.listsEqual(
            other.authoritySet,
            authoritySet,
          );

  @override
  int get hashCode => authoritySet.hashCode;
}

/// Current authority set has been paused.
class Paused extends Event {
  const Paused();

  @override
  Map<String, dynamic> toJson() => {'Paused': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Paused;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// Current authority set has been resumed.
class Resumed extends Event {
  const Resumed();

  @override
  Map<String, dynamic> toJson() => {'Resumed': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Resumed;

  @override
  int get hashCode => runtimeType.hashCode;
}

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

abstract class DigestItem {
  const DigestItem();

  factory DigestItem.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $DigestItemCodec codec = $DigestItemCodec();

  static const $DigestItem values = $DigestItem();

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

class $DigestItem {
  const $DigestItem();

  PreRuntime preRuntime(
    List<int> value0,
    List<int> value1,
  ) {
    return PreRuntime(
      value0,
      value1,
    );
  }

  Consensus consensus(
    List<int> value0,
    List<int> value1,
  ) {
    return Consensus(
      value0,
      value1,
    );
  }

  Seal seal(
    List<int> value0,
    List<int> value1,
  ) {
    return Seal(
      value0,
      value1,
    );
  }

  Other other(List<int> value0) {
    return Other(value0);
  }

  RuntimeEnvironmentUpdated runtimeEnvironmentUpdated() {
    return RuntimeEnvironmentUpdated();
  }
}

class $DigestItemCodec with _i1.Codec<DigestItem> {
  const $DigestItemCodec();

  @override
  DigestItem decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 6:
        return PreRuntime._decode(input);
      case 4:
        return Consensus._decode(input);
      case 5:
        return Seal._decode(input);
      case 0:
        return Other._decode(input);
      case 8:
        return const RuntimeEnvironmentUpdated();
      default:
        throw Exception('DigestItem: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    DigestItem value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case PreRuntime:
        (value as PreRuntime).encodeTo(output);
        break;
      case Consensus:
        (value as Consensus).encodeTo(output);
        break;
      case Seal:
        (value as Seal).encodeTo(output);
        break;
      case Other:
        (value as Other).encodeTo(output);
        break;
      case RuntimeEnvironmentUpdated:
        (value as RuntimeEnvironmentUpdated).encodeTo(output);
        break;
      default:
        throw Exception(
            'DigestItem: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(DigestItem value) {
    switch (value.runtimeType) {
      case PreRuntime:
        return (value as PreRuntime)._sizeHint();
      case Consensus:
        return (value as Consensus)._sizeHint();
      case Seal:
        return (value as Seal)._sizeHint();
      case Other:
        return (value as Other)._sizeHint();
      case RuntimeEnvironmentUpdated:
        return 1;
      default:
        throw Exception(
            'DigestItem: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class PreRuntime extends DigestItem {
  const PreRuntime(
    this.value0,
    this.value1,
  );

  factory PreRuntime._decode(_i1.Input input) {
    return PreRuntime(
      const _i1.U8ArrayCodec(4).decode(input),
      _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// ConsensusEngineId
  final List<int> value0;

  /// Vec<u8>
  final List<int> value1;

  @override
  Map<String, List<List<int>>> toJson() => {
        'PreRuntime': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(4).sizeHint(value0);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    const _i1.U8ArrayCodec(4).encodeTo(
      value0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PreRuntime &&
          _i3.listsEqual(
            other.value0,
            value0,
          ) &&
          _i3.listsEqual(
            other.value1,
            value1,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class Consensus extends DigestItem {
  const Consensus(
    this.value0,
    this.value1,
  );

  factory Consensus._decode(_i1.Input input) {
    return Consensus(
      const _i1.U8ArrayCodec(4).decode(input),
      _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// ConsensusEngineId
  final List<int> value0;

  /// Vec<u8>
  final List<int> value1;

  @override
  Map<String, List<List<int>>> toJson() => {
        'Consensus': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(4).sizeHint(value0);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(4).encodeTo(
      value0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Consensus &&
          _i3.listsEqual(
            other.value0,
            value0,
          ) &&
          _i3.listsEqual(
            other.value1,
            value1,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class Seal extends DigestItem {
  const Seal(
    this.value0,
    this.value1,
  );

  factory Seal._decode(_i1.Input input) {
    return Seal(
      const _i1.U8ArrayCodec(4).decode(input),
      _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// ConsensusEngineId
  final List<int> value0;

  /// Vec<u8>
  final List<int> value1;

  @override
  Map<String, List<List<int>>> toJson() => {
        'Seal': [
          value0.toList(),
          value1,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(4).sizeHint(value0);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value1);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(4).encodeTo(
      value0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value1,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Seal &&
          _i3.listsEqual(
            other.value0,
            value0,
          ) &&
          _i3.listsEqual(
            other.value1,
            value1,
          );

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
      );
}

class Other extends DigestItem {
  const Other(this.value0);

  factory Other._decode(_i1.Input input) {
    return Other(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'Other': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Other &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class RuntimeEnvironmentUpdated extends DigestItem {
  const RuntimeEnvironmentUpdated();

  @override
  Map<String, dynamic> toJson() => {'RuntimeEnvironmentUpdated': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is RuntimeEnvironmentUpdated;

  @override
  int get hashCode => runtimeType.hashCode;
}

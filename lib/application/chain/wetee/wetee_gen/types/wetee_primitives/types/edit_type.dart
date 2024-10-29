// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class EditType {
  const EditType();

  factory EditType.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EditTypeCodec codec = $EditTypeCodec();

  static const $EditType values = $EditType();

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

class $EditType {
  const $EditType();

  Insert insert() {
    return Insert();
  }

  Update update(int value0) {
    return Update(value0);
  }

  Remove remove(int value0) {
    return Remove(value0);
  }
}

class $EditTypeCodec with _i1.Codec<EditType> {
  const $EditTypeCodec();

  @override
  EditType decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return const Insert();
      case 1:
        return Update._decode(input);
      case 2:
        return Remove._decode(input);
      default:
        throw Exception('EditType: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    EditType value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Insert:
        (value as Insert).encodeTo(output);
        break;
      case Update:
        (value as Update).encodeTo(output);
        break;
      case Remove:
        (value as Remove).encodeTo(output);
        break;
      default:
        throw Exception(
            'EditType: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(EditType value) {
    switch (value.runtimeType) {
      case Insert:
        return 1;
      case Update:
        return (value as Update)._sizeHint();
      case Remove:
        return (value as Remove)._sizeHint();
      default:
        throw Exception(
            'EditType: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Insert extends EditType {
  const Insert();

  @override
  Map<String, dynamic> toJson() => {'INSERT': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Insert;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Update extends EditType {
  const Update(this.value0);

  factory Update._decode(_i1.Input input) {
    return Update(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'UPDATE': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
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
      other is Update && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Remove extends EditType {
  const Remove(this.value0);

  factory Remove._decode(_i1.Input input) {
    return Remove(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'REMOVE': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
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
      other is Remove && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

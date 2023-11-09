// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class ReserveData {
  const ReserveData({
    required this.id,
    required this.amount,
  });

  factory ReserveData.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// ReserveIdentifier
  final List<int> id;

  /// Balance
  final BigInt amount;

  static const $ReserveDataCodec codec = $ReserveDataCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'amount': amount,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReserveData &&
          _i3.listsEqual(
            other.id,
            id,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        amount,
      );
}

class $ReserveDataCodec with _i1.Codec<ReserveData> {
  const $ReserveDataCodec();

  @override
  void encodeTo(
    ReserveData obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(8).encodeTo(
      obj.id,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.amount,
      output,
    );
  }

  @override
  ReserveData decode(_i1.Input input) {
    return ReserveData(
      id: const _i1.U8ArrayCodec(8).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(ReserveData obj) {
    int size = 0;
    size = size + const _i1.U8ArrayCodec(8).sizeHint(obj.id);
    size = size + _i1.U128Codec.codec.sizeHint(obj.amount);
    return size;
  }
}

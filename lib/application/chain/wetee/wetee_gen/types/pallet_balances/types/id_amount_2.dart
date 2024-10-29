// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class IdAmount {
  const IdAmount({
    required this.id,
    required this.amount,
  });

  factory IdAmount.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Id
  final dynamic id;

  /// Balance
  final BigInt amount;

  static const $IdAmountCodec codec = $IdAmountCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': null,
        'amount': amount,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is IdAmount && other.id == id && other.amount == amount;

  @override
  int get hashCode => Object.hash(
        id,
        amount,
      );
}

class $IdAmountCodec with _i1.Codec<IdAmount> {
  const $IdAmountCodec();

  @override
  void encodeTo(
    IdAmount obj,
    _i1.Output output,
  ) {
    _i1.NullCodec.codec.encodeTo(
      obj.id,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.amount,
      output,
    );
  }

  @override
  IdAmount decode(_i1.Input input) {
    return IdAmount(
      id: _i1.NullCodec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(IdAmount obj) {
    int size = 0;
    size = size + _i1.NullCodec.codec.sizeHint(obj.id);
    size = size + _i1.U128Codec.codec.sizeHint(obj.amount);
    return size;
  }
}

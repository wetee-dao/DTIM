// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Tally {
  const Tally({
    required this.yes,
    required this.no,
  });

  factory Tally.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Balance
  final BigInt yes;

  /// Balance
  final BigInt no;

  static const $TallyCodec codec = $TallyCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, BigInt> toJson() => {
        'yes': yes,
        'no': no,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Tally && other.yes == yes && other.no == no;

  @override
  int get hashCode => Object.hash(
        yes,
        no,
      );
}

class $TallyCodec with _i1.Codec<Tally> {
  const $TallyCodec();

  @override
  void encodeTo(
    Tally obj,
    _i1.Output output,
  ) {
    _i1.U128Codec.codec.encodeTo(
      obj.yes,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.no,
      output,
    );
  }

  @override
  Tally decode(_i1.Input input) {
    return Tally(
      yes: _i1.U128Codec.codec.decode(input),
      no: _i1.U128Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Tally obj) {
    int size = 0;
    size = size + _i1.U128Codec.codec.sizeHint(obj.yes);
    size = size + _i1.U128Codec.codec.sizeHint(obj.no);
    return size;
  }
}

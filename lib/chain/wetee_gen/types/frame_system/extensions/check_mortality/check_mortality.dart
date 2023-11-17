// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import '../../../sp_runtime/generic/era/era.dart' as _i1;

typedef CheckMortality = _i1.Era;

class CheckMortalityCodec with _i2.Codec<CheckMortality> {
  const CheckMortalityCodec();

  @override
  CheckMortality decode(_i2.Input input) {
    return _i1.Era.codec.decode(input);
  }

  @override
  void encodeTo(
    CheckMortality value,
    _i2.Output output,
  ) {
    _i1.Era.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(CheckMortality value) {
    return _i1.Era.codec.sizeHint(value);
  }
}

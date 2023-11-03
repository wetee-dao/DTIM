// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// Contains a variant per dispatchable extrinsic that this pallet has.
enum Call {
  /// See [`Pallet::create`].
  create('create', 1),

  /// See [`Pallet::update`].
  update('update', 2),

  /// See [`Pallet::set_settings`].
  setSettings('set_settings', 3),

  /// See [`Pallet::charge`].
  charge('charge', 4),

  /// See [`Pallet::stop`].
  stop('stop', 5);

  const Call(
    this.variantName,
    this.codecIndex,
  );

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $CallCodec codec = $CallCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return Call.create;
      case 2:
        return Call.update;
      case 3:
        return Call.setSettings;
      case 4:
        return Call.charge;
      case 5:
        return Call.stop;
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}

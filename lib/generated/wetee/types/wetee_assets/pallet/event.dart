// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../dao_asset_meta.dart' as _i4;

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

  Transferred transferred(
    BigInt value0,
    _i3.AccountId32 value1,
    _i3.AccountId32 value2,
    BigInt value3,
  ) {
    return Transferred(
      value0,
      value1,
      value2,
      value3,
    );
  }

  BalanceUpdated balanceUpdated(
    BigInt value0,
    _i3.AccountId32 value1,
    BigInt value2,
  ) {
    return BalanceUpdated(
      value0,
      value1,
      value2,
    );
  }

  Deposited deposited(
    BigInt value0,
    _i3.AccountId32 value1,
    BigInt value2,
  ) {
    return Deposited(
      value0,
      value1,
      value2,
    );
  }

  Withdrawn withdrawn(
    BigInt value0,
    _i3.AccountId32 value1,
    BigInt value2,
  ) {
    return Withdrawn(
      value0,
      value1,
      value2,
    );
  }

  CreateAsset createAsset(
    _i3.AccountId32 value0,
    BigInt value1,
    BigInt value2,
  ) {
    return CreateAsset(
      value0,
      value1,
      value2,
    );
  }

  SetMetadata setMetadata(
    _i3.AccountId32 value0,
    BigInt value1,
    _i4.DaoAssetMeta value2,
  ) {
    return SetMetadata(
      value0,
      value1,
      value2,
    );
  }

  Burn burn(
    _i3.AccountId32 value0,
    BigInt value1,
    BigInt value2,
  ) {
    return Burn(
      value0,
      value1,
      value2,
    );
  }

  SetWeightRateMultiple setWeightRateMultiple({
    required BigInt daoId,
    required BigInt multiple,
  }) {
    return SetWeightRateMultiple(
      daoId: daoId,
      multiple: multiple,
    );
  }

  SetExistenialDepposit setExistenialDepposit({
    required BigInt daoId,
    required BigInt existenialDeposit,
  }) {
    return SetExistenialDepposit(
      daoId: daoId,
      existenialDeposit: existenialDeposit,
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
        return Transferred._decode(input);
      case 1:
        return BalanceUpdated._decode(input);
      case 2:
        return Deposited._decode(input);
      case 3:
        return Withdrawn._decode(input);
      case 4:
        return CreateAsset._decode(input);
      case 5:
        return SetMetadata._decode(input);
      case 6:
        return Burn._decode(input);
      case 7:
        return SetWeightRateMultiple._decode(input);
      case 8:
        return SetExistenialDepposit._decode(input);
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
      case Transferred:
        (value as Transferred).encodeTo(output);
        break;
      case BalanceUpdated:
        (value as BalanceUpdated).encodeTo(output);
        break;
      case Deposited:
        (value as Deposited).encodeTo(output);
        break;
      case Withdrawn:
        (value as Withdrawn).encodeTo(output);
        break;
      case CreateAsset:
        (value as CreateAsset).encodeTo(output);
        break;
      case SetMetadata:
        (value as SetMetadata).encodeTo(output);
        break;
      case Burn:
        (value as Burn).encodeTo(output);
        break;
      case SetWeightRateMultiple:
        (value as SetWeightRateMultiple).encodeTo(output);
        break;
      case SetExistenialDepposit:
        (value as SetExistenialDepposit).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case Transferred:
        return (value as Transferred)._sizeHint();
      case BalanceUpdated:
        return (value as BalanceUpdated)._sizeHint();
      case Deposited:
        return (value as Deposited)._sizeHint();
      case Withdrawn:
        return (value as Withdrawn)._sizeHint();
      case CreateAsset:
        return (value as CreateAsset)._sizeHint();
      case SetMetadata:
        return (value as SetMetadata)._sizeHint();
      case Burn:
        return (value as Burn)._sizeHint();
      case SetWeightRateMultiple:
        return (value as SetWeightRateMultiple)._sizeHint();
      case SetExistenialDepposit:
        return (value as SetExistenialDepposit)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Currency transfer success. [dao_id, from, to, amount]
class Transferred extends Event {
  const Transferred(
    this.value0,
    this.value1,
    this.value2,
    this.value3,
  );

  factory Transferred._decode(_i1.Input input) {
    return Transferred(
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// T::AccountId
  final _i3.AccountId32 value1;

  /// T::AccountId
  final _i3.AccountId32 value2;

  /// BalanceOf<T>
  final BigInt value3;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Transferred': [
          value0,
          value1.toList(),
          value2.toList(),
          value3,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + const _i3.AccountId32Codec().sizeHint(value1);
    size = size + const _i3.AccountId32Codec().sizeHint(value2);
    size = size + _i1.U128Codec.codec.sizeHint(value3);
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
    const _i1.U8ArrayCodec(32).encodeTo(
      value1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value2,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      value3,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Transferred &&
          other.value0 == value0 &&
          _i5.listsEqual(
            other.value1,
            value1,
          ) &&
          _i5.listsEqual(
            other.value2,
            value2,
          ) &&
          other.value3 == value3;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
        value3,
      );
}

/// Update balance success. [dao_id, who, amount]
class BalanceUpdated extends Event {
  const BalanceUpdated(
    this.value0,
    this.value1,
    this.value2,
  );

  factory BalanceUpdated._decode(_i1.Input input) {
    return BalanceUpdated(
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.I128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// T::AccountId
  final _i3.AccountId32 value1;

  /// AmountOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'BalanceUpdated': [
          value0,
          value1.toList(),
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + const _i3.AccountId32Codec().sizeHint(value1);
    size = size + _i1.I128Codec.codec.sizeHint(value2);
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
    const _i1.U8ArrayCodec(32).encodeTo(
      value1,
      output,
    );
    _i1.I128Codec.codec.encodeTo(
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
      other is BalanceUpdated &&
          other.value0 == value0 &&
          _i5.listsEqual(
            other.value1,
            value1,
          ) &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Deposit success. [dao_id, who, amount]
class Deposited extends Event {
  const Deposited(
    this.value0,
    this.value1,
    this.value2,
  );

  factory Deposited._decode(_i1.Input input) {
    return Deposited(
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// T::AccountId
  final _i3.AccountId32 value1;

  /// BalanceOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Deposited': [
          value0,
          value1.toList(),
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + const _i3.AccountId32Codec().sizeHint(value1);
    size = size + _i1.U128Codec.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value1,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
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
      other is Deposited &&
          other.value0 == value0 &&
          _i5.listsEqual(
            other.value1,
            value1,
          ) &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Withdraw success. [dao_id, who, amount]
class Withdrawn extends Event {
  const Withdrawn(
    this.value0,
    this.value1,
    this.value2,
  );

  factory Withdrawn._decode(_i1.Input input) {
    return Withdrawn(
      _i1.U64Codec.codec.decode(input),
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt value0;

  /// T::AccountId
  final _i3.AccountId32 value1;

  /// BalanceOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Withdrawn': [
          value0,
          value1.toList(),
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    size = size + const _i3.AccountId32Codec().sizeHint(value1);
    size = size + _i1.U128Codec.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value1,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
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
      other is Withdrawn &&
          other.value0 == value0 &&
          _i5.listsEqual(
            other.value1,
            value1,
          ) &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Create asset success. [dao_id, metadata]
class CreateAsset extends Event {
  const CreateAsset(
    this.value0,
    this.value1,
    this.value2,
  );

  factory CreateAsset._decode(_i1.Input input) {
    return CreateAsset(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U64Codec.codec.decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 value0;

  /// DaoAssetId
  final BigInt value1;

  /// BalanceOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'CreateAsset': [
          value0.toList(),
          value1,
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + _i1.U128Codec.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
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
      other is CreateAsset &&
          _i5.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1 &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Update metadata success. [dao_id, metadata]
class SetMetadata extends Event {
  const SetMetadata(
    this.value0,
    this.value1,
    this.value2,
  );

  factory SetMetadata._decode(_i1.Input input) {
    return SetMetadata(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U64Codec.codec.decode(input),
      _i4.DaoAssetMeta.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 value0;

  /// DaoAssetId
  final BigInt value1;

  /// DaoAssetMeta
  final _i4.DaoAssetMeta value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'SetMetadata': [
          value0.toList(),
          value1,
          value2.toJson(),
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + _i4.DaoAssetMeta.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    _i4.DaoAssetMeta.codec.encodeTo(
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
      other is SetMetadata &&
          _i5.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1 &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Burn success. [dao_id, who, amount]
class Burn extends Event {
  const Burn(
    this.value0,
    this.value1,
    this.value2,
  );

  factory Burn._decode(_i1.Input input) {
    return Burn(
      const _i1.U8ArrayCodec(32).decode(input),
      _i1.U64Codec.codec.decode(input),
      _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 value0;

  /// DaoAssetId
  final BigInt value1;

  /// BalanceOf<T>
  final BigInt value2;

  @override
  Map<String, List<dynamic>> toJson() => {
        'Burn': [
          value0.toList(),
          value1,
          value2,
        ]
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(value0);
    size = size + _i1.U64Codec.codec.sizeHint(value1);
    size = size + _i1.U128Codec.codec.sizeHint(value2);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      value1,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
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
      other is Burn &&
          _i5.listsEqual(
            other.value0,
            value0,
          ) &&
          other.value1 == value1 &&
          other.value2 == value2;

  @override
  int get hashCode => Object.hash(
        value0,
        value1,
        value2,
      );
}

/// Set weight rate success. [dao_id, multiple]
class SetWeightRateMultiple extends Event {
  const SetWeightRateMultiple({
    required this.daoId,
    required this.multiple,
  });

  factory SetWeightRateMultiple._decode(_i1.Input input) {
    return SetWeightRateMultiple(
      daoId: _i1.U64Codec.codec.decode(input),
      multiple: _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u128
  final BigInt multiple;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'SetWeightRateMultiple': {
          'daoId': daoId,
          'multiple': multiple,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U128Codec.codec.sizeHint(multiple);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      multiple,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetWeightRateMultiple &&
          other.daoId == daoId &&
          other.multiple == multiple;

  @override
  int get hashCode => Object.hash(
        daoId,
        multiple,
      );
}

/// Set existenial deposit success. [dao_id, existenial_deposit]
class SetExistenialDepposit extends Event {
  const SetExistenialDepposit({
    required this.daoId,
    required this.existenialDeposit,
  });

  factory SetExistenialDepposit._decode(_i1.Input input) {
    return SetExistenialDepposit(
      daoId: _i1.U64Codec.codec.decode(input),
      existenialDeposit: _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// BalanceOf<T>
  final BigInt existenialDeposit;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'SetExistenialDepposit': {
          'daoId': daoId,
          'existenialDeposit': existenialDeposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U128Codec.codec.sizeHint(existenialDeposit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      existenialDeposit,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetExistenialDepposit &&
          other.daoId == daoId &&
          other.existenialDeposit == existenialDeposit;

  @override
  int get hashCode => Object.hash(
        daoId,
        existenialDeposit,
      );
}

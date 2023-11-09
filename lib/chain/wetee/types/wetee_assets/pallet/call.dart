// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../sp_runtime/multiaddress/multi_address.dart' as _i4;
import '../dao_asset_meta.dart' as _i3;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

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

class $Call {
  const $Call();

  CreateAsset createAsset({
    required BigInt daoId,
    required _i3.DaoAssetMeta metadata,
    required BigInt amount,
    required BigInt initDaoAsset,
  }) {
    return CreateAsset(
      daoId: daoId,
      metadata: metadata,
      amount: amount,
      initDaoAsset: initDaoAsset,
    );
  }

  SetExistenialDeposit setExistenialDeposit({
    required BigInt daoId,
    required BigInt existenialDeposit,
  }) {
    return SetExistenialDeposit(
      daoId: daoId,
      existenialDeposit: existenialDeposit,
    );
  }

  SetMetadata setMetadata({
    required BigInt daoId,
    required _i3.DaoAssetMeta metadata,
  }) {
    return SetMetadata(
      daoId: daoId,
      metadata: metadata,
    );
  }

  Burn burn({
    required BigInt daoId,
    required BigInt amount,
  }) {
    return Burn(
      daoId: daoId,
      amount: amount,
    );
  }

  Transfer transfer({
    required _i4.MultiAddress dest,
    required BigInt daoId,
    required BigInt amount,
  }) {
    return Transfer(
      dest: dest,
      daoId: daoId,
      amount: amount,
    );
  }

  Join join({
    required BigInt daoId,
    required int shareExpect,
    required BigInt existenialDeposit,
  }) {
    return Join(
      daoId: daoId,
      shareExpect: shareExpect,
      existenialDeposit: existenialDeposit,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return CreateAsset._decode(input);
      case 3:
        return SetExistenialDeposit._decode(input);
      case 4:
        return SetMetadata._decode(input);
      case 5:
        return Burn._decode(input);
      case 6:
        return Transfer._decode(input);
      case 7:
        return Join._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case CreateAsset:
        (value as CreateAsset).encodeTo(output);
        break;
      case SetExistenialDeposit:
        (value as SetExistenialDeposit).encodeTo(output);
        break;
      case SetMetadata:
        (value as SetMetadata).encodeTo(output);
        break;
      case Burn:
        (value as Burn).encodeTo(output);
        break;
      case Transfer:
        (value as Transfer).encodeTo(output);
        break;
      case Join:
        (value as Join).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case CreateAsset:
        return (value as CreateAsset)._sizeHint();
      case SetExistenialDeposit:
        return (value as SetExistenialDeposit)._sizeHint();
      case SetMetadata:
        return (value as SetMetadata)._sizeHint();
      case Burn:
        return (value as Burn)._sizeHint();
      case Transfer:
        return (value as Transfer)._sizeHint();
      case Join:
        return (value as Join)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::create_asset`].
class CreateAsset extends Call {
  const CreateAsset({
    required this.daoId,
    required this.metadata,
    required this.amount,
    required this.initDaoAsset,
  });

  factory CreateAsset._decode(_i1.Input input) {
    return CreateAsset(
      daoId: _i1.U64Codec.codec.decode(input),
      metadata: _i3.DaoAssetMeta.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
      initDaoAsset: _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// DaoAssetMeta
  final _i3.DaoAssetMeta metadata;

  /// BalanceOf<T>
  final BigInt amount;

  /// BalanceOf<T>
  final BigInt initDaoAsset;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create_asset': {
          'daoId': daoId,
          'metadata': metadata.toJson(),
          'amount': amount,
          'initDaoAsset': initDaoAsset,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i3.DaoAssetMeta.codec.sizeHint(metadata);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    size = size + _i1.U128Codec.codec.sizeHint(initDaoAsset);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i3.DaoAssetMeta.codec.encodeTo(
      metadata,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      initDaoAsset,
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
          other.daoId == daoId &&
          other.metadata == metadata &&
          other.amount == amount &&
          other.initDaoAsset == initDaoAsset;

  @override
  int get hashCode => Object.hash(
        daoId,
        metadata,
        amount,
        initDaoAsset,
      );
}

/// See [`Pallet::set_existenial_deposit`].
class SetExistenialDeposit extends Call {
  const SetExistenialDeposit({
    required this.daoId,
    required this.existenialDeposit,
  });

  factory SetExistenialDeposit._decode(_i1.Input input) {
    return SetExistenialDeposit(
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
        'set_existenial_deposit': {
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
      3,
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
      other is SetExistenialDeposit &&
          other.daoId == daoId &&
          other.existenialDeposit == existenialDeposit;

  @override
  int get hashCode => Object.hash(
        daoId,
        existenialDeposit,
      );
}

/// See [`Pallet::set_metadata`].
class SetMetadata extends Call {
  const SetMetadata({
    required this.daoId,
    required this.metadata,
  });

  factory SetMetadata._decode(_i1.Input input) {
    return SetMetadata(
      daoId: _i1.U64Codec.codec.decode(input),
      metadata: _i3.DaoAssetMeta.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// DaoAssetMeta
  final _i3.DaoAssetMeta metadata;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_metadata': {
          'daoId': daoId,
          'metadata': metadata.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i3.DaoAssetMeta.codec.sizeHint(metadata);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i3.DaoAssetMeta.codec.encodeTo(
      metadata,
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
          other.daoId == daoId &&
          other.metadata == metadata;

  @override
  int get hashCode => Object.hash(
        daoId,
        metadata,
      );
}

/// See [`Pallet::burn`].
class Burn extends Call {
  const Burn({
    required this.daoId,
    required this.amount,
  });

  factory Burn._decode(_i1.Input input) {
    return Burn(
      daoId: _i1.U64Codec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'burn': {
          'daoId': daoId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Burn && other.daoId == daoId && other.amount == amount;

  @override
  int get hashCode => Object.hash(
        daoId,
        amount,
      );
}

/// See [`Pallet::transfer`].
class Transfer extends Call {
  const Transfer({
    required this.dest,
    required this.daoId,
    required this.amount,
  });

  factory Transfer._decode(_i1.Input input) {
    return Transfer(
      dest: _i4.MultiAddress.codec.decode(input),
      daoId: _i1.U64Codec.codec.decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// <T::Lookup as StaticLookup>::Source
  final _i4.MultiAddress dest;

  /// DaoAssetId
  final BigInt daoId;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'transfer': {
          'dest': dest.toJson(),
          'daoId': daoId,
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i4.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Transfer &&
          other.dest == dest &&
          other.daoId == daoId &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        dest,
        daoId,
        amount,
      );
}

/// See [`Pallet::join`].
class Join extends Call {
  const Join({
    required this.daoId,
    required this.shareExpect,
    required this.existenialDeposit,
  });

  factory Join._decode(_i1.Input input) {
    return Join(
      daoId: _i1.U64Codec.codec.decode(input),
      shareExpect: _i1.U32Codec.codec.decode(input),
      existenialDeposit: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u32
  final int shareExpect;

  /// BalanceOf<T>
  final BigInt existenialDeposit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'join': {
          'daoId': daoId,
          'shareExpect': shareExpect,
          'existenialDeposit': existenialDeposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(shareExpect);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(existenialDeposit);
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
    _i1.U32Codec.codec.encodeTo(
      shareExpect,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
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
      other is Join &&
          other.daoId == daoId &&
          other.shareExpect == shareExpect &&
          other.existenialDeposit == existenialDeposit;

  @override
  int get hashCode => Object.hash(
        daoId,
        shareExpect,
        existenialDeposit,
      );
}

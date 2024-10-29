// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../primitive_types/h256.dart' as _i2;

class ContractInfo {
  const ContractInfo({
    required this.trieId,
    required this.codeHash,
    required this.storageBytes,
    required this.storageItems,
    required this.storageByteDeposit,
    required this.storageItemDeposit,
    required this.storageBaseDeposit,
    required this.delegateDependencies,
  });

  factory ContractInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// TrieId
  final List<int> trieId;

  /// CodeHash<T>
  final _i2.H256 codeHash;

  /// u32
  final int storageBytes;

  /// u32
  final int storageItems;

  /// BalanceOf<T>
  final BigInt storageByteDeposit;

  /// BalanceOf<T>
  final BigInt storageItemDeposit;

  /// BalanceOf<T>
  final BigInt storageBaseDeposit;

  /// BoundedBTreeMap<CodeHash<T>, BalanceOf<T>, T::
  ///MaxDelegateDependencies>
  final Map<_i2.H256, BigInt> delegateDependencies;

  static const $ContractInfoCodec codec = $ContractInfoCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'trieId': trieId,
        'codeHash': codeHash.toList(),
        'storageBytes': storageBytes,
        'storageItems': storageItems,
        'storageByteDeposit': storageByteDeposit,
        'storageItemDeposit': storageItemDeposit,
        'storageBaseDeposit': storageBaseDeposit,
        'delegateDependencies': delegateDependencies.map((
          key,
          value,
        ) =>
            MapEntry(
              key.toList(),
              value,
            )),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ContractInfo &&
          _i4.listsEqual(
            other.trieId,
            trieId,
          ) &&
          _i4.listsEqual(
            other.codeHash,
            codeHash,
          ) &&
          other.storageBytes == storageBytes &&
          other.storageItems == storageItems &&
          other.storageByteDeposit == storageByteDeposit &&
          other.storageItemDeposit == storageItemDeposit &&
          other.storageBaseDeposit == storageBaseDeposit &&
          _i4.mapsEqual(
            other.delegateDependencies,
            delegateDependencies,
          );

  @override
  int get hashCode => Object.hash(
        trieId,
        codeHash,
        storageBytes,
        storageItems,
        storageByteDeposit,
        storageItemDeposit,
        storageBaseDeposit,
        delegateDependencies,
      );
}

class $ContractInfoCodec with _i1.Codec<ContractInfo> {
  const $ContractInfoCodec();

  @override
  void encodeTo(
    ContractInfo obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.trieId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.codeHash,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.storageBytes,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.storageItems,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.storageByteDeposit,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.storageItemDeposit,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.storageBaseDeposit,
      output,
    );
    const _i1.BTreeMapCodec<_i2.H256, BigInt>(
      keyCodec: _i2.H256Codec(),
      valueCodec: _i1.U128Codec.codec,
    ).encodeTo(
      obj.delegateDependencies,
      output,
    );
  }

  @override
  ContractInfo decode(_i1.Input input) {
    return ContractInfo(
      trieId: _i1.U8SequenceCodec.codec.decode(input),
      codeHash: const _i1.U8ArrayCodec(32).decode(input),
      storageBytes: _i1.U32Codec.codec.decode(input),
      storageItems: _i1.U32Codec.codec.decode(input),
      storageByteDeposit: _i1.U128Codec.codec.decode(input),
      storageItemDeposit: _i1.U128Codec.codec.decode(input),
      storageBaseDeposit: _i1.U128Codec.codec.decode(input),
      delegateDependencies: const _i1.BTreeMapCodec<_i2.H256, BigInt>(
        keyCodec: _i2.H256Codec(),
        valueCodec: _i1.U128Codec.codec,
      ).decode(input),
    );
  }

  @override
  int sizeHint(ContractInfo obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.trieId);
    size = size + const _i2.H256Codec().sizeHint(obj.codeHash);
    size = size + _i1.U32Codec.codec.sizeHint(obj.storageBytes);
    size = size + _i1.U32Codec.codec.sizeHint(obj.storageItems);
    size = size + _i1.U128Codec.codec.sizeHint(obj.storageByteDeposit);
    size = size + _i1.U128Codec.codec.sizeHint(obj.storageItemDeposit);
    size = size + _i1.U128Codec.codec.sizeHint(obj.storageBaseDeposit);
    size = size +
        const _i1.BTreeMapCodec<_i2.H256, BigInt>(
          keyCodec: _i2.H256Codec(),
          valueCodec: _i1.U128Codec.codec,
        ).sizeHint(obj.delegateDependencies);
    return size;
  }
}

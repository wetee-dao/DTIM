// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../primitive_types/h256.dart' as _i4;
import '../../sp_runtime/multiaddress/multi_address.dart' as _i3;
import '../../sp_weights/weight_v2/weight.dart' as _i6;
import '../wasm/determinism.dart' as _i5;

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

  CallOldWeight callOldWeight({
    required _i3.MultiAddress dest,
    required BigInt value,
    required BigInt gasLimit,
    BigInt? storageDepositLimit,
    required List<int> data,
  }) {
    return CallOldWeight(
      dest: dest,
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      data: data,
    );
  }

  InstantiateWithCodeOldWeight instantiateWithCodeOldWeight({
    required BigInt value,
    required BigInt gasLimit,
    BigInt? storageDepositLimit,
    required List<int> code,
    required List<int> data,
    required List<int> salt,
  }) {
    return InstantiateWithCodeOldWeight(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      code: code,
      data: data,
      salt: salt,
    );
  }

  InstantiateOldWeight instantiateOldWeight({
    required BigInt value,
    required BigInt gasLimit,
    BigInt? storageDepositLimit,
    required _i4.H256 codeHash,
    required List<int> data,
    required List<int> salt,
  }) {
    return InstantiateOldWeight(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      codeHash: codeHash,
      data: data,
      salt: salt,
    );
  }

  UploadCode uploadCode({
    required List<int> code,
    BigInt? storageDepositLimit,
    required _i5.Determinism determinism,
  }) {
    return UploadCode(
      code: code,
      storageDepositLimit: storageDepositLimit,
      determinism: determinism,
    );
  }

  RemoveCode removeCode({required _i4.H256 codeHash}) {
    return RemoveCode(codeHash: codeHash);
  }

  SetCode setCode({
    required _i3.MultiAddress dest,
    required _i4.H256 codeHash,
  }) {
    return SetCode(
      dest: dest,
      codeHash: codeHash,
    );
  }

  CallVariant callVariant({
    required _i3.MultiAddress dest,
    required BigInt value,
    required _i6.Weight gasLimit,
    BigInt? storageDepositLimit,
    required List<int> data,
  }) {
    return CallVariant(
      dest: dest,
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      data: data,
    );
  }

  InstantiateWithCode instantiateWithCode({
    required BigInt value,
    required _i6.Weight gasLimit,
    BigInt? storageDepositLimit,
    required List<int> code,
    required List<int> data,
    required List<int> salt,
  }) {
    return InstantiateWithCode(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      code: code,
      data: data,
      salt: salt,
    );
  }

  Instantiate instantiate({
    required BigInt value,
    required _i6.Weight gasLimit,
    BigInt? storageDepositLimit,
    required _i4.H256 codeHash,
    required List<int> data,
    required List<int> salt,
  }) {
    return Instantiate(
      value: value,
      gasLimit: gasLimit,
      storageDepositLimit: storageDepositLimit,
      codeHash: codeHash,
      data: data,
      salt: salt,
    );
  }

  Migrate migrate({required _i6.Weight weightLimit}) {
    return Migrate(weightLimit: weightLimit);
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return CallOldWeight._decode(input);
      case 1:
        return InstantiateWithCodeOldWeight._decode(input);
      case 2:
        return InstantiateOldWeight._decode(input);
      case 3:
        return UploadCode._decode(input);
      case 4:
        return RemoveCode._decode(input);
      case 5:
        return SetCode._decode(input);
      case 6:
        return CallVariant._decode(input);
      case 7:
        return InstantiateWithCode._decode(input);
      case 8:
        return Instantiate._decode(input);
      case 9:
        return Migrate._decode(input);
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
      case CallOldWeight:
        (value as CallOldWeight).encodeTo(output);
        break;
      case InstantiateWithCodeOldWeight:
        (value as InstantiateWithCodeOldWeight).encodeTo(output);
        break;
      case InstantiateOldWeight:
        (value as InstantiateOldWeight).encodeTo(output);
        break;
      case UploadCode:
        (value as UploadCode).encodeTo(output);
        break;
      case RemoveCode:
        (value as RemoveCode).encodeTo(output);
        break;
      case SetCode:
        (value as SetCode).encodeTo(output);
        break;
      case CallVariant:
        (value as CallVariant).encodeTo(output);
        break;
      case InstantiateWithCode:
        (value as InstantiateWithCode).encodeTo(output);
        break;
      case Instantiate:
        (value as Instantiate).encodeTo(output);
        break;
      case Migrate:
        (value as Migrate).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case CallOldWeight:
        return (value as CallOldWeight)._sizeHint();
      case InstantiateWithCodeOldWeight:
        return (value as InstantiateWithCodeOldWeight)._sizeHint();
      case InstantiateOldWeight:
        return (value as InstantiateOldWeight)._sizeHint();
      case UploadCode:
        return (value as UploadCode)._sizeHint();
      case RemoveCode:
        return (value as RemoveCode)._sizeHint();
      case SetCode:
        return (value as SetCode)._sizeHint();
      case CallVariant:
        return (value as CallVariant)._sizeHint();
      case InstantiateWithCode:
        return (value as InstantiateWithCode)._sizeHint();
      case Instantiate:
        return (value as Instantiate)._sizeHint();
      case Migrate:
        return (value as Migrate)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Deprecated version if [`Self::call`] for use in an in-storage `Call`.
class CallOldWeight extends Call {
  const CallOldWeight({
    required this.dest,
    required this.value,
    required this.gasLimit,
    this.storageDepositLimit,
    required this.data,
  });

  factory CallOldWeight._decode(_i1.Input input) {
    return CallOldWeight(
      dest: _i3.MultiAddress.codec.decode(input),
      value: _i1.CompactBigIntCodec.codec.decode(input),
      gasLimit: _i1.CompactBigIntCodec.codec.decode(input),
      storageDepositLimit:
          const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
              .decode(input),
      data: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// BalanceOf<T>
  final BigInt value;

  /// OldWeight
  final BigInt gasLimit;

  /// Option<<BalanceOf<T> as codec::HasCompact>::Type>
  final BigInt? storageDepositLimit;

  /// Vec<u8>
  final List<int> data;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'call_old_weight': {
          'dest': dest.toJson(),
          'value': value,
          'gasLimit': gasLimit,
          'storageDepositLimit': storageDepositLimit,
          'data': data,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(gasLimit);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
            .sizeHint(storageDepositLimit);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(data);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      gasLimit,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec).encodeTo(
      storageDepositLimit,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      data,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CallOldWeight &&
          other.dest == dest &&
          other.value == value &&
          other.gasLimit == gasLimit &&
          other.storageDepositLimit == storageDepositLimit &&
          _i7.listsEqual(
            other.data,
            data,
          );

  @override
  int get hashCode => Object.hash(
        dest,
        value,
        gasLimit,
        storageDepositLimit,
        data,
      );
}

/// Deprecated version if [`Self::instantiate_with_code`] for use in an in-storage `Call`.
class InstantiateWithCodeOldWeight extends Call {
  const InstantiateWithCodeOldWeight({
    required this.value,
    required this.gasLimit,
    this.storageDepositLimit,
    required this.code,
    required this.data,
    required this.salt,
  });

  factory InstantiateWithCodeOldWeight._decode(_i1.Input input) {
    return InstantiateWithCodeOldWeight(
      value: _i1.CompactBigIntCodec.codec.decode(input),
      gasLimit: _i1.CompactBigIntCodec.codec.decode(input),
      storageDepositLimit:
          const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
              .decode(input),
      code: _i1.U8SequenceCodec.codec.decode(input),
      data: _i1.U8SequenceCodec.codec.decode(input),
      salt: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// BalanceOf<T>
  final BigInt value;

  /// OldWeight
  final BigInt gasLimit;

  /// Option<<BalanceOf<T> as codec::HasCompact>::Type>
  final BigInt? storageDepositLimit;

  /// Vec<u8>
  final List<int> code;

  /// Vec<u8>
  final List<int> data;

  /// Vec<u8>
  final List<int> salt;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'instantiate_with_code_old_weight': {
          'value': value,
          'gasLimit': gasLimit,
          'storageDepositLimit': storageDepositLimit,
          'code': code,
          'data': data,
          'salt': salt,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(gasLimit);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
            .sizeHint(storageDepositLimit);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(code);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(data);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(salt);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      gasLimit,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec).encodeTo(
      storageDepositLimit,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      code,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      data,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      salt,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InstantiateWithCodeOldWeight &&
          other.value == value &&
          other.gasLimit == gasLimit &&
          other.storageDepositLimit == storageDepositLimit &&
          _i7.listsEqual(
            other.code,
            code,
          ) &&
          _i7.listsEqual(
            other.data,
            data,
          ) &&
          _i7.listsEqual(
            other.salt,
            salt,
          );

  @override
  int get hashCode => Object.hash(
        value,
        gasLimit,
        storageDepositLimit,
        code,
        data,
        salt,
      );
}

/// Deprecated version if [`Self::instantiate`] for use in an in-storage `Call`.
class InstantiateOldWeight extends Call {
  const InstantiateOldWeight({
    required this.value,
    required this.gasLimit,
    this.storageDepositLimit,
    required this.codeHash,
    required this.data,
    required this.salt,
  });

  factory InstantiateOldWeight._decode(_i1.Input input) {
    return InstantiateOldWeight(
      value: _i1.CompactBigIntCodec.codec.decode(input),
      gasLimit: _i1.CompactBigIntCodec.codec.decode(input),
      storageDepositLimit:
          const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
              .decode(input),
      codeHash: const _i1.U8ArrayCodec(32).decode(input),
      data: _i1.U8SequenceCodec.codec.decode(input),
      salt: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// BalanceOf<T>
  final BigInt value;

  /// OldWeight
  final BigInt gasLimit;

  /// Option<<BalanceOf<T> as codec::HasCompact>::Type>
  final BigInt? storageDepositLimit;

  /// CodeHash<T>
  final _i4.H256 codeHash;

  /// Vec<u8>
  final List<int> data;

  /// Vec<u8>
  final List<int> salt;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'instantiate_old_weight': {
          'value': value,
          'gasLimit': gasLimit,
          'storageDepositLimit': storageDepositLimit,
          'codeHash': codeHash.toList(),
          'data': data,
          'salt': salt,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(gasLimit);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
            .sizeHint(storageDepositLimit);
    size = size + const _i4.H256Codec().sizeHint(codeHash);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(data);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(salt);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      gasLimit,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec).encodeTo(
      storageDepositLimit,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      codeHash,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      data,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      salt,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InstantiateOldWeight &&
          other.value == value &&
          other.gasLimit == gasLimit &&
          other.storageDepositLimit == storageDepositLimit &&
          _i7.listsEqual(
            other.codeHash,
            codeHash,
          ) &&
          _i7.listsEqual(
            other.data,
            data,
          ) &&
          _i7.listsEqual(
            other.salt,
            salt,
          );

  @override
  int get hashCode => Object.hash(
        value,
        gasLimit,
        storageDepositLimit,
        codeHash,
        data,
        salt,
      );
}

/// Upload new `code` without instantiating a contract from it.
///
/// If the code does not already exist a deposit is reserved from the caller
/// and unreserved only when [`Self::remove_code`] is called. The size of the reserve
/// depends on the size of the supplied `code`.
///
/// If the code already exists in storage it will still return `Ok` and upgrades
/// the in storage version to the current
/// [`InstructionWeights::version`](InstructionWeights).
///
/// - `determinism`: If this is set to any other value but [`Determinism::Enforced`] then
///  the only way to use this code is to delegate call into it from an offchain execution.
///  Set to [`Determinism::Enforced`] if in doubt.
///
/// # Note
///
/// Anyone can instantiate a contract from any uploaded code and thus prevent its removal.
/// To avoid this situation a constructor could employ access control so that it can
/// only be instantiated by permissioned entities. The same is true when uploading
/// through [`Self::instantiate_with_code`].
///
/// Use [`Determinism::Relaxed`] exclusively for non-deterministic code. If the uploaded
/// code is deterministic, specifying [`Determinism::Relaxed`] will be disregarded and
/// result in higher gas costs.
class UploadCode extends Call {
  const UploadCode({
    required this.code,
    this.storageDepositLimit,
    required this.determinism,
  });

  factory UploadCode._decode(_i1.Input input) {
    return UploadCode(
      code: _i1.U8SequenceCodec.codec.decode(input),
      storageDepositLimit:
          const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
              .decode(input),
      determinism: _i5.Determinism.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> code;

  /// Option<<BalanceOf<T> as codec::HasCompact>::Type>
  final BigInt? storageDepositLimit;

  /// Determinism
  final _i5.Determinism determinism;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'upload_code': {
          'code': code,
          'storageDepositLimit': storageDepositLimit,
          'determinism': determinism.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(code);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
            .sizeHint(storageDepositLimit);
    size = size + _i5.Determinism.codec.sizeHint(determinism);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      code,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec).encodeTo(
      storageDepositLimit,
      output,
    );
    _i5.Determinism.codec.encodeTo(
      determinism,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UploadCode &&
          _i7.listsEqual(
            other.code,
            code,
          ) &&
          other.storageDepositLimit == storageDepositLimit &&
          other.determinism == determinism;

  @override
  int get hashCode => Object.hash(
        code,
        storageDepositLimit,
        determinism,
      );
}

/// Remove the code stored under `code_hash` and refund the deposit to its owner.
///
/// A code can only be removed by its original uploader (its owner) and only if it is
/// not used by any contract.
class RemoveCode extends Call {
  const RemoveCode({required this.codeHash});

  factory RemoveCode._decode(_i1.Input input) {
    return RemoveCode(codeHash: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// CodeHash<T>
  final _i4.H256 codeHash;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'remove_code': {'codeHash': codeHash.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i4.H256Codec().sizeHint(codeHash);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      codeHash,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemoveCode &&
          _i7.listsEqual(
            other.codeHash,
            codeHash,
          );

  @override
  int get hashCode => codeHash.hashCode;
}

/// Privileged function that changes the code of an existing contract.
///
/// This takes care of updating refcounts and all other necessary operations. Returns
/// an error if either the `code_hash` or `dest` do not exist.
///
/// # Note
///
/// This does **not** change the address of the contract in question. This means
/// that the contract address is no longer derived from its code hash after calling
/// this dispatchable.
class SetCode extends Call {
  const SetCode({
    required this.dest,
    required this.codeHash,
  });

  factory SetCode._decode(_i1.Input input) {
    return SetCode(
      dest: _i3.MultiAddress.codec.decode(input),
      codeHash: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// CodeHash<T>
  final _i4.H256 codeHash;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_code': {
          'dest': dest.toJson(),
          'codeHash': codeHash.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + const _i4.H256Codec().sizeHint(codeHash);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      codeHash,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetCode &&
          other.dest == dest &&
          _i7.listsEqual(
            other.codeHash,
            codeHash,
          );

  @override
  int get hashCode => Object.hash(
        dest,
        codeHash,
      );
}

/// Makes a call to an account, optionally transferring some balance.
///
/// # Parameters
///
/// * `dest`: Address of the contract to call.
/// * `value`: The balance to transfer from the `origin` to `dest`.
/// * `gas_limit`: The gas limit enforced when executing the constructor.
/// * `storage_deposit_limit`: The maximum amount of balance that can be charged from the
///  caller to pay for the storage consumed.
/// * `data`: The input data to pass to the contract.
///
/// * If the account is a smart-contract account, the associated code will be
/// executed and any value will be transferred.
/// * If the account is a regular account, any value will be transferred.
/// * If no account exists and the call value is not less than `existential_deposit`,
/// a regular account will be created and any value will be transferred.
class CallVariant extends Call {
  const CallVariant({
    required this.dest,
    required this.value,
    required this.gasLimit,
    this.storageDepositLimit,
    required this.data,
  });

  factory CallVariant._decode(_i1.Input input) {
    return CallVariant(
      dest: _i3.MultiAddress.codec.decode(input),
      value: _i1.CompactBigIntCodec.codec.decode(input),
      gasLimit: _i6.Weight.codec.decode(input),
      storageDepositLimit:
          const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
              .decode(input),
      data: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i3.MultiAddress dest;

  /// BalanceOf<T>
  final BigInt value;

  /// Weight
  final _i6.Weight gasLimit;

  /// Option<<BalanceOf<T> as codec::HasCompact>::Type>
  final BigInt? storageDepositLimit;

  /// Vec<u8>
  final List<int> data;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'call': {
          'dest': dest.toJson(),
          'value': value,
          'gasLimit': gasLimit.toJson(),
          'storageDepositLimit': storageDepositLimit,
          'data': data,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MultiAddress.codec.sizeHint(dest);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    size = size + _i6.Weight.codec.sizeHint(gasLimit);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
            .sizeHint(storageDepositLimit);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(data);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i3.MultiAddress.codec.encodeTo(
      dest,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
    _i6.Weight.codec.encodeTo(
      gasLimit,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec).encodeTo(
      storageDepositLimit,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      data,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CallVariant &&
          other.dest == dest &&
          other.value == value &&
          other.gasLimit == gasLimit &&
          other.storageDepositLimit == storageDepositLimit &&
          _i7.listsEqual(
            other.data,
            data,
          );

  @override
  int get hashCode => Object.hash(
        dest,
        value,
        gasLimit,
        storageDepositLimit,
        data,
      );
}

/// Instantiates a new contract from the supplied `code` optionally transferring
/// some balance.
///
/// This dispatchable has the same effect as calling [`Self::upload_code`] +
/// [`Self::instantiate`]. Bundling them together provides efficiency gains. Please
/// also check the documentation of [`Self::upload_code`].
///
/// # Parameters
///
/// * `value`: The balance to transfer from the `origin` to the newly created contract.
/// * `gas_limit`: The gas limit enforced when executing the constructor.
/// * `storage_deposit_limit`: The maximum amount of balance that can be charged/reserved
///  from the caller to pay for the storage consumed.
/// * `code`: The contract code to deploy in raw bytes.
/// * `data`: The input data to pass to the contract constructor.
/// * `salt`: Used for the address derivation. See [`Pallet::contract_address`].
///
/// Instantiation is executed as follows:
///
/// - The supplied `code` is deployed, and a `code_hash` is created for that code.
/// - If the `code_hash` already exists on the chain the underlying `code` will be shared.
/// - The destination address is computed based on the sender, code_hash and the salt.
/// - The smart-contract account is created at the computed address.
/// - The `value` is transferred to the new account.
/// - The `deploy` function is executed in the context of the newly-created account.
class InstantiateWithCode extends Call {
  const InstantiateWithCode({
    required this.value,
    required this.gasLimit,
    this.storageDepositLimit,
    required this.code,
    required this.data,
    required this.salt,
  });

  factory InstantiateWithCode._decode(_i1.Input input) {
    return InstantiateWithCode(
      value: _i1.CompactBigIntCodec.codec.decode(input),
      gasLimit: _i6.Weight.codec.decode(input),
      storageDepositLimit:
          const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
              .decode(input),
      code: _i1.U8SequenceCodec.codec.decode(input),
      data: _i1.U8SequenceCodec.codec.decode(input),
      salt: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// BalanceOf<T>
  final BigInt value;

  /// Weight
  final _i6.Weight gasLimit;

  /// Option<<BalanceOf<T> as codec::HasCompact>::Type>
  final BigInt? storageDepositLimit;

  /// Vec<u8>
  final List<int> code;

  /// Vec<u8>
  final List<int> data;

  /// Vec<u8>
  final List<int> salt;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'instantiate_with_code': {
          'value': value,
          'gasLimit': gasLimit.toJson(),
          'storageDepositLimit': storageDepositLimit,
          'code': code,
          'data': data,
          'salt': salt,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    size = size + _i6.Weight.codec.sizeHint(gasLimit);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
            .sizeHint(storageDepositLimit);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(code);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(data);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(salt);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
    _i6.Weight.codec.encodeTo(
      gasLimit,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec).encodeTo(
      storageDepositLimit,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      code,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      data,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      salt,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is InstantiateWithCode &&
          other.value == value &&
          other.gasLimit == gasLimit &&
          other.storageDepositLimit == storageDepositLimit &&
          _i7.listsEqual(
            other.code,
            code,
          ) &&
          _i7.listsEqual(
            other.data,
            data,
          ) &&
          _i7.listsEqual(
            other.salt,
            salt,
          );

  @override
  int get hashCode => Object.hash(
        value,
        gasLimit,
        storageDepositLimit,
        code,
        data,
        salt,
      );
}

/// Instantiates a contract from a previously deployed wasm binary.
///
/// This function is identical to [`Self::instantiate_with_code`] but without the
/// code deployment step. Instead, the `code_hash` of an on-chain deployed wasm binary
/// must be supplied.
class Instantiate extends Call {
  const Instantiate({
    required this.value,
    required this.gasLimit,
    this.storageDepositLimit,
    required this.codeHash,
    required this.data,
    required this.salt,
  });

  factory Instantiate._decode(_i1.Input input) {
    return Instantiate(
      value: _i1.CompactBigIntCodec.codec.decode(input),
      gasLimit: _i6.Weight.codec.decode(input),
      storageDepositLimit:
          const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
              .decode(input),
      codeHash: const _i1.U8ArrayCodec(32).decode(input),
      data: _i1.U8SequenceCodec.codec.decode(input),
      salt: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// BalanceOf<T>
  final BigInt value;

  /// Weight
  final _i6.Weight gasLimit;

  /// Option<<BalanceOf<T> as codec::HasCompact>::Type>
  final BigInt? storageDepositLimit;

  /// CodeHash<T>
  final _i4.H256 codeHash;

  /// Vec<u8>
  final List<int> data;

  /// Vec<u8>
  final List<int> salt;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'instantiate': {
          'value': value,
          'gasLimit': gasLimit.toJson(),
          'storageDepositLimit': storageDepositLimit,
          'codeHash': codeHash.toList(),
          'data': data,
          'salt': salt,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value);
    size = size + _i6.Weight.codec.sizeHint(gasLimit);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec)
            .sizeHint(storageDepositLimit);
    size = size + const _i4.H256Codec().sizeHint(codeHash);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(data);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(salt);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
    _i6.Weight.codec.encodeTo(
      gasLimit,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.CompactBigIntCodec.codec).encodeTo(
      storageDepositLimit,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      codeHash,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      data,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      salt,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Instantiate &&
          other.value == value &&
          other.gasLimit == gasLimit &&
          other.storageDepositLimit == storageDepositLimit &&
          _i7.listsEqual(
            other.codeHash,
            codeHash,
          ) &&
          _i7.listsEqual(
            other.data,
            data,
          ) &&
          _i7.listsEqual(
            other.salt,
            salt,
          );

  @override
  int get hashCode => Object.hash(
        value,
        gasLimit,
        storageDepositLimit,
        codeHash,
        data,
        salt,
      );
}

/// When a migration is in progress, this dispatchable can be used to run migration steps.
/// Calls that contribute to advancing the migration have their fees waived, as it's helpful
/// for the chain. Note that while the migration is in progress, the pallet will also
/// leverage the `on_idle` hooks to run migration steps.
class Migrate extends Call {
  const Migrate({required this.weightLimit});

  factory Migrate._decode(_i1.Input input) {
    return Migrate(weightLimit: _i6.Weight.codec.decode(input));
  }

  /// Weight
  final _i6.Weight weightLimit;

  @override
  Map<String, Map<String, Map<String, BigInt>>> toJson() => {
        'migrate': {'weightLimit': weightLimit.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i6.Weight.codec.sizeHint(weightLimit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i6.Weight.codec.encodeTo(
      weightLimit,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Migrate && other.weightLimit == weightLimit;

  @override
  int get hashCode => weightLimit.hashCode;
}

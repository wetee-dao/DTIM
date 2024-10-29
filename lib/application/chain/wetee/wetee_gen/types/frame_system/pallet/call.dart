// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../primitive_types/h256.dart' as _i4;
import '../../tuples.dart' as _i3;

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

  Remark remark({required List<int> remark}) {
    return Remark(remark: remark);
  }

  SetHeapPages setHeapPages({required BigInt pages}) {
    return SetHeapPages(pages: pages);
  }

  SetCode setCode({required List<int> code}) {
    return SetCode(code: code);
  }

  SetCodeWithoutChecks setCodeWithoutChecks({required List<int> code}) {
    return SetCodeWithoutChecks(code: code);
  }

  SetStorage setStorage(
      {required List<_i3.Tuple2<List<int>, List<int>>> items}) {
    return SetStorage(items: items);
  }

  KillStorage killStorage({required List<List<int>> keys}) {
    return KillStorage(keys: keys);
  }

  KillPrefix killPrefix({
    required List<int> prefix,
    required int subkeys,
  }) {
    return KillPrefix(
      prefix: prefix,
      subkeys: subkeys,
    );
  }

  RemarkWithEvent remarkWithEvent({required List<int> remark}) {
    return RemarkWithEvent(remark: remark);
  }

  AuthorizeUpgrade authorizeUpgrade({required _i4.H256 codeHash}) {
    return AuthorizeUpgrade(codeHash: codeHash);
  }

  AuthorizeUpgradeWithoutChecks authorizeUpgradeWithoutChecks(
      {required _i4.H256 codeHash}) {
    return AuthorizeUpgradeWithoutChecks(codeHash: codeHash);
  }

  ApplyAuthorizedUpgrade applyAuthorizedUpgrade({required List<int> code}) {
    return ApplyAuthorizedUpgrade(code: code);
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Remark._decode(input);
      case 1:
        return SetHeapPages._decode(input);
      case 2:
        return SetCode._decode(input);
      case 3:
        return SetCodeWithoutChecks._decode(input);
      case 4:
        return SetStorage._decode(input);
      case 5:
        return KillStorage._decode(input);
      case 6:
        return KillPrefix._decode(input);
      case 7:
        return RemarkWithEvent._decode(input);
      case 9:
        return AuthorizeUpgrade._decode(input);
      case 10:
        return AuthorizeUpgradeWithoutChecks._decode(input);
      case 11:
        return ApplyAuthorizedUpgrade._decode(input);
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
      case Remark:
        (value as Remark).encodeTo(output);
        break;
      case SetHeapPages:
        (value as SetHeapPages).encodeTo(output);
        break;
      case SetCode:
        (value as SetCode).encodeTo(output);
        break;
      case SetCodeWithoutChecks:
        (value as SetCodeWithoutChecks).encodeTo(output);
        break;
      case SetStorage:
        (value as SetStorage).encodeTo(output);
        break;
      case KillStorage:
        (value as KillStorage).encodeTo(output);
        break;
      case KillPrefix:
        (value as KillPrefix).encodeTo(output);
        break;
      case RemarkWithEvent:
        (value as RemarkWithEvent).encodeTo(output);
        break;
      case AuthorizeUpgrade:
        (value as AuthorizeUpgrade).encodeTo(output);
        break;
      case AuthorizeUpgradeWithoutChecks:
        (value as AuthorizeUpgradeWithoutChecks).encodeTo(output);
        break;
      case ApplyAuthorizedUpgrade:
        (value as ApplyAuthorizedUpgrade).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Remark:
        return (value as Remark)._sizeHint();
      case SetHeapPages:
        return (value as SetHeapPages)._sizeHint();
      case SetCode:
        return (value as SetCode)._sizeHint();
      case SetCodeWithoutChecks:
        return (value as SetCodeWithoutChecks)._sizeHint();
      case SetStorage:
        return (value as SetStorage)._sizeHint();
      case KillStorage:
        return (value as KillStorage)._sizeHint();
      case KillPrefix:
        return (value as KillPrefix)._sizeHint();
      case RemarkWithEvent:
        return (value as RemarkWithEvent)._sizeHint();
      case AuthorizeUpgrade:
        return (value as AuthorizeUpgrade)._sizeHint();
      case AuthorizeUpgradeWithoutChecks:
        return (value as AuthorizeUpgradeWithoutChecks)._sizeHint();
      case ApplyAuthorizedUpgrade:
        return (value as ApplyAuthorizedUpgrade)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Make some on-chain remark.
///
/// Can be executed by every `origin`.
class Remark extends Call {
  const Remark({required this.remark});

  factory Remark._decode(_i1.Input input) {
    return Remark(remark: _i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> remark;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'remark': {'remark': remark}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(remark);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      remark,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Remark &&
          _i5.listsEqual(
            other.remark,
            remark,
          );

  @override
  int get hashCode => remark.hashCode;
}

/// Set the number of pages in the WebAssembly environment's heap.
class SetHeapPages extends Call {
  const SetHeapPages({required this.pages});

  factory SetHeapPages._decode(_i1.Input input) {
    return SetHeapPages(pages: _i1.U64Codec.codec.decode(input));
  }

  /// u64
  final BigInt pages;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'set_heap_pages': {'pages': pages}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(pages);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      pages,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetHeapPages && other.pages == pages;

  @override
  int get hashCode => pages.hashCode;
}

/// Set the new runtime code.
class SetCode extends Call {
  const SetCode({required this.code});

  factory SetCode._decode(_i1.Input input) {
    return SetCode(code: _i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> code;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'set_code': {'code': code}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(code);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      code,
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
          _i5.listsEqual(
            other.code,
            code,
          );

  @override
  int get hashCode => code.hashCode;
}

/// Set the new runtime code without doing any checks of the given `code`.
///
/// Note that runtime upgrades will not run if this is called with a not-increasing spec
/// version!
class SetCodeWithoutChecks extends Call {
  const SetCodeWithoutChecks({required this.code});

  factory SetCodeWithoutChecks._decode(_i1.Input input) {
    return SetCodeWithoutChecks(code: _i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> code;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'set_code_without_checks': {'code': code}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(code);
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
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetCodeWithoutChecks &&
          _i5.listsEqual(
            other.code,
            code,
          );

  @override
  int get hashCode => code.hashCode;
}

/// Set some items of storage.
class SetStorage extends Call {
  const SetStorage({required this.items});

  factory SetStorage._decode(_i1.Input input) {
    return SetStorage(
        items: const _i1.SequenceCodec<_i3.Tuple2<List<int>, List<int>>>(
            _i3.Tuple2Codec<List<int>, List<int>>(
      _i1.U8SequenceCodec.codec,
      _i1.U8SequenceCodec.codec,
    )).decode(input));
  }

  /// Vec<KeyValue>
  final List<_i3.Tuple2<List<int>, List<int>>> items;

  @override
  Map<String, Map<String, List<List<List<int>>>>> toJson() => {
        'set_storage': {
          'items': items
              .map((value) => [
                    value.value0,
                    value.value1,
                  ])
              .toList()
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.SequenceCodec<_i3.Tuple2<List<int>, List<int>>>(
            _i3.Tuple2Codec<List<int>, List<int>>(
          _i1.U8SequenceCodec.codec,
          _i1.U8SequenceCodec.codec,
        )).sizeHint(items);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.SequenceCodec<_i3.Tuple2<List<int>, List<int>>>(
        _i3.Tuple2Codec<List<int>, List<int>>(
      _i1.U8SequenceCodec.codec,
      _i1.U8SequenceCodec.codec,
    )).encodeTo(
      items,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetStorage &&
          _i5.listsEqual(
            other.items,
            items,
          );

  @override
  int get hashCode => items.hashCode;
}

/// Kill some items from storage.
class KillStorage extends Call {
  const KillStorage({required this.keys});

  factory KillStorage._decode(_i1.Input input) {
    return KillStorage(
        keys: const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .decode(input));
  }

  /// Vec<Key>
  final List<List<int>> keys;

  @override
  Map<String, Map<String, List<List<int>>>> toJson() => {
        'kill_storage': {'keys': keys.map((value) => value).toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(keys);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      keys,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is KillStorage &&
          _i5.listsEqual(
            other.keys,
            keys,
          );

  @override
  int get hashCode => keys.hashCode;
}

/// Kill all storage items with a key that starts with the given prefix.
///
/// **NOTE:** We rely on the Root origin to provide us the number of subkeys under
/// the prefix we are removing to accurately calculate the weight of this function.
class KillPrefix extends Call {
  const KillPrefix({
    required this.prefix,
    required this.subkeys,
  });

  factory KillPrefix._decode(_i1.Input input) {
    return KillPrefix(
      prefix: _i1.U8SequenceCodec.codec.decode(input),
      subkeys: _i1.U32Codec.codec.decode(input),
    );
  }

  /// Key
  final List<int> prefix;

  /// u32
  final int subkeys;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'kill_prefix': {
          'prefix': prefix,
          'subkeys': subkeys,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(prefix);
    size = size + _i1.U32Codec.codec.sizeHint(subkeys);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      prefix,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      subkeys,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is KillPrefix &&
          _i5.listsEqual(
            other.prefix,
            prefix,
          ) &&
          other.subkeys == subkeys;

  @override
  int get hashCode => Object.hash(
        prefix,
        subkeys,
      );
}

/// Make some on-chain remark and emit event.
class RemarkWithEvent extends Call {
  const RemarkWithEvent({required this.remark});

  factory RemarkWithEvent._decode(_i1.Input input) {
    return RemarkWithEvent(remark: _i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> remark;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'remark_with_event': {'remark': remark}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(remark);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      remark,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is RemarkWithEvent &&
          _i5.listsEqual(
            other.remark,
            remark,
          );

  @override
  int get hashCode => remark.hashCode;
}

/// Authorize an upgrade to a given `code_hash` for the runtime. The runtime can be supplied
/// later.
///
/// This call requires Root origin.
class AuthorizeUpgrade extends Call {
  const AuthorizeUpgrade({required this.codeHash});

  factory AuthorizeUpgrade._decode(_i1.Input input) {
    return AuthorizeUpgrade(codeHash: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::Hash
  final _i4.H256 codeHash;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'authorize_upgrade': {'codeHash': codeHash.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i4.H256Codec().sizeHint(codeHash);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
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
      other is AuthorizeUpgrade &&
          _i5.listsEqual(
            other.codeHash,
            codeHash,
          );

  @override
  int get hashCode => codeHash.hashCode;
}

/// Authorize an upgrade to a given `code_hash` for the runtime. The runtime can be supplied
/// later.
///
/// WARNING: This authorizes an upgrade that will take place without any safety checks, for
/// example that the spec name remains the same and that the version number increases. Not
/// recommended for normal use. Use `authorize_upgrade` instead.
///
/// This call requires Root origin.
class AuthorizeUpgradeWithoutChecks extends Call {
  const AuthorizeUpgradeWithoutChecks({required this.codeHash});

  factory AuthorizeUpgradeWithoutChecks._decode(_i1.Input input) {
    return AuthorizeUpgradeWithoutChecks(
        codeHash: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::Hash
  final _i4.H256 codeHash;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'authorize_upgrade_without_checks': {'codeHash': codeHash.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i4.H256Codec().sizeHint(codeHash);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
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
      other is AuthorizeUpgradeWithoutChecks &&
          _i5.listsEqual(
            other.codeHash,
            codeHash,
          );

  @override
  int get hashCode => codeHash.hashCode;
}

/// Provide the preimage (runtime binary) `code` for an upgrade that has been authorized.
///
/// If the authorization required a version check, this call will ensure the spec name
/// remains unchanged and that the spec version has increased.
///
/// Depending on the runtime's `OnSetCode` configuration, this function may directly apply
/// the new `code` in the same block or attempt to schedule the upgrade.
///
/// All origins are allowed.
class ApplyAuthorizedUpgrade extends Call {
  const ApplyAuthorizedUpgrade({required this.code});

  factory ApplyAuthorizedUpgrade._decode(_i1.Input input) {
    return ApplyAuthorizedUpgrade(
        code: _i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> code;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'apply_authorized_upgrade': {'code': code}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(code);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      code,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ApplyAuthorizedUpgrade &&
          _i5.listsEqual(
            other.code,
            code,
          );

  @override
  int get hashCode => code.hashCode;
}

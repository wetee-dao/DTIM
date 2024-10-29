// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../frame_system/pallet/call.dart' as _i3;
import '../orml_tokens/module/call.dart' as _i8;
import '../pallet_balances/pallet/call.dart' as _i6;
import '../pallet_contracts/pallet/call.dart' as _i22;
import '../pallet_grandpa/pallet/call.dart' as _i5;
import '../pallet_sudo/pallet/call.dart' as _i7;
import '../pallet_timestamp/pallet/call.dart' as _i4;
import '../pallet_utility/pallet/call.dart' as _i10;
import '../wetee_app/pallet/call.dart' as _i18;
import '../wetee_assets/pallet/call.dart' as _i12;
import '../wetee_dsecret/pallet/call.dart' as _i23;
import '../wetee_gov/pallet/call.dart' as _i16;
import '../wetee_gpu/pallet/call.dart' as _i20;
import '../wetee_guild/pallet/call.dart' as _i14;
import '../wetee_message_queue/pallet/call.dart' as _i9;
import '../wetee_org/pallet/call.dart' as _i11;
import '../wetee_project/pallet/call.dart' as _i15;
import '../wetee_sudo/pallet/call.dart' as _i13;
import '../wetee_task/pallet/call.dart' as _i19;
import '../wetee_tee_bridge/pallet/call.dart' as _i24;
import '../wetee_treasury/pallet/call.dart' as _i17;
import '../wetee_worker/pallet/call.dart' as _i21;

abstract class RuntimeCall {
  const RuntimeCall();

  factory RuntimeCall.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $RuntimeCallCodec codec = $RuntimeCallCodec();

  static const $RuntimeCall values = $RuntimeCall();

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

class $RuntimeCall {
  const $RuntimeCall();

  System system(_i3.Call value0) {
    return System(value0);
  }

  Timestamp timestamp(_i4.Call value0) {
    return Timestamp(value0);
  }

  Grandpa grandpa(_i5.Call value0) {
    return Grandpa(value0);
  }

  Balances balances(_i6.Call value0) {
    return Balances(value0);
  }

  Sudo sudo(_i7.Call value0) {
    return Sudo(value0);
  }

  Tokens tokens(_i8.Call value0) {
    return Tokens(value0);
  }

  WeTEEMessageQueue weTEEMessageQueue(_i9.Call value0) {
    return WeTEEMessageQueue(value0);
  }

  Utility utility(_i10.Call value0) {
    return Utility(value0);
  }

  WeTEEOrg weTEEOrg(_i11.Call value0) {
    return WeTEEOrg(value0);
  }

  WeTEEAsset weTEEAsset(_i12.Call value0) {
    return WeTEEAsset(value0);
  }

  WeTEESudo weTEESudo(_i13.Call value0) {
    return WeTEESudo(value0);
  }

  WeTEEGuild weTEEGuild(_i14.Call value0) {
    return WeTEEGuild(value0);
  }

  WeTEEProject weTEEProject(_i15.Call value0) {
    return WeTEEProject(value0);
  }

  WeTEEGov weTEEGov(_i16.Call value0) {
    return WeTEEGov(value0);
  }

  WeTEETreasury weTEETreasury(_i17.Call value0) {
    return WeTEETreasury(value0);
  }

  WeTEEApp weTEEApp(_i18.Call value0) {
    return WeTEEApp(value0);
  }

  WeTEETask weTEETask(_i19.Call value0) {
    return WeTEETask(value0);
  }

  WeTEEGpu weTEEGpu(_i20.Call value0) {
    return WeTEEGpu(value0);
  }

  WeTEEWorker weTEEWorker(_i21.Call value0) {
    return WeTEEWorker(value0);
  }

  Contracts contracts(_i22.Call value0) {
    return Contracts(value0);
  }

  WeTEEDsecret weTEEDsecret(_i23.Call value0) {
    return WeTEEDsecret(value0);
  }

  WeTEEBridge weTEEBridge(_i24.Call value0) {
    return WeTEEBridge(value0);
  }
}

class $RuntimeCallCodec with _i1.Codec<RuntimeCall> {
  const $RuntimeCallCodec();

  @override
  RuntimeCall decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return System._decode(input);
      case 1:
        return Timestamp._decode(input);
      case 3:
        return Grandpa._decode(input);
      case 4:
        return Balances._decode(input);
      case 6:
        return Sudo._decode(input);
      case 7:
        return Tokens._decode(input);
      case 9:
        return WeTEEMessageQueue._decode(input);
      case 10:
        return Utility._decode(input);
      case 11:
        return WeTEEOrg._decode(input);
      case 12:
        return WeTEEAsset._decode(input);
      case 13:
        return WeTEESudo._decode(input);
      case 14:
        return WeTEEGuild._decode(input);
      case 15:
        return WeTEEProject._decode(input);
      case 16:
        return WeTEEGov._decode(input);
      case 17:
        return WeTEETreasury._decode(input);
      case 18:
        return WeTEEApp._decode(input);
      case 19:
        return WeTEETask._decode(input);
      case 20:
        return WeTEEGpu._decode(input);
      case 21:
        return WeTEEWorker._decode(input);
      case 22:
        return Contracts._decode(input);
      case 23:
        return WeTEEDsecret._decode(input);
      case 24:
        return WeTEEBridge._decode(input);
      default:
        throw Exception('RuntimeCall: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    RuntimeCall value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case System:
        (value as System).encodeTo(output);
        break;
      case Timestamp:
        (value as Timestamp).encodeTo(output);
        break;
      case Grandpa:
        (value as Grandpa).encodeTo(output);
        break;
      case Balances:
        (value as Balances).encodeTo(output);
        break;
      case Sudo:
        (value as Sudo).encodeTo(output);
        break;
      case Tokens:
        (value as Tokens).encodeTo(output);
        break;
      case WeTEEMessageQueue:
        (value as WeTEEMessageQueue).encodeTo(output);
        break;
      case Utility:
        (value as Utility).encodeTo(output);
        break;
      case WeTEEOrg:
        (value as WeTEEOrg).encodeTo(output);
        break;
      case WeTEEAsset:
        (value as WeTEEAsset).encodeTo(output);
        break;
      case WeTEESudo:
        (value as WeTEESudo).encodeTo(output);
        break;
      case WeTEEGuild:
        (value as WeTEEGuild).encodeTo(output);
        break;
      case WeTEEProject:
        (value as WeTEEProject).encodeTo(output);
        break;
      case WeTEEGov:
        (value as WeTEEGov).encodeTo(output);
        break;
      case WeTEETreasury:
        (value as WeTEETreasury).encodeTo(output);
        break;
      case WeTEEApp:
        (value as WeTEEApp).encodeTo(output);
        break;
      case WeTEETask:
        (value as WeTEETask).encodeTo(output);
        break;
      case WeTEEGpu:
        (value as WeTEEGpu).encodeTo(output);
        break;
      case WeTEEWorker:
        (value as WeTEEWorker).encodeTo(output);
        break;
      case Contracts:
        (value as Contracts).encodeTo(output);
        break;
      case WeTEEDsecret:
        (value as WeTEEDsecret).encodeTo(output);
        break;
      case WeTEEBridge:
        (value as WeTEEBridge).encodeTo(output);
        break;
      default:
        throw Exception(
            'RuntimeCall: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(RuntimeCall value) {
    switch (value.runtimeType) {
      case System:
        return (value as System)._sizeHint();
      case Timestamp:
        return (value as Timestamp)._sizeHint();
      case Grandpa:
        return (value as Grandpa)._sizeHint();
      case Balances:
        return (value as Balances)._sizeHint();
      case Sudo:
        return (value as Sudo)._sizeHint();
      case Tokens:
        return (value as Tokens)._sizeHint();
      case WeTEEMessageQueue:
        return (value as WeTEEMessageQueue)._sizeHint();
      case Utility:
        return (value as Utility)._sizeHint();
      case WeTEEOrg:
        return (value as WeTEEOrg)._sizeHint();
      case WeTEEAsset:
        return (value as WeTEEAsset)._sizeHint();
      case WeTEESudo:
        return (value as WeTEESudo)._sizeHint();
      case WeTEEGuild:
        return (value as WeTEEGuild)._sizeHint();
      case WeTEEProject:
        return (value as WeTEEProject)._sizeHint();
      case WeTEEGov:
        return (value as WeTEEGov)._sizeHint();
      case WeTEETreasury:
        return (value as WeTEETreasury)._sizeHint();
      case WeTEEApp:
        return (value as WeTEEApp)._sizeHint();
      case WeTEETask:
        return (value as WeTEETask)._sizeHint();
      case WeTEEGpu:
        return (value as WeTEEGpu)._sizeHint();
      case WeTEEWorker:
        return (value as WeTEEWorker)._sizeHint();
      case Contracts:
        return (value as Contracts)._sizeHint();
      case WeTEEDsecret:
        return (value as WeTEEDsecret)._sizeHint();
      case WeTEEBridge:
        return (value as WeTEEBridge)._sizeHint();
      default:
        throw Exception(
            'RuntimeCall: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class System extends RuntimeCall {
  const System(this.value0);

  factory System._decode(_i1.Input input) {
    return System(_i3.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<System, Runtime>
  final _i3.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'System': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is System && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Timestamp extends RuntimeCall {
  const Timestamp(this.value0);

  factory Timestamp._decode(_i1.Input input) {
    return Timestamp(_i4.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Timestamp, Runtime>
  final _i4.Call value0;

  @override
  Map<String, Map<String, Map<String, BigInt>>> toJson() =>
      {'Timestamp': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Timestamp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Grandpa extends RuntimeCall {
  const Grandpa(this.value0);

  factory Grandpa._decode(_i1.Input input) {
    return Grandpa(_i5.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Grandpa, Runtime>
  final _i5.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Grandpa': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i5.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i5.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Grandpa && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Balances extends RuntimeCall {
  const Balances(this.value0);

  factory Balances._decode(_i1.Input input) {
    return Balances(_i6.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Balances, Runtime>
  final _i6.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Balances': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i6.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i6.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Balances && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Sudo extends RuntimeCall {
  const Sudo(this.value0);

  factory Sudo._decode(_i1.Input input) {
    return Sudo(_i7.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Sudo, Runtime>
  final _i7.Call value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Sudo': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i7.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i7.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Sudo && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Tokens extends RuntimeCall {
  const Tokens(this.value0);

  factory Tokens._decode(_i1.Input input) {
    return Tokens(_i8.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Tokens, Runtime>
  final _i8.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Tokens': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i8.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i8.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Tokens && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEMessageQueue extends RuntimeCall {
  const WeTEEMessageQueue(this.value0);

  factory WeTEEMessageQueue._decode(_i1.Input input) {
    return WeTEEMessageQueue(_i9.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEMessageQueue, Runtime>
  final _i9.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEMessageQueue': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i9.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i9.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEMessageQueue && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Utility extends RuntimeCall {
  const Utility(this.value0);

  factory Utility._decode(_i1.Input input) {
    return Utility(_i10.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Utility, Runtime>
  final _i10.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Utility': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i10.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i10.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Utility && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEOrg extends RuntimeCall {
  const WeTEEOrg(this.value0);

  factory WeTEEOrg._decode(_i1.Input input) {
    return WeTEEOrg(_i11.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEOrg, Runtime>
  final _i11.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEOrg': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i11.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i11.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEOrg && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEAsset extends RuntimeCall {
  const WeTEEAsset(this.value0);

  factory WeTEEAsset._decode(_i1.Input input) {
    return WeTEEAsset(_i12.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEAsset, Runtime>
  final _i12.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEAsset': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i12.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i12.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEAsset && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEESudo extends RuntimeCall {
  const WeTEESudo(this.value0);

  factory WeTEESudo._decode(_i1.Input input) {
    return WeTEESudo(_i13.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEESudo, Runtime>
  final _i13.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEESudo': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i13.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
      output,
    );
    _i13.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEESudo && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEGuild extends RuntimeCall {
  const WeTEEGuild(this.value0);

  factory WeTEEGuild._decode(_i1.Input input) {
    return WeTEEGuild(_i14.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEGuild, Runtime>
  final _i14.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEGuild': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i14.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
      output,
    );
    _i14.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEGuild && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEProject extends RuntimeCall {
  const WeTEEProject(this.value0);

  factory WeTEEProject._decode(_i1.Input input) {
    return WeTEEProject(_i15.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEProject, Runtime>
  final _i15.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEProject': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i15.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
      output,
    );
    _i15.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEProject && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEGov extends RuntimeCall {
  const WeTEEGov(this.value0);

  factory WeTEEGov._decode(_i1.Input input) {
    return WeTEEGov(_i16.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEGov, Runtime>
  final _i16.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEGov': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i16.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
      output,
    );
    _i16.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEGov && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEETreasury extends RuntimeCall {
  const WeTEETreasury(this.value0);

  factory WeTEETreasury._decode(_i1.Input input) {
    return WeTEETreasury(_i17.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEETreasury, Runtime>
  final _i17.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEETreasury': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i17.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      17,
      output,
    );
    _i17.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEETreasury && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEApp extends RuntimeCall {
  const WeTEEApp(this.value0);

  factory WeTEEApp._decode(_i1.Input input) {
    return WeTEEApp(_i18.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEApp, Runtime>
  final _i18.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEApp': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i18.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      18,
      output,
    );
    _i18.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEApp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEETask extends RuntimeCall {
  const WeTEETask(this.value0);

  factory WeTEETask._decode(_i1.Input input) {
    return WeTEETask(_i19.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEETask, Runtime>
  final _i19.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEETask': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i19.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      19,
      output,
    );
    _i19.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEETask && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEGpu extends RuntimeCall {
  const WeTEEGpu(this.value0);

  factory WeTEEGpu._decode(_i1.Input input) {
    return WeTEEGpu(_i20.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEGpu, Runtime>
  final _i20.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEGpu': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i20.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      20,
      output,
    );
    _i20.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEGpu && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEWorker extends RuntimeCall {
  const WeTEEWorker(this.value0);

  factory WeTEEWorker._decode(_i1.Input input) {
    return WeTEEWorker(_i21.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEWorker, Runtime>
  final _i21.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEWorker': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i21.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      21,
      output,
    );
    _i21.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEWorker && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Contracts extends RuntimeCall {
  const Contracts(this.value0);

  factory Contracts._decode(_i1.Input input) {
    return Contracts(_i22.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<Contracts, Runtime>
  final _i22.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Contracts': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i22.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i22.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Contracts && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEDsecret extends RuntimeCall {
  const WeTEEDsecret(this.value0);

  factory WeTEEDsecret._decode(_i1.Input input) {
    return WeTEEDsecret(_i23.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEDsecret, Runtime>
  final _i23.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEDsecret': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i23.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      23,
      output,
    );
    _i23.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEDsecret && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeTEEBridge extends RuntimeCall {
  const WeTEEBridge(this.value0);

  factory WeTEEBridge._decode(_i1.Input input) {
    return WeTEEBridge(_i24.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeTEEBridge, Runtime>
  final _i24.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEBridge': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i24.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      24,
      output,
    );
    _i24.Call.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WeTEEBridge && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

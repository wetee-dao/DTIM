// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../frame_system/pallet/call.dart' as _i3;
import '../orml_tokens/module/call.dart' as _i8;
import '../pallet_balances/pallet/call.dart' as _i6;
import '../pallet_grandpa/pallet/call.dart' as _i5;
import '../pallet_message_queue/pallet/call.dart' as _i9;
import '../pallet_sudo/pallet/call.dart' as _i7;
import '../pallet_timestamp/pallet/call.dart' as _i4;
import '../wetee_app/pallet/call.dart' as _i17;
import '../wetee_assets/pallet/call.dart' as _i11;
import '../wetee_gov/pallet/call.dart' as _i15;
import '../wetee_guild/pallet/call.dart' as _i13;
import '../wetee_org/pallet/call.dart' as _i10;
import '../wetee_project/pallet/call.dart' as _i14;
import '../wetee_sudo/pallet/call.dart' as _i12;
import '../wetee_treasury/pallet/call.dart' as _i16;
import '../wetee_worker/pallet/call.dart' as _i18;

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

  Map<String, dynamic> toJson();
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

  MessageQueue messageQueue(_i9.Call value0) {
    return MessageQueue(value0);
  }

  WeteeOrg weteeOrg(_i10.Call value0) {
    return WeteeOrg(value0);
  }

  WeteeAsset weteeAsset(_i11.Call value0) {
    return WeteeAsset(value0);
  }

  WeteeSudo weteeSudo(_i12.Call value0) {
    return WeteeSudo(value0);
  }

  WeteeGuild weteeGuild(_i13.Call value0) {
    return WeteeGuild(value0);
  }

  WeteeProject weteeProject(_i14.Call value0) {
    return WeteeProject(value0);
  }

  WeteeGov weteeGov(_i15.Call value0) {
    return WeteeGov(value0);
  }

  WeteeTreasury weteeTreasury(_i16.Call value0) {
    return WeteeTreasury(value0);
  }

  WeteeApp weteeApp(_i17.Call value0) {
    return WeteeApp(value0);
  }

  WeteeWorker weteeWorker(_i18.Call value0) {
    return WeteeWorker(value0);
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
      case 8:
        return MessageQueue._decode(input);
      case 9:
        return WeteeOrg._decode(input);
      case 10:
        return WeteeAsset._decode(input);
      case 11:
        return WeteeSudo._decode(input);
      case 12:
        return WeteeGuild._decode(input);
      case 13:
        return WeteeProject._decode(input);
      case 14:
        return WeteeGov._decode(input);
      case 15:
        return WeteeTreasury._decode(input);
      case 16:
        return WeteeApp._decode(input);
      case 17:
        return WeteeWorker._decode(input);
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
      case MessageQueue:
        (value as MessageQueue).encodeTo(output);
        break;
      case WeteeOrg:
        (value as WeteeOrg).encodeTo(output);
        break;
      case WeteeAsset:
        (value as WeteeAsset).encodeTo(output);
        break;
      case WeteeSudo:
        (value as WeteeSudo).encodeTo(output);
        break;
      case WeteeGuild:
        (value as WeteeGuild).encodeTo(output);
        break;
      case WeteeProject:
        (value as WeteeProject).encodeTo(output);
        break;
      case WeteeGov:
        (value as WeteeGov).encodeTo(output);
        break;
      case WeteeTreasury:
        (value as WeteeTreasury).encodeTo(output);
        break;
      case WeteeApp:
        (value as WeteeApp).encodeTo(output);
        break;
      case WeteeWorker:
        (value as WeteeWorker).encodeTo(output);
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
      case MessageQueue:
        return (value as MessageQueue)._sizeHint();
      case WeteeOrg:
        return (value as WeteeOrg)._sizeHint();
      case WeteeAsset:
        return (value as WeteeAsset)._sizeHint();
      case WeteeSudo:
        return (value as WeteeSudo)._sizeHint();
      case WeteeGuild:
        return (value as WeteeGuild)._sizeHint();
      case WeteeProject:
        return (value as WeteeProject)._sizeHint();
      case WeteeGov:
        return (value as WeteeGov)._sizeHint();
      case WeteeTreasury:
        return (value as WeteeTreasury)._sizeHint();
      case WeteeApp:
        return (value as WeteeApp)._sizeHint();
      case WeteeWorker:
        return (value as WeteeWorker)._sizeHint();
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
  Map<String, Map<String, Map<String, Map<String, dynamic>>>> toJson() =>
      {'Sudo': value0.toJson()};

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

class MessageQueue extends RuntimeCall {
  const MessageQueue(this.value0);

  factory MessageQueue._decode(_i1.Input input) {
    return MessageQueue(_i9.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<MessageQueue, Runtime>
  final _i9.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'MessageQueue': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i9.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
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
      other is MessageQueue && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeOrg extends RuntimeCall {
  const WeteeOrg(this.value0);

  factory WeteeOrg._decode(_i1.Input input) {
    return WeteeOrg(_i10.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeOrg, Runtime>
  final _i10.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeOrg': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i10.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
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
      other is WeteeOrg && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeAsset extends RuntimeCall {
  const WeteeAsset(this.value0);

  factory WeteeAsset._decode(_i1.Input input) {
    return WeteeAsset(_i11.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeAsset, Runtime>
  final _i11.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeAsset': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i11.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
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
      other is WeteeAsset && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeSudo extends RuntimeCall {
  const WeteeSudo(this.value0);

  factory WeteeSudo._decode(_i1.Input input) {
    return WeteeSudo(_i12.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeSudo, Runtime>
  final _i12.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeSudo': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i12.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
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
      other is WeteeSudo && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeGuild extends RuntimeCall {
  const WeteeGuild(this.value0);

  factory WeteeGuild._decode(_i1.Input input) {
    return WeteeGuild(_i13.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeGuild, Runtime>
  final _i13.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeGuild': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i13.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
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
      other is WeteeGuild && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeProject extends RuntimeCall {
  const WeteeProject(this.value0);

  factory WeteeProject._decode(_i1.Input input) {
    return WeteeProject(_i14.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeProject, Runtime>
  final _i14.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeProject': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i14.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
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
      other is WeteeProject && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeGov extends RuntimeCall {
  const WeteeGov(this.value0);

  factory WeteeGov._decode(_i1.Input input) {
    return WeteeGov(_i15.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeGov, Runtime>
  final _i15.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeGov': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i15.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
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
      other is WeteeGov && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeTreasury extends RuntimeCall {
  const WeteeTreasury(this.value0);

  factory WeteeTreasury._decode(_i1.Input input) {
    return WeteeTreasury(_i16.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeTreasury, Runtime>
  final _i16.Call value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeTreasury': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i16.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
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
      other is WeteeTreasury && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeApp extends RuntimeCall {
  const WeteeApp(this.value0);

  factory WeteeApp._decode(_i1.Input input) {
    return WeteeApp(_i17.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeApp, Runtime>
  final _i17.Call value0;

  @override
  Map<String, String> toJson() => {'WeteeApp': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i17.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
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
      other is WeteeApp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeWorker extends RuntimeCall {
  const WeteeWorker(this.value0);

  factory WeteeWorker._decode(_i1.Input input) {
    return WeteeWorker(_i18.Call.codec.decode(input));
  }

  /// self::sp_api_hidden_includes_construct_runtime::hidden_include::dispatch
  ///::CallableCallFor<WeteeWorker, Runtime>
  final _i18.Call value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'WeteeWorker': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i18.Call.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      17,
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
      other is WeteeWorker && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

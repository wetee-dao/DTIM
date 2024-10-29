// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../frame_system/pallet/event.dart' as _i3;
import '../orml_tokens/module/event.dart' as _i8;
import '../pallet_balances/pallet/event.dart' as _i5;
import '../pallet_contracts/pallet/event.dart' as _i22;
import '../pallet_grandpa/pallet/event.dart' as _i4;
import '../pallet_sudo/pallet/event.dart' as _i7;
import '../pallet_transaction_payment/pallet/event.dart' as _i6;
import '../pallet_utility/pallet/event.dart' as _i10;
import '../wetee_app/pallet/event.dart' as _i18;
import '../wetee_assets/pallet/event.dart' as _i12;
import '../wetee_dsecret/pallet/event.dart' as _i23;
import '../wetee_gov/pallet/event.dart' as _i16;
import '../wetee_gpu/pallet/event.dart' as _i20;
import '../wetee_guild/pallet/event.dart' as _i14;
import '../wetee_matrix/pallet/event.dart' as _i25;
import '../wetee_message_queue/pallet/event.dart' as _i9;
import '../wetee_org/pallet/event.dart' as _i11;
import '../wetee_project/pallet/event.dart' as _i15;
import '../wetee_sudo/pallet/event.dart' as _i13;
import '../wetee_task/pallet/event.dart' as _i19;
import '../wetee_tee_bridge/pallet/event.dart' as _i24;
import '../wetee_treasury/pallet/event.dart' as _i17;
import '../wetee_worker/pallet/event.dart' as _i21;

abstract class RuntimeEvent {
  const RuntimeEvent();

  factory RuntimeEvent.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $RuntimeEventCodec codec = $RuntimeEventCodec();

  static const $RuntimeEvent values = $RuntimeEvent();

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

class $RuntimeEvent {
  const $RuntimeEvent();

  System system(_i3.Event value0) {
    return System(value0);
  }

  Grandpa grandpa(_i4.Event value0) {
    return Grandpa(value0);
  }

  Balances balances(_i5.Event value0) {
    return Balances(value0);
  }

  TransactionPayment transactionPayment(_i6.Event value0) {
    return TransactionPayment(value0);
  }

  Sudo sudo(_i7.Event value0) {
    return Sudo(value0);
  }

  Tokens tokens(_i8.Event value0) {
    return Tokens(value0);
  }

  WeTEEMessageQueue weTEEMessageQueue(_i9.Event value0) {
    return WeTEEMessageQueue(value0);
  }

  Utility utility(_i10.Event value0) {
    return Utility(value0);
  }

  WeTEEOrg weTEEOrg(_i11.Event value0) {
    return WeTEEOrg(value0);
  }

  WeTEEAsset weTEEAsset(_i12.Event value0) {
    return WeTEEAsset(value0);
  }

  WeTEESudo weTEESudo(_i13.Event value0) {
    return WeTEESudo(value0);
  }

  WeTEEGuild weTEEGuild(_i14.Event value0) {
    return WeTEEGuild(value0);
  }

  WeTEEProject weTEEProject(_i15.Event value0) {
    return WeTEEProject(value0);
  }

  WeTEEGov weTEEGov(_i16.Event value0) {
    return WeTEEGov(value0);
  }

  WeTEETreasury weTEETreasury(_i17.Event value0) {
    return WeTEETreasury(value0);
  }

  WeTEEApp weTEEApp(_i18.Event value0) {
    return WeTEEApp(value0);
  }

  WeTEETask weTEETask(_i19.Event value0) {
    return WeTEETask(value0);
  }

  WeTEEGpu weTEEGpu(_i20.Event value0) {
    return WeTEEGpu(value0);
  }

  WeTEEWorker weTEEWorker(_i21.Event value0) {
    return WeTEEWorker(value0);
  }

  Contracts contracts(_i22.Event value0) {
    return Contracts(value0);
  }

  WeTEEDsecret weTEEDsecret(_i23.Event value0) {
    return WeTEEDsecret(value0);
  }

  WeTEEBridge weTEEBridge(_i24.Event value0) {
    return WeTEEBridge(value0);
  }

  WeTEEMatrix weTEEMatrix(_i25.Event value0) {
    return WeTEEMatrix(value0);
  }
}

class $RuntimeEventCodec with _i1.Codec<RuntimeEvent> {
  const $RuntimeEventCodec();

  @override
  RuntimeEvent decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return System._decode(input);
      case 3:
        return Grandpa._decode(input);
      case 4:
        return Balances._decode(input);
      case 5:
        return TransactionPayment._decode(input);
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
      case 25:
        return WeTEEMatrix._decode(input);
      default:
        throw Exception('RuntimeEvent: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    RuntimeEvent value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case System:
        (value as System).encodeTo(output);
        break;
      case Grandpa:
        (value as Grandpa).encodeTo(output);
        break;
      case Balances:
        (value as Balances).encodeTo(output);
        break;
      case TransactionPayment:
        (value as TransactionPayment).encodeTo(output);
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
      case WeTEEMatrix:
        (value as WeTEEMatrix).encodeTo(output);
        break;
      default:
        throw Exception(
            'RuntimeEvent: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(RuntimeEvent value) {
    switch (value.runtimeType) {
      case System:
        return (value as System)._sizeHint();
      case Grandpa:
        return (value as Grandpa)._sizeHint();
      case Balances:
        return (value as Balances)._sizeHint();
      case TransactionPayment:
        return (value as TransactionPayment)._sizeHint();
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
      case WeTEEMatrix:
        return (value as WeTEEMatrix)._sizeHint();
      default:
        throw Exception(
            'RuntimeEvent: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class System extends RuntimeEvent {
  const System(this.value0);

  factory System._decode(_i1.Input input) {
    return System(_i3.Event.codec.decode(input));
  }

  /// frame_system::Event<Runtime>
  final _i3.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'System': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.Event.codec.encodeTo(
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

class Grandpa extends RuntimeEvent {
  const Grandpa(this.value0);

  factory Grandpa._decode(_i1.Input input) {
    return Grandpa(_i4.Event.codec.decode(input));
  }

  /// pallet_grandpa::Event
  final _i4.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Grandpa': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i4.Event.codec.encodeTo(
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

class Balances extends RuntimeEvent {
  const Balances(this.value0);

  factory Balances._decode(_i1.Input input) {
    return Balances(_i5.Event.codec.decode(input));
  }

  /// pallet_balances::Event<Runtime>
  final _i5.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Balances': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i5.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i5.Event.codec.encodeTo(
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

class TransactionPayment extends RuntimeEvent {
  const TransactionPayment(this.value0);

  factory TransactionPayment._decode(_i1.Input input) {
    return TransactionPayment(_i6.Event.codec.decode(input));
  }

  /// pallet_transaction_payment::Event<Runtime>
  final _i6.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'TransactionPayment': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i6.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i6.Event.codec.encodeTo(
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
      other is TransactionPayment && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Sudo extends RuntimeEvent {
  const Sudo(this.value0);

  factory Sudo._decode(_i1.Input input) {
    return Sudo(_i7.Event.codec.decode(input));
  }

  /// pallet_sudo::Event<Runtime>
  final _i7.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Sudo': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i7.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i7.Event.codec.encodeTo(
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

class Tokens extends RuntimeEvent {
  const Tokens(this.value0);

  factory Tokens._decode(_i1.Input input) {
    return Tokens(_i8.Event.codec.decode(input));
  }

  /// orml_tokens::Event<Runtime>
  final _i8.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Tokens': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i8.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i8.Event.codec.encodeTo(
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

class WeTEEMessageQueue extends RuntimeEvent {
  const WeTEEMessageQueue(this.value0);

  factory WeTEEMessageQueue._decode(_i1.Input input) {
    return WeTEEMessageQueue(_i9.Event.codec.decode(input));
  }

  /// wetee_message_queue::Event<Runtime>
  final _i9.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEMessageQueue': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i9.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i9.Event.codec.encodeTo(
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

class Utility extends RuntimeEvent {
  const Utility(this.value0);

  factory Utility._decode(_i1.Input input) {
    return Utility(_i10.Event.codec.decode(input));
  }

  /// pallet_utility::Event
  final _i10.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Utility': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i10.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i10.Event.codec.encodeTo(
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

class WeTEEOrg extends RuntimeEvent {
  const WeTEEOrg(this.value0);

  factory WeTEEOrg._decode(_i1.Input input) {
    return WeTEEOrg(_i11.Event.codec.decode(input));
  }

  /// wetee_org::Event<Runtime>
  final _i11.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'WeTEEOrg': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i11.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i11.Event.codec.encodeTo(
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

class WeTEEAsset extends RuntimeEvent {
  const WeTEEAsset(this.value0);

  factory WeTEEAsset._decode(_i1.Input input) {
    return WeTEEAsset(_i12.Event.codec.decode(input));
  }

  /// wetee_assets::Event<Runtime>
  final _i12.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'WeTEEAsset': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i12.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i12.Event.codec.encodeTo(
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

class WeTEESudo extends RuntimeEvent {
  const WeTEESudo(this.value0);

  factory WeTEESudo._decode(_i1.Input input) {
    return WeTEESudo(_i13.Event.codec.decode(input));
  }

  /// wetee_sudo::Event<Runtime>
  final _i13.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEESudo': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i13.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
      output,
    );
    _i13.Event.codec.encodeTo(
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

class WeTEEGuild extends RuntimeEvent {
  const WeTEEGuild(this.value0);

  factory WeTEEGuild._decode(_i1.Input input) {
    return WeTEEGuild(_i14.Event.codec.decode(input));
  }

  /// wetee_guild::Event<Runtime>
  final _i14.Event value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'WeTEEGuild': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i14.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
      output,
    );
    _i14.Event.codec.encodeTo(
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

class WeTEEProject extends RuntimeEvent {
  const WeTEEProject(this.value0);

  factory WeTEEProject._decode(_i1.Input input) {
    return WeTEEProject(_i15.Event.codec.decode(input));
  }

  /// wetee_project::Event<Runtime>
  final _i15.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'WeTEEProject': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i15.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
      output,
    );
    _i15.Event.codec.encodeTo(
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

class WeTEEGov extends RuntimeEvent {
  const WeTEEGov(this.value0);

  factory WeTEEGov._decode(_i1.Input input) {
    return WeTEEGov(_i16.Event.codec.decode(input));
  }

  /// wetee_gov::Event<Runtime>
  final _i16.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'WeTEEGov': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i16.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
      output,
    );
    _i16.Event.codec.encodeTo(
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

class WeTEETreasury extends RuntimeEvent {
  const WeTEETreasury(this.value0);

  factory WeTEETreasury._decode(_i1.Input input) {
    return WeTEETreasury(_i17.Event.codec.decode(input));
  }

  /// wetee_treasury::Event<Runtime>
  final _i17.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEETreasury': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i17.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      17,
      output,
    );
    _i17.Event.codec.encodeTo(
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

class WeTEEApp extends RuntimeEvent {
  const WeTEEApp(this.value0);

  factory WeTEEApp._decode(_i1.Input input) {
    return WeTEEApp(_i18.Event.codec.decode(input));
  }

  /// wetee_app::Event<Runtime>
  final _i18.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEApp': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i18.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      18,
      output,
    );
    _i18.Event.codec.encodeTo(
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

class WeTEETask extends RuntimeEvent {
  const WeTEETask(this.value0);

  factory WeTEETask._decode(_i1.Input input) {
    return WeTEETask(_i19.Event.codec.decode(input));
  }

  /// wetee_task::Event<Runtime>
  final _i19.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEETask': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i19.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      19,
      output,
    );
    _i19.Event.codec.encodeTo(
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

class WeTEEGpu extends RuntimeEvent {
  const WeTEEGpu(this.value0);

  factory WeTEEGpu._decode(_i1.Input input) {
    return WeTEEGpu(_i20.Event.codec.decode(input));
  }

  /// wetee_gpu::Event<Runtime>
  final _i20.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEGpu': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i20.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      20,
      output,
    );
    _i20.Event.codec.encodeTo(
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

class WeTEEWorker extends RuntimeEvent {
  const WeTEEWorker(this.value0);

  factory WeTEEWorker._decode(_i1.Input input) {
    return WeTEEWorker(_i21.Event.codec.decode(input));
  }

  /// wetee_worker::Event<Runtime>
  final _i21.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEWorker': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i21.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      21,
      output,
    );
    _i21.Event.codec.encodeTo(
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

class Contracts extends RuntimeEvent {
  const Contracts(this.value0);

  factory Contracts._decode(_i1.Input input) {
    return Contracts(_i22.Event.codec.decode(input));
  }

  /// pallet_contracts::Event<Runtime>
  final _i22.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Contracts': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i22.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i22.Event.codec.encodeTo(
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

class WeTEEDsecret extends RuntimeEvent {
  const WeTEEDsecret(this.value0);

  factory WeTEEDsecret._decode(_i1.Input input) {
    return WeTEEDsecret(_i23.Event.codec.decode(input));
  }

  /// wetee_dsecret::Event<Runtime>
  final _i23.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEDsecret': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i23.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      23,
      output,
    );
    _i23.Event.codec.encodeTo(
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

class WeTEEBridge extends RuntimeEvent {
  const WeTEEBridge(this.value0);

  factory WeTEEBridge._decode(_i1.Input input) {
    return WeTEEBridge(_i24.Event.codec.decode(input));
  }

  /// wetee_tee_bridge::Event<Runtime>
  final _i24.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeTEEBridge': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i24.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      24,
      output,
    );
    _i24.Event.codec.encodeTo(
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

class WeTEEMatrix extends RuntimeEvent {
  const WeTEEMatrix(this.value0);

  factory WeTEEMatrix._decode(_i1.Input input) {
    return WeTEEMatrix(_i25.Event.codec.decode(input));
  }

  /// wetee_matrix::Event<Runtime>
  final _i25.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() =>
      {'WeTEEMatrix': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i25.Event.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      25,
      output,
    );
    _i25.Event.codec.encodeTo(
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
      other is WeTEEMatrix && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

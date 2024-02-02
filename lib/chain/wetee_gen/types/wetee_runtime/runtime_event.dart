// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../frame_system/pallet/event.dart' as _i3;
import '../orml_tokens/module/event.dart' as _i8;
import '../pallet_balances/pallet/event.dart' as _i5;
import '../pallet_grandpa/pallet/event.dart' as _i4;
import '../pallet_message_queue/pallet/event.dart' as _i9;
import '../pallet_sudo/pallet/event.dart' as _i7;
import '../pallet_transaction_payment/pallet/event.dart' as _i6;
import '../wetee_app/pallet/event.dart' as _i17;
import '../wetee_assets/pallet/event.dart' as _i11;
import '../wetee_gov/pallet/event.dart' as _i15;
import '../wetee_guild/pallet/event.dart' as _i13;
import '../wetee_org/pallet/event.dart' as _i10;
import '../wetee_project/pallet/event.dart' as _i14;
import '../wetee_sudo/pallet/event.dart' as _i12;
import '../wetee_task/pallet/event.dart' as _i18;
import '../wetee_treasury/pallet/event.dart' as _i16;
import '../wetee_worker/pallet/event.dart' as _i19;

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

  MessageQueue messageQueue(_i9.Event value0) {
    return MessageQueue(value0);
  }

  WeteeOrg weteeOrg(_i10.Event value0) {
    return WeteeOrg(value0);
  }

  WeteeAsset weteeAsset(_i11.Event value0) {
    return WeteeAsset(value0);
  }

  WeteeSudo weteeSudo(_i12.Event value0) {
    return WeteeSudo(value0);
  }

  WeteeGuild weteeGuild(_i13.Event value0) {
    return WeteeGuild(value0);
  }

  WeteeProject weteeProject(_i14.Event value0) {
    return WeteeProject(value0);
  }

  WeteeGov weteeGov(_i15.Event value0) {
    return WeteeGov(value0);
  }

  WeteeTreasury weteeTreasury(_i16.Event value0) {
    return WeteeTreasury(value0);
  }

  WeteeApp weteeApp(_i17.Event value0) {
    return WeteeApp(value0);
  }

  WeteeTask weteeTask(_i18.Event value0) {
    return WeteeTask(value0);
  }

  WeteeWorker weteeWorker(_i19.Event value0) {
    return WeteeWorker(value0);
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
        return MessageQueue._decode(input);
      case 10:
        return WeteeOrg._decode(input);
      case 11:
        return WeteeAsset._decode(input);
      case 12:
        return WeteeSudo._decode(input);
      case 13:
        return WeteeGuild._decode(input);
      case 14:
        return WeteeProject._decode(input);
      case 15:
        return WeteeGov._decode(input);
      case 16:
        return WeteeTreasury._decode(input);
      case 17:
        return WeteeApp._decode(input);
      case 18:
        return WeteeTask._decode(input);
      case 19:
        return WeteeWorker._decode(input);
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
      case WeteeTask:
        (value as WeteeTask).encodeTo(output);
        break;
      case WeteeWorker:
        (value as WeteeWorker).encodeTo(output);
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
      case WeteeTask:
        return (value as WeteeTask)._sizeHint();
      case WeteeWorker:
        return (value as WeteeWorker)._sizeHint();
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
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'Sudo': value0.toJson()};

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

class MessageQueue extends RuntimeEvent {
  const MessageQueue(this.value0);

  factory MessageQueue._decode(_i1.Input input) {
    return MessageQueue(_i9.Event.codec.decode(input));
  }

  /// pallet_message_queue::Event<Runtime>
  final _i9.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'MessageQueue': value0.toJson()};

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
      other is MessageQueue && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeOrg extends RuntimeEvent {
  const WeteeOrg(this.value0);

  factory WeteeOrg._decode(_i1.Input input) {
    return WeteeOrg(_i10.Event.codec.decode(input));
  }

  /// wetee_org::Event<Runtime>
  final _i10.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'WeteeOrg': value0.toJson()};

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
      other is WeteeOrg && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeAsset extends RuntimeEvent {
  const WeteeAsset(this.value0);

  factory WeteeAsset._decode(_i1.Input input) {
    return WeteeAsset(_i11.Event.codec.decode(input));
  }

  /// wetee_assets::Event<Runtime>
  final _i11.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'WeteeAsset': value0.toJson()};

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
      other is WeteeAsset && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeSudo extends RuntimeEvent {
  const WeteeSudo(this.value0);

  factory WeteeSudo._decode(_i1.Input input) {
    return WeteeSudo(_i12.Event.codec.decode(input));
  }

  /// wetee_sudo::Event<Runtime>
  final _i12.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeSudo': value0.toJson()};

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
      other is WeteeSudo && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeGuild extends RuntimeEvent {
  const WeteeGuild(this.value0);

  factory WeteeGuild._decode(_i1.Input input) {
    return WeteeGuild(_i13.Event.codec.decode(input));
  }

  /// wetee_guild::Event<Runtime>
  final _i13.Event value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'WeteeGuild': value0.toJson()};

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
      other is WeteeGuild && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeProject extends RuntimeEvent {
  const WeteeProject(this.value0);

  factory WeteeProject._decode(_i1.Input input) {
    return WeteeProject(_i14.Event.codec.decode(input));
  }

  /// wetee_project::Event<Runtime>
  final _i14.Event value0;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() =>
      {'WeteeProject': value0.toJson()};

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
      other is WeteeProject && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeGov extends RuntimeEvent {
  const WeteeGov(this.value0);

  factory WeteeGov._decode(_i1.Input input) {
    return WeteeGov(_i15.Event.codec.decode(input));
  }

  /// wetee_gov::Event<Runtime>
  final _i15.Event value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'WeteeGov': value0.toJson()};

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
      other is WeteeGov && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeTreasury extends RuntimeEvent {
  const WeteeTreasury(this.value0);

  factory WeteeTreasury._decode(_i1.Input input) {
    return WeteeTreasury(_i16.Event.codec.decode(input));
  }

  /// wetee_treasury::Event<Runtime>
  final _i16.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeTreasury': value0.toJson()};

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
      other is WeteeTreasury && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeApp extends RuntimeEvent {
  const WeteeApp(this.value0);

  factory WeteeApp._decode(_i1.Input input) {
    return WeteeApp(_i17.Event.codec.decode(input));
  }

  /// wetee_app::Event<Runtime>
  final _i17.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeApp': value0.toJson()};

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
      other is WeteeApp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeTask extends RuntimeEvent {
  const WeteeTask(this.value0);

  factory WeteeTask._decode(_i1.Input input) {
    return WeteeTask(_i18.Event.codec.decode(input));
  }

  /// wetee_task::Event<Runtime>
  final _i18.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeTask': value0.toJson()};

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
      other is WeteeTask && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class WeteeWorker extends RuntimeEvent {
  const WeteeWorker(this.value0);

  factory WeteeWorker._decode(_i1.Input input) {
    return WeteeWorker(_i19.Event.codec.decode(input));
  }

  /// wetee_worker::Event<Runtime>
  final _i19.Event value0;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() =>
      {'WeteeWorker': value0.toJson()};

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
      other is WeteeWorker && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

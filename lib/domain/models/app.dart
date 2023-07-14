import 'package:hive/hive.dart';

@HiveType(typeId: 5)
class App {
  // 应用hash
  @HiveField(2)
  String hash = "";

  // 应用类型
  // 0 => web3
  // 1 => web2
  // 2 => tee
  @HiveField(3)
  int type = 0;

  // 应用地址
  @HiveField(4)
  String? url;

  // 应用名
  @HiveField(5)
  String? name;

  // 应用
  @HiveField(6)
  String? desc;

  // 应用图标
  @HiveField(8)
  String? icon;

  App({
    required this.hash,
    required this.type,
    this.url,
    this.name,
    this.desc,
    this.icon,
  });
}
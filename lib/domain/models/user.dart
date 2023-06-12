import 'package:hive/hive.dart';

import 'account.dart';

@HiveType(typeId: 7)
class User {
  // 用户地址
  @HiveField(1)
  late String name;

  // 用户地址
  @HiveField(2)
  late String address;

  // 团队授权网址，数据须常从区块链获取
  @HiveField(3)
  late String domain;

  // 用户状态 -1=》 未加好友  1=》好友  2=》特别关注 3=》删除 4=》加入黑名单
  @HiveField(4)
  late int status;

  // 头像
  @HiveField(5)
  String? avatar;

  // 所属用户
  @HiveField(6)
  late final Account account;
}

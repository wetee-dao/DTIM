import 'package:asyou_app/models/account.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;

  // 用户地址
  late String name;

  // 用户地址
  late String address;

  // 团队授权网址，数据须常从区块链获取
  late String domain;

  // 用户状态 -1=》 未加好友  1=》好友  2=》特别关注 3=》删除 4=》加入黑名单
  late int status;

  // 头像
  String? avatar;

  // 所属用户
  final account = ToOne<Account>();
}

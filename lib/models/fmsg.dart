import 'package:objectbox/objectbox.dart';
import './user.dart';

@Entity()
class DirectMsg {
  // DirectMsg(int userId, int friendId, String body) {
  //   userId = userId;
  //   friendId = friendId;
  //   body = body;
  // }

  @Id()
  int id = 0;

  // 用户id
  late int userId;

  // 用户的朋友id
  late int friendId;

  // 消息体
  String? body;

  // 发送者
  final from = ToOne<User>();

  // 创建时间
  @Property(type: PropertyType.date)
  DateTime? createdAt;
}

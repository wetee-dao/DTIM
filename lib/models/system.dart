import 'package:objectbox/objectbox.dart';

@Entity()
class System {
  @Id()
  int id = 0;

  // 宽度
  late double width;

  // 高度
  late double height;

  System({this.id = 0, required this.width, required this.height});
}

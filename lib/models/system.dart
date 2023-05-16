
import 'package:hive/hive.dart';

part 'system.g.dart';

@HiveType(typeId: 6)
class System {
  // 宽度
  @HiveField(1)
  late double width;

  // 高度
  @HiveField(2)
  late double height;

  // 主题
  @HiveField(3)
  late String theme;

  System({ required this.width, required this.height, required this.theme});
}

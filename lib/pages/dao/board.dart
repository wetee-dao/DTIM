import 'package:flutter/material.dart';
import '../../store/theme.dart';

class Kanban extends StatefulWidget {
  @override
  _KanbanState createState() => _KanbanState();
}

class _KanbanState extends State<Kanban> {
  List<String> list1 = ["list1_1", "list1_2", "list1_3"];
  List<String> list2 = ["list2_1", "list2_2"];
  List<String> list3 = ["list3_1", "list3_2"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          _createListView(list1),
          _createListView(list2),
          _createListView(list3),
        ],
      ),
    );
  }

  Widget _createListView(List<String> _items) {
    return SizedBox(
      width: 200,
      height: double.maxFinite,
      child: DragTarget<String>(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return ListView.builder(
            itemCount: _items.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Draggable<String>(
                onDragCompleted: () {
                  // 在拖动到DragTarget后删除数据
                  setState(() {
                    _items.removeAt(index);
                  });
                },
                feedback: Material(
                  child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: Text(
                      _items[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                data: _items[index],
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Text(
                    _items[index],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            },
          );
        },
        onAccept: (String data) {
          setState(() {
            // 添加Draggable数据到list
            _items.add(data);
          });
        },
      ),
    );
  }
}

class Item {
  final String title;
  final bool isDraggable;

  Item({required this.title, required this.isDraggable});
}

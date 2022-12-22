import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:asyou_app/utils/functions.dart';
import 'package:asyou_app/components/search_element.dart';
import 'package:asyou_app/components/user_avatar.dart';

class YouPage extends StatefulWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  State<YouPage> createState() => _YouPageState();
}

class _YouPageState extends State<YouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "4B144A".toColor(),
        title: const Text(
          'You',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          ListTile(
              leading: UserAvatar(
                key: const Key("user_"),
                "xxx",
                true,
                40.w,
              ),
              title: Text(
                "youData.name",
                style: TextStyle(fontSize: 21.w, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                'Active',
                style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
            child: TextField(
              onTap: () {},
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.tag_faces,
                  color: Colors.grey,
                  size: 27.w,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.w),
                  ),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.w),
                ),
                hintText: 'What\'s your status?',
                hintStyle: TextStyle(
                  height: 1,
                  fontSize: 18.w,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          WidgetSearchElement(Icons.notifications_off_outlined, 'Pause notification', Icons.access_time, '  '),
          WidgetSearchElement(Icons.highlight_off, 'Set yourself is away', Icons.access_time, '  '),
          Divider(
            color: Colors.grey,
            height: 20.w,
          ),
          WidgetSearchElement(Icons.bookmark_border, 'Saved items', Icons.access_time, '  '),
          WidgetSearchElement(Icons.person, 'View profile', Icons.access_time, '  '),
          WidgetSearchElement(Icons.phonelink, 'Notification', Icons.access_time, '  '),
          WidgetSearchElement(Icons.settings, 'Preference', Icons.access_time, '  '),
        ],
      ),
    );
  }
}

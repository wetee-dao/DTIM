import 'package:flutter/material.dart';

import '../store/theme.dart';
import '../utils/screen.dart';
import '../utils/functions.dart';
import '../components/jump_to.dart';
import '../components/user_avatar.dart';
import './search.dart';

class DirectMessagePage extends StatefulWidget {
  const DirectMessagePage({Key? key}) : super(key: key);

  @override
  State<DirectMessagePage> createState() => _DirectMessagePageState();
}

class _DirectMessagePageState extends State<DirectMessagePage> {
  List userList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstTheme.centerChannelBg,
        automaticallyImplyLeading: false,
        title: const Text(
          'Direct Messages',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            JumpTo(false, MediaQuery.of(context).size.width - 40, () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            }),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: UserAvatar(
                    userList[index].avatarSrc,
                    userList[index].online,
                    40,
                  ),
                  title: Text(
                    userList[index].name,
                    style: TextStyle(
                      fontSize: 17.w,
                    ),
                  ),
                  subtitle: (userList[index].userMessage.message != null)
                      ? Text(userList[index].userMessage.message!)
                      : const Text(''),
                  trailing: Text(
                    userList[index].userMessage.timeAgo,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: "4B144A".toColor(),
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}

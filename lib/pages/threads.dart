import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';

class ThreadsPage extends StatefulWidget {
  const ThreadsPage({Key? key}) : super(key: key);

  @override
  State<ThreadsPage> createState() => _ThreadsPageState();
}

class _ThreadsPageState extends State<ThreadsPage> {
  List userList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Threads',
          style: TextStyle(color: Colors.black, fontSize: 18.w, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: Text(
                '#support_channel',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5),
              child: Row(
                children: [
                  Text(
                    'Bob, ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Jack ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'and 3 other',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: userList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        userList[index].avatarSrc,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                          text: userList[index].name + '  ',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                          children: [
                            TextSpan(
                                text: userList[index].userMessage.timeAgo,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ))
                          ]),
                    ),
                    subtitle: RichText(
                      text: (userList[index].userMessage.addUser != null)
                          ? TextSpan(
                              text: '${userList[index].userMessage.addUser} ',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                              children: [
                                TextSpan(
                                  text: userList[index].userMessage.message,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                (userList[index].userMessage.imgSrc != null)
                                    ? WidgetSpan(
                                        child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network(
                                                userList[index].userMessage.imgSrc!,
                                                width: MediaQuery.of(context).size.width * 0.7,
                                              ),
                                            )))
                                    : WidgetSpan(child: SizedBox()),
                              ],
                            )
                          : TextSpan(
                              text: userList[index].userMessage.message,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                              children: [
                                (userList[index].userMessage.imgSrc != null)
                                    ? WidgetSpan(
                                        child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network(
                                                userList[index].userMessage.imgSrc!,
                                                width: MediaQuery.of(context).size.width * 0.7,
                                              ),
                                            )))
                                    : WidgetSpan(child: SizedBox()),
                              ],
                            ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

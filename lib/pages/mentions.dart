import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:asyou_app/utils/functions.dart';
import 'package:asyou_app/components/mentions_card.dart';

class MentionsPage extends StatefulWidget {
  const MentionsPage({Key? key}) : super(key: key);

  @override
  State<MentionsPage> createState() => _MentionsPageState();
}

class _MentionsPageState extends State<MentionsPage> {
  List mentionsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: "4B144A".toColor(),
        automaticallyImplyLeading: false,
        title: Text(
          'Mentions & Reactions',
          style: TextStyle(
            fontSize: 22.w,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15.w),
              ListView.builder(
                  itemCount: mentionsList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MentionCard(mentionsList[index], index);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

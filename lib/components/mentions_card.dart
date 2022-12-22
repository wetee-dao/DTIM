import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:asyou_app/models/mentions_model.dart';
import 'package:asyou_app/components/user_avatar.dart';

// ignore: non_constant_identifier_names
MentionCard(MentionModel mentionElement, int index) {
  var parser = EmojiParser();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: mentionElement.user.name,
                style: const TextStyle(color: Colors.black54),
                children: [
                  TextSpan(
                    text: ' reacted ',
                  ),
                  TextSpan(
                    text: 'you in ',
                  ),
                  TextSpan(
                    text: '#day_channel',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Text(
              "1s",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      ListTile(
        leading: UserAvatar(
          key: const Key("user_"),
          "xxx",
          true,
          40.w,
        ),
        title: Text(
          mentionElement.user.name,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: 'xxx\n\n',
            style: TextStyle(color: Colors.black87),
            children: [
              (mentionElement.emoji == null)
                  ? WidgetSpan(child: SizedBox())
                  : WidgetSpan(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: parser.emojify(mentionElement.emoji!).toString(),
                            style: TextStyle(
                              fontSize: 19,
                            ),
                            children: [
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(0.0, -2.0),
                                  child: Text(' ' + (index + 1).toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                        width: 50,
                        height: 30,
                      ),
                    )
            ],
          ),
        ),
      ),
      Divider(height: 15),
    ],
  );
  ;
}

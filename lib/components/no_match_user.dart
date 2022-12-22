import 'package:flutter/material.dart';

WidgetNoMatchUser(double avatarWidth, double avatarHeight) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: avatarWidth,
          height: avatarHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'No matches found. Try an email?',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

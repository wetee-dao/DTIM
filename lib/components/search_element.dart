import 'package:flutter/material.dart';

WidgetSearchElement(IconData iconFirst, String nameElement, IconData iconSecond, String textSecond) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Icon(
                iconFirst,
                color: Colors.black54,
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                nameElement,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              (iconSecond != null && textSecond.length < 1)
                  ? Icon(
                      iconSecond,
                      size: 19,
                    )
                  : SizedBox(
                      width: 0,
                    ),
              (textSecond != null && textSecond.length > 0)
                  ? Text(
                      textSecond,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19,
                      ),
                    )
                  : SizedBox(
                      width: 0,
                    ),
            ],
          ),
        ),
      ],
    ),
  );
}

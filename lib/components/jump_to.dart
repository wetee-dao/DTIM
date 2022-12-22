import 'package:asyou_app/components/move_window.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';

import '../store/theme.dart';

// ignore: non_constant_identifier_names
JumpTo(
  bool autofocus,
  double widthInput,
  Function? Function() toFunc,
) {
  return moveWindow(Container(
    height: 40.w,
    width: widthInput,
    margin: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      color: ConstTheme.sidebarText.withOpacity(0.1),
      borderRadius: BorderRadius.all(Radius.circular(5.w)),
    ),
    alignment: Alignment.center,
    child: TextField(
      onTap: toFunc,
      style: TextStyle(color: ConstTheme.sidebarText.withAlpha(155), fontSize: 13.w),
      autofocus: autofocus,
      keyboardType: autofocus ? TextInputType.text : TextInputType.none,
      decoration: InputDecoration(
        hintText: '查找频道',
        hintStyle: TextStyle(
          height: 1,
          color: ConstTheme.sidebarText.withAlpha(155),
        ),
        prefixIcon: Icon(Icons.search, size: 20.w, color: ConstTheme.sidebarText.withAlpha(155)),
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        label: null,
      ),
    ),
  ));
}

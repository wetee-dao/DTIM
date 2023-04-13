import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';
import '../../utils/screen.dart';

class SelectFormField<T> extends FormField<T> {
  SelectFormField({
    Key? key,
    T? initialValue,
    List<PopupMenuItem<T>> options = const [],
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    AutovalidateMode? autovalidateMode,
    InputDecoration? decoration,
  }) : super(
          key: key,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (state) {
            final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
            return InputDecorator(
              decoration: decoration ??
                  InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      fontSize: 14.w,
                      color: constTheme.centerChannelColor,
                    ),
                  ),
              child: PopupMenuButton<T>(
                initialValue: state.value,
                color: constTheme.centerChannelBg,
                onSelected: (v) => state.didChange(v),
                itemBuilder: (BuildContext context) => options,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60.w,
                      child: Text(
                        decoration!.hintText ?? "",
                        style: decoration.hintStyle,
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 10.w,
                      color: constTheme.centerChannelColor,
                    ),
                    SizedBox(width: 10.w),
                    options.firstWhere((o) => o.value == state.value).child ?? const Text("")
                  ],
                ),
              ),
            );
          },
        );
}

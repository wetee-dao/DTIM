import 'package:asyou_app/router.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';
import '../../utils/screen.dart';

class MutiSelectFormField<T> extends FormField<List<T>> {
  MutiSelectFormField({
    Key? key,
    List<T>? initialValue,
    List<C2Choice<T>> options = const [],
    FormFieldSetter<List<T>>? onSaved,
    FormFieldValidator<List<T>>? validator,
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
                  Expanded(
                    child: ChipsChoice<T>.multiple(
                      value: state.value ?? [],
                      onChanged: (val) => state.didChange(val),
                      choiceItems: options,
                      choiceStyle: C2ChipStyle.filled(padding: EdgeInsets.zero, height: 18.w),
                      wrapped: true,
                    ),
                  ),
                ],
              ),
            );
          },
        );
}

import 'package:dtim/router.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';

class MutiSelectFormField<T> extends FormField<List<T>> {
  MutiSelectFormField({
    Key? key,
    List<T>? initialValue,
    List<C2Choice<T>> options = const [],
    FormFieldSetter<List<T>>? onSaved,
    FormFieldValidator<List<T>>? validator,
    AutovalidateMode? autovalidateMode,
    InputDecoration? decoration,
    required Widget prefixIcon,
  }) : super(
          key: key,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (state) {
            final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
            if (decoration != null) {
              decoration = decoration!.copyWith(contentPadding: EdgeInsets.zero);
            }

            return InputDecorator(
              decoration: decoration ??
                  InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      fontSize: 14.w,
                      color: constTheme.centerChannelColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, top: 12.w, right: 9.w),
                        child: prefixIcon,
                      ),
                      Container(
                        width: 59.w,
                        margin: EdgeInsets.only(top: 11.w),
                        child: Text(
                          decoration!.hintText ?? "",
                          style: decoration!.hintStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.maxFinite,
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

import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';
import '../../utils/screen/screen.dart';

class SwitchFormField extends FormField<bool> {
  SwitchFormField({
    Key? key,
    bool? initialValue,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    AutovalidateMode? autovalidateMode,
    InputDecoration? decoration,
  }) : super(
          key: key,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue ?? false,
          builder: (state) {
            final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
            void onSwitchChanged(bool value) {
              state.didChange(value);
            }

            decoration = decoration ??
                InputDecoration(
                  hintText: '',
                  hintStyle: TextStyle(
                    fontSize: 14.w,
                    color: constTheme.centerChannelColor,
                  ),
                );
            return InputDecorator(
              decoration: decoration!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    decoration!.hintText ?? "",
                    style: decoration!.hintStyle,
                  ),
                  SizedBox(width: 20.w),
                  Switch(
                    activeColor: constTheme.sidebarTextActiveBorder,
                    onChanged: onSwitchChanged,
                    value: state.value ?? false,
                  ),
                ],
              ),
            );
          },
        );
  // @override
  // _SwitchFormField createState() => _SwitchFormFieldState();
}

// class _SwitchFormFieldState extends FormFieldState<bool> {
//   @override
//   SwitchFormField get widget => super.widget as SwitchFormField;
//   bool switchOn = false;

//   void _onSwitchChanged(bool value) {
//     switchOn = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Switch(
//       onChanged: _onSwitchChanged,
//       value: switchOn,
//     );
//   }
// }

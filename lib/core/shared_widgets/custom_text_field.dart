import 'package:flutter/material.dart';
import 'package:flutter_ebutler_task/core/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onChangedText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String> validator;
  final Widget? prefixIcon;
  TextInputAction? textInputAction;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormField<String?>(
          validator: (String? value) {
            print('vv => $value');
            final String? valid = validator(value);

            return valid;

            return null;
          },
          builder: (field) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.width,
                height:  43.h,
                child: TextFormField(
                  textInputAction: textInputAction,
                  onChanged: (String value) {
                    field.setValue(value);
                    field.validate();

                    onChangedText!.call(value);
                  },
                  onFieldSubmitted: onFieldSubmitted,
                  controller: controller,
                  keyboardType: textInputType,
                  style: const TextStyle(decoration: TextDecoration.none),
                  cursorColor: AppColors.blueColor,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: hintText,
                    prefixIcon: prefixIcon,
                    fillColor: Colors.red,
                    border: InputBorder.none,
                    contentPadding: contentPadding ?? EdgeInsets.zero,
                    focusedBorder: inputBorder(
                        borderColor: field.hasError
                            ? Colors.red
                            : AppColors.borderColor),
                    enabledBorder: inputBorder(
                        borderColor: field.hasError
                            ? Colors.red
                            : AppColors.borderColor),
                    errorBorder: inputBorder(
                        borderColor: field.hasError
                            ? Colors.red
                            : AppColors.borderColor),
                    disabledBorder: inputBorder(
                        borderColor: field.hasError
                            ? Colors.red
                            : AppColors.borderColor),
                    focusedErrorBorder: inputBorder(
                        borderColor: field.hasError
                            ? Colors.red
                            : AppColors.borderColor),
                  ),
                ),
              ),
              if (validator != null)
                (field.hasError)
                    ? Text(
                        '${field.errorText}',
                        style: TextStyle(
                          fontSize: 10.h,
                          height: 0.6,
                          color: Colors.red.shade800,
                        ),
                      ).addPaddingOnly(right: 0, top: 10)
                    : const SizedBox(
                        height: 0,
                      ),
            ],
          ),
        )
      ],
    );
  }

  InputBorder inputBorder({Color? borderColor, double? borderRadius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: borderColor!,
          width: 1.0,
        ),
      );

  CustomTextField(
      {@required this.textInputType,
      this.controller,
      this.height,
      required this.validator,
      this.onFieldSubmitted,
      this.contentPadding,
      this.obscurePasswordNotifier,
      this.backGroundColor,
      this.textInputAction,
      this.prefixIcon,
      this.initialValue,
      this.hintText,
      this.onChangedText});
}

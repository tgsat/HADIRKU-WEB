import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hadirku_web/utils/value/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final IconData? prefixIcon, suffixIcon;
  final bool isObscure, expands, readOnly, isDense, isLines;
  final dynamic validate;
  final Widget? suffixIconWidget;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter> inputFormatters;
  final Function()? onTap;
  const CustomTextFormField({
    super.key,
    this.title,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscure = false,
    this.expands = false,
    this.isDense = false,
    this.readOnly = false,
    this.isLines = false,
    this.suffixIconWidget,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.validate,
    this.inputFormatters = const [],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        expands: expands,
        enabled: (readOnly == true) ? false : true,
        readOnly: readOnly,
        obscureText: isObscure,
        controller: controller,
        minLines: isLines ? 4 : 1,
        maxLines: isLines ? null : 1,
        validator: (validate != null) ? validate : null,
        keyboardType: (textInputType != null) ? textInputType : null,
        textCapitalization: textCapitalization,
        autovalidateMode: (autovalidateMode != null) ? autovalidateMode : null,
        inputFormatters: inputFormatters,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          isDense: isDense,
          filled: (readOnly == true) ? true : false,
          fillColor:
              (readOnly == true) ? AppColor.disable.withOpacity(0.8) : null,
          hintText: (title == "") ? "" : title,
          contentPadding:
              EdgeInsets.symmetric(vertical: isLines ? 15 : 2, horizontal: 10),
          prefixIcon: (prefixIcon != null)
              ? Icon(prefixIcon, color: Colors.black54)
              : null,
          suffixIcon: (suffixIconWidget != null)
              ? suffixIconWidget
              : (suffixIcon != null)
                  ? Icon(suffixIcon, color: Colors.black54)
                  : null,
        ),
      ),
    );
  }
}

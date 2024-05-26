import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final IconData? prefixIcon, suffixIcon;
  final bool isObscure, expands, readOnly;
  final int maxLines;
  final int? maxLength;
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
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
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
        maxLines: maxLines,
        maxLength: (maxLength != null) ? maxLength : null,
        validator: (validate != null) ? validate : null,
        keyboardType: (textInputType != null) ? textInputType : null,
        textCapitalization: textCapitalization,
        autovalidateMode: (autovalidateMode != null) ? autovalidateMode : null,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: (title == "") ? "" : title,
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

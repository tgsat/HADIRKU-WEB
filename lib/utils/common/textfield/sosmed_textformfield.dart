import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hadirku_web/utils/utils.dart';

class SosmedTextFormField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final bool expands, isDense;
  final dynamic validate;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter> inputFormatters;
  const SosmedTextFormField({
    super.key,
    this.title,
    this.controller,
    this.expands = false,
    this.isDense = false,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.validate,
    this.inputFormatters = const [],
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands,
      controller: controller,
      validator: (validate != null) ? validate : null,
      keyboardType: (textInputType != null) ? textInputType : null,
      textCapitalization: textCapitalization,
      autovalidateMode: (autovalidateMode != null) ? autovalidateMode : null,
      inputFormatters: inputFormatters,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        isDense: isDense,
        hintText: (title == "") ? "" : title,
        border: const OutlineInputBorder().copyWith(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(SizeConfig.sm),
              bottomRight: Radius.circular(SizeConfig.sm)),
          borderSide: const BorderSide(width: 1, color: AppColor.grey),
        ),
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(SizeConfig.sm),
              bottomRight: Radius.circular(SizeConfig.sm)),
          borderSide: const BorderSide(width: 1, color: AppColor.grey),
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(SizeConfig.sm),
              bottomRight: Radius.circular(SizeConfig.sm)),
          borderSide: const BorderSide(width: 1, color: AppColor.dark),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BorderedTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged? onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool redUnderline;
  final Widget? prefix;
  final bool obscureText;
  final int? maxLength;
  final bool? enabled;
  final int? maxline;
  final Color? hintColor;
  final String? initialValue;
  final bool? isFromEdit;
  final Function(String)? onFieldSubmitted;
  final bool? isInputFormatterNeeded;
  final FocusNode? focusNode;
  BorderedTextFormField(
      {required this.hintText,
      this.controller,
      this.validator,
      this.onChange,
      this.keyboardType,
      this.textInputAction,
      this.prefix,
      this.maxLength,
      this.redUnderline = false,
      this.obscureText = false,
      this.enabled = true,
      Key? key,
      this.maxline = 1,
      this.isFromEdit = false,
      this.initialValue,
      this.hintColor,
      this.onFieldSubmitted,
      this.isInputFormatterNeeded,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      focusNode: focusNode,
      style: isFromEdit!
          ? Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: redUnderline ? 16 : 13,
              fontWeight: redUnderline ? FontWeight.w700 : FontWeight.w500,
              color: redUnderline ? const Color(0xffBE352D) : null,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: redUnderline
                  ? const Color(0xffBE352D)
                  : const Color(0XFF868892),
              decorationThickness: 2)
          : Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.black, fontSize: 14),
      enabled: enabled,
      maxLines: maxline,
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: prefix,
          fillColor: Colors.transparent,
          focusedBorder: fieldBorder,
          enabledBorder: fieldBorder,
          errorBorder: fieldBorder,
          disabledBorder: fieldBorder,
          border: fieldBorder,
          focusedErrorBorder: fieldBorder,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: hintColor ?? Colors.black.withOpacity(0.32),
              fontSize: 13,
              fontWeight: FontWeight.normal),
          counterText: ""),
    );
  }

  // OutlineInputBorder fieldBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(4),
  //   borderSide: const BorderSide(width: 0, color: Color(0XFFF5F5F5)),
  // );
  InputBorder fieldBorder = InputBorder.none;
}

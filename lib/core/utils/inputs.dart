import 'package:flutter/material.dart';

import 'font.dart';

class AppInputDecoration {
  static InputDecoration defaultInput({
    String? hintText,
    String? labelText,
    EdgeInsets? contentPadding,
    Widget? prefix,
    Widget? prefixIcon,
    Widget? suffix,
    TextStyle? hintStyle,
    InputBorder? border,
    Color? fillColor,
    bool? filled,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    TextStyle? labelStyle,
    double? radius,
    BoxConstraints? constraints,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle,
      labelText: labelText,
      labelStyle: labelStyle,
      prefix: prefix,
      prefixIcon: prefixIcon,
      suffix: suffix,
      constraints: constraints,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      fillColor: fillColor,
      filled: filled,
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputBorder,
            ),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
          ),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
          ),
      border: border ??
          OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputBorder,
            ),
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
          ),
    );
  }

  static InputDecoration passwordInput({
    String? hintText,
  }) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.inputBorder,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

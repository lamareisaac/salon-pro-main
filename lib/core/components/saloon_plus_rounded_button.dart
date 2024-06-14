import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../utils/font.dart';

class SaloonPlusRoundedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final Function() onPressed;
  final Widget? child;

  const SaloonPlusRoundedButton({
    super.key,
    this.backgroundColor,
    this.iconColor,
    required this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? AppColors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: child ??
          Icon(
            LucideIcons.plus,
            color: iconColor ?? AppColors.white,
            size: 35,
          ),
    );
  }
}

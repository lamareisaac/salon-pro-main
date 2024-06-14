import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../utils/font.dart';

class SaloonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Icon? icon;
  final Widget? child;
  final IconData? actionIcon;
  final List<Widget>? actions;
  final Function? actionCallback;
  final Widget? leading;
  final double? leadingWidth;

  const SaloonAppBar({
    super.key,
    this.backgroundColor,
    this.icon,
    this.child,
    this.actionIcon,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.actionCallback,
  }) : assert(actionIcon == null || actions == null,
            'Both actionIcon and actions cannot be defined simultaneously.');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.white,
      leadingWidth: leadingWidth,
      leading: leading ??
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: icon ??
                Icon(
                  LucideIcons.x,
                  color: AppColors.black,
                ),
          ),
      title: child,
      actions: actions ??
          (actionIcon != null
              ? [
                  IconButton(
                    onPressed: () {
                      if (actionCallback != null) {
                        actionCallback!();
                      }
                    },
                    icon: Icon(
                      actionIcon,
                    ),
                  )
                ]
              : null),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(30.0);
}

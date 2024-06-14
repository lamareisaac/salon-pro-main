import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/font.dart';

class SettingPageListItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final AssetImage? background;
  final double iconSize;
  final EdgeInsets padding;
  final Function? onTap;

  const SettingPageListItem({
    super.key,
    required this.icon,
    required this.title,
    this.background,
    this.iconSize = 35,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: padding,
        height: 60,
        decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                width: 1,
                color: AppColors.settingListItemBorderColor,
              ),
            ),
            image: background != null
                ? DecorationImage(image: background!)
                : null),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: iconSize, width: iconSize, child: icon),
            const SizedBox(width: 20),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

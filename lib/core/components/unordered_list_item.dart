import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';

import '../utils/font.dart';
import 'my_text.dart';

class UnorderedListItem extends StatelessWidget {
  final String line;
  const UnorderedListItem(this.line, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(color: AppColors.black),
          ),
          MySpacing.width(8),
          MyText.labelLarge(
            line,
            style: GoogleFonts.manrope(fontSize: 14),
          )
        ],
      ),
    );
  }
}

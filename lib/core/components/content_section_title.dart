import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/font.dart';
import 'my_spacing.dart';
import 'my_text.dart';

class ContentSectionTitle extends StatelessWidget {
  final String title;
  const ContentSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    BorderSide borderSide = BorderSide(width: 1, color: AppColors.lightGrey);
    return Container(
      padding: MySpacing.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withAlpha(80),
        border: Border(bottom: borderSide, top: borderSide),
      ),
      child: Row(
        children: [
          MyText.titleLarge(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

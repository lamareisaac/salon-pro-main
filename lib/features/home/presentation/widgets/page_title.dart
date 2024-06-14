import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/font.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: Text(
        title,
        style: GoogleFonts.aBeeZee(
          color: AppColors.black,
          fontSize: 40,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

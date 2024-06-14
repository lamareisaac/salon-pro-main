import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/font.dart';
import '../utils/navigation_helper.dart';

void showQuickServiceDialog(BuildContext context,
    {required String title, Function? onIgnore, Function? onStart}) {
  showDialog(
    barrierColor: AppColors.black.withAlpha(100),
    context: context,
    builder: (_) {
      return QuickServiceDialog(
        title: title,
        onIgnore: onIgnore,
        onStart: onStart,
      );
    },
  );
}

class QuickServiceDialog extends StatelessWidget {
  final String title;
  final Function? onIgnore;
  final Function? onStart;
  const QuickServiceDialog({
    super.key,
    required this.title,
    this.onIgnore,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 24, right: 24),
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.6),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service rapide',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (onIgnore != null) {
                      onIgnore!();
                    }
                    popNavigation(context);
                  },
                  child: Text(
                    'Ignorer',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkRed),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.quickService,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () {
                  if (onStart != null) {
                    onStart!();
                  }
                },
                child: Text(
                  'Cliquez pour commencer',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

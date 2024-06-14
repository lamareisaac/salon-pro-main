import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';

import '../utils/font.dart';
import 'my_text.dart';

class PriceDiscountOffer extends StatelessWidget {
  final bool initialValue;
  final ValueChanged<bool?> onChanged;
  const PriceDiscountOffer(
      {super.key, this.initialValue = false, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MySpacing.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.labelMedium(
                  "Obtenez des réservation plus rapidement",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MyText.labelSmall(
                  "Offrez 15% de réduction sur les 2 premières réservations d’une semaine et plus.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: MySpacing.only(top: 16),
            height: 30,
            width: 30,
            child: Checkbox(
              side: BorderSide(
                width: 0.5,
                color: AppColors.black,
              ),
              value: initialValue,
              onChanged: (v) {
                onChanged(v);
              },
            ),
          )
        ],
      ),
    );
  }
}

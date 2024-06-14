import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../../../core/utils/font.dart';

class CurrentBalanceWidget extends StatelessWidget {
  final double balance;
  final Function()? onWithdraw;

  const CurrentBalanceWidget(
      {super.key, required this.balance, this.onWithdraw});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 183,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset("assets/images/icons/ion_wallet.png"),
          ),
          Container(
            padding: MySpacing.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MySpacing.height(8),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MySpacing.height(8),
                            MyText.titleMedium(
                              'Solde actuel',
                              style: GoogleFonts.manrope(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            MyText.headlineMedium(
                              '\$${balance.toInt()}',
                              style: GoogleFonts.manrope(
                                fontSize: 45,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Icon(
                          LucideIcons.dollarSign,
                          color: AppColors.black,
                          size: 18,
                        ),
                      ),
                      MySpacing.width(8),
                      MyText.labelSmall(
                        'Retirer mes revenus'.toUpperCase(),
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      MySpacing.width(8),
                      Icon(
                        LucideIcons.chevronRight,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

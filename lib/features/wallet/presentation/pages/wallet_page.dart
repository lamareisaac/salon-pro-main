import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';

import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../../../core/utils/font.dart';
import '../widgets/current_balance_widget.dart';
import 'commissions_page.dart';
import 'statements_page.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: MySpacing.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySpacing.height(16),
                Padding(
                  padding: MySpacing.left(16),
                  child: MyText.titleLarge('Portefeuille'),
                ),
                MySpacing.height(16),
                const CurrentBalanceWidget(balance: 1000),
                MySpacing.height(16),
                Container(
                  padding: MySpacing.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WalletBalance(
                        label: MyText.titleMedium(
                          'Cette semaine',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        amount: MyText.headlineMedium(
                          '2850,45 \$',
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: AppColors.walletWeekAmountColor,
                          ),
                        ),
                      ),
                      MySpacing.height(32),
                      WalletFeatureItem(
                        label: 'Relevés principaux',
                        iconLink: "assets/images/icons/Purchase_Order.png",
                        onTap: () {
                          pushNavigation(context, const StatementsPage());
                        },
                      ),
                      MySpacing.height(8),
                      WalletFeatureItem(
                        label: "Commissions",
                        iconLink: "assets/images/icons/Crowdfunding.png",
                        onTap: () {
                          pushNavigation(context, const CommisionsPage());
                        },
                      ),
                      MySpacing.height(8),
                      WalletFeatureItem(
                        label: "Dépôt",
                        iconLink: "assets/images/icons/Sales_Performance.png",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WalletBalance extends StatelessWidget {
  final Widget label;
  final Widget amount;

  const WalletBalance({
    super.key,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [MySpacing.height(8), label, amount],
      ),
    );
  }
}

class WalletFeatureItem extends StatelessWidget {
  final String label;
  final double iconSize;
  final String? iconLink;
  final Function onTap;

  const WalletFeatureItem(
      {super.key,
      required this.label,
      required this.onTap,
      this.iconLink,
      this.iconSize = 42});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      contentPadding: MySpacing.symmetric(horizontal: 0),
      leading: iconLink != null
          ? Image.asset(
              '$iconLink',
              width: iconSize,
              height: iconSize,
            )
          : Icon(
              LucideIcons.activitySquare,
              size: iconSize,
              color: AppColors.black,
            ),
      title: MyText.titleLarge(
        label,
        style: GoogleFonts.poppins(fontSize: 18, color: AppColors.black),
      ),
    );
  }
}

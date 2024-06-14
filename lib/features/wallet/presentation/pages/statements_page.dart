import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_button.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';

import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../../../core/components/saloon_app_bar.dart';
import '../../../../core/utils/font.dart';
import '../../data/models/main_statement_item_model.dart';
import 'detailed_statement_page.dart';
import 'wallet_page.dart';

class StatementsPage extends StatefulWidget {
  const StatementsPage({super.key});

  @override
  State<StatementsPage> createState() => _StatementsPageState();
}

class _StatementsPageState extends State<StatementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.appBarTitle('Relevés'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: MySpacing.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///TODO: Design dropdown selecteur saloon ou Staff
              ///TODO: Intégration calendrier semaine
              MySpacing.height(16),
              Divider(
                thickness: 1,
                color: AppColors.saloonGreyBorder,
              ),
              WalletBalance(
                label: MyText.titleMedium(
                  "Revenu total",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                amount: MyText.titleLarge(
                  "3 299.61\$",
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF49A064),
                  ),
                ),
              ),
              MySpacing.height(24),
              ...MainStatementItemModel.generates()
                  .map((item) => MainStatementItem(
                        label: item.title,
                        price: item.price,
                      )),
              MySpacing.height(24),
              SaloonButton(
                label: "Voir relevé détaillé".toUpperCase(),
                onPressed: () {
                  pushNavigation(context, const DetailedStatementPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainStatementItem extends StatelessWidget {
  final String label;
  final double price;
  final EdgeInsets? padding;
  const MainStatementItem({
    super.key,
    required this.label,
    required this.price,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? MySpacing.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText.labelLarge(
            label,
            style: GoogleFonts.dmSans(fontSize: 14),
          ),
          MyText.labelLarge(
            "$price \$",
            style:
                GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

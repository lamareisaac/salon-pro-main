import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_button.dart';

import '../utils/font.dart';
import 'my_spacing.dart';
import 'my_text.dart';

class SaloonPriceTextField extends StatefulWidget {
  final String period;
  final EdgeInsets? padding;
  const SaloonPriceTextField({
    super.key,
    this.period = "jour",
    this.padding,
  });

  @override
  State<SaloonPriceTextField> createState() => _SaloonPriceTextFieldState();
}

class _SaloonPriceTextFieldState extends State<SaloonPriceTextField> {
  double price = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      padding: widget.padding ?? MySpacing.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.saloonPriceTextfieldColor.withOpacity(0.26),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SaloonElevatedButton(
                onPressed: () {
                  if (price == 0) return;
                  setState(() {
                    price -= 1;
                  });
                },
                minWidth: 39,
                height: 38,
                padding: MySpacing.zero,
                radius: 39,
                backgroundColor: AppColors.white,
                child: const Icon(
                  LucideIcons.minus,
                  size: 38,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      MyText.headlineMedium(
                        "\$${price.toInt()}",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SaloonElevatedButton(
                onPressed: () {
                  setState(() {
                    price += 1;
                  });
                },
                minWidth: 39,
                height: 38,
                padding: MySpacing.zero,
                radius: 39,
                backgroundColor: AppColors.white,
                child: const Icon(
                  LucideIcons.plus,
                  size: 38,
                ),
              ),
            ],
          ),
          MySpacing.height(12),
          MyText.labelMedium("par ${widget.period}"),
          MySpacing.height(12),
          MyText.bodyMedium(
            "prenez le temps de batir votre clientèle avant d’avoir un prix élevé. les prix dans votre zone sont entre \$22 et \$45.",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

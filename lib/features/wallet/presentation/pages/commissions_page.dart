import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/utils/inputs.dart';

import '../../../../core/components/content_section_title.dart';
import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../../../core/components/saloon_app_bar.dart';

class CommisionsPage extends StatefulWidget {
  const CommisionsPage({super.key});

  @override
  State<CommisionsPage> createState() => _CommisionsPageState();
}

class _CommisionsPageState extends State<CommisionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.appBarTitle('Commissions'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySpacing.height(16),
            const ContentSectionTitle(
              title: "Type de parametre",
            ),
            MySpacing.height(16),
            const ContentSectionTitle(
              title: "Commissions",
            ),
            MySpacing.height(16),
            FormBuilderRadioGroup(
              name: "commissionType",
              decoration: AppInputDecoration.defaultInput(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              options: [
                FormBuilderFieldOption(
                  value: 'fixed',
                  child: Padding(
                    padding: MySpacing.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        MyText.labelMedium(
                          "Montant fixe",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        MySpacing.width(10),
                        Expanded(
                          child: FormBuilderTextField(
                            name: "fixed_field",
                            decoration: AppInputDecoration.defaultInput(
                              hintText: "",
                              radius: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FormBuilderFieldOption(
                  value: 'percentage',
                  child: Padding(
                    padding: MySpacing.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        MyText.labelMedium(
                          "Pourcentage",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        MySpacing.width(10),
                        Expanded(
                          child: FormBuilderTextField(
                            name: "percentage_field",
                            decoration: AppInputDecoration.defaultInput(
                              hintText: "%",
                              radius: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

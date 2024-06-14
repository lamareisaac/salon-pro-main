import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';
import '../../../../../core/utils/font.dart';
import '../../../../../core/utils/inputs.dart';
import '../../widgets/section_title.dart';

class BackgroundCheck extends StatefulWidget {
  const BackgroundCheck({super.key});

  @override
  State<BackgroundCheck> createState() => _BackgroundCheckState();
}

class _BackgroundCheckState extends State<BackgroundCheck> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _cardHolderNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _branchNumberFieldKey = GlobalKey<FormBuilderFieldState>();
  final _establishmentNumberFieldKey = GlobalKey<FormBuilderFieldState>();
  final _accountNumberFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Vérification des antécédents',
            ),
            MySpacing.height(10),
            MyText.bodyMedium(
                "Pour terminer votre candidature, vous devez payer pour la vérification de vos antécédents."),
            MySpacing.height(24),
            MyText.bodyMedium(
                "Une fois que la demande aura été traitée et approuvée, vous pourrez prendre des réservations."),
            MySpacing.height(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.titleSmall("Vérification des antécédents"),
                MyText.titleSmall("22,99 \$ CA"),
              ],
            ),
            MySpacing.height(16),
            MyText.titleLarge(
              "Total",
              style: GoogleFonts.inter(
                color: AppColors.textGreen,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            MyText.titleLarge(
              "22,99 \$ CA",
              style: GoogleFonts.inter(
                color: AppColors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            MySpacing.height(32),
            FormBuilderTextField(
              key: _cardHolderNameFieldKey,
              name: 'card_holder_name',
              decoration: AppInputDecoration.defaultInput(
                labelText: "Nom du titulaire de la carte",
                hintText: "John Doe",
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            MySpacing.height(10),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: FormBuilderTextField(
                    key: _branchNumberFieldKey,
                    name: 'branch_number',
                    decoration: AppInputDecoration.defaultInput(
                      labelText: "Mois d'expiration",
                      hintText: "01",
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                MySpacing.width(16),
                Expanded(
                  child: FormBuilderTextField(
                    key: _establishmentNumberFieldKey,
                    name: 'establishment_number',
                    
                    decoration: AppInputDecoration.defaultInput(
                      labelText: "Année d'expiration",
                      hintText: "2024",
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
              ],
            ),
            MySpacing.height(10),
            FormBuilderTextField(
              key: _accountNumberFieldKey,
              name: 'account_number',
              decoration: AppInputDecoration.defaultInput(
                labelText: "Cryptogramme",
                hintText: "200",
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

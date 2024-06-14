import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:saloon_pro/features/authentication/presentation/widgets/section_title.dart';

import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';
import '../../../../../core/utils/inputs.dart';

class WeeklyDesposit extends StatefulWidget {
  const WeeklyDesposit({super.key});

  @override
  State<WeeklyDesposit> createState() => _WeeklyDespositState();
}

class _WeeklyDespositState extends State<WeeklyDesposit> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _accountHolderNameFieldKey = GlobalKey<FormBuilderFieldState>();
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
              title: 'Dépôt Hebdomandaire',
            ),
            MySpacing.height(10),
            MyText.bodyMedium(
                "Remplissez les renseignements demandés ci-dessous à l’aide d’un chèque en blanc."),
            MySpacing.height(10),
            SizedBox(
              child:
                  Image.asset("assets/images/weekly_desposit_illustration.png"),
            ),
            MySpacing.height(10),
            const SectionTitle(
              title: 'Vos enseignements bancaires',
            ),
            MySpacing.height(10),
            MyText.bodyMedium(
                "Vos renseignements bancaires nous permettrons de verser vos revenus directement dans votre compte."),
            MySpacing.height(20),
            FormBuilderTextField(
              key: _accountHolderNameFieldKey,
              name: 'account_holder_name',
              decoration: AppInputDecoration.defaultInput(
                labelText: "Nom du titulaire du compte",
                hintText: "Comme écrit dans votre compte",
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            MySpacing.height(10),
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    key: _branchNumberFieldKey,
                    name: 'branch_number',
                    decoration: AppInputDecoration.defaultInput(
                      labelText: "N° de succursale",
                      hintText: "5 chiffres",
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
                      labelText: "N° d’établissment",
                      hintText: "3 chiffres",
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
                labelText: "N° de compte",
                hintText: "18 chiffres max",
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

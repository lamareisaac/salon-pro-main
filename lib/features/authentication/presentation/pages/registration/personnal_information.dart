import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';
import '../../../../../core/utils/inputs.dart';
import '../../models/registration_view_model.dart';
import '../../widgets/section_title.dart';

class PersonnalInformation extends StatefulWidget {
  PersonnalInformationModel initialData;
  PersonnalInformation({super.key, required this.initialData});

  @override
  State<PersonnalInformation> createState() => _PersonnalInformationState();
}

class _PersonnalInformationState extends State<PersonnalInformation> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _birthdateFieldKey = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _companyFieldKey = GlobalKey<FormBuilderFieldState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _lastnameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _phoneFieldKey = GlobalKey<FormBuilderFieldState>();
  final _phoneCodeFieldKey = GlobalKey<FormBuilderFieldState>();
  late PersonnalInformationModel formData;

  @override
  void initState() {
    super.initState();
    formData = widget.initialData;
  }

  @override
  Widget build(BuildContext context) {
    DateTime? birthdate = DateTime.tryParse(formData.birthdate);
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Quelle est votre adresse email',
            ),
            FormBuilderTextField(
              key: _emailFieldKey,
              name: 'email',
              initialValue: formData.email,
              onChanged: (v) {
                formData.email = v ?? "";
              },
              decoration:
                  AppInputDecoration.defaultInput(hintText: 'Votre email'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            const SizedBox(height: 10),
            const SectionTitle(
              title: 'Information personnelle',
              subTitle:
                  'Parlez-nous plus en détail de vous et de votre entreprise.',
            ),
            FormBuilderTextField(
              key: _companyFieldKey,
              name: 'companyName',
              initialValue: formData.saloonName,
              onChanged: (v) {
                formData.saloonName = v ?? "";
              },
              decoration: AppInputDecoration.defaultInput(
                  hintText: "Nom de l'entreprise"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            MySpacing.height(10),
            FormBuilderTextField(
              key: _lastnameFieldKey,
              name: 'lastname',
              initialValue: formData.lastname,
              onChanged: (v) {
                formData.lastname = v ?? "";
              },
              decoration:
                  AppInputDecoration.defaultInput(hintText: "Votre nom"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            MySpacing.height(10),
            FormBuilderTextField(
              key: _nameFieldKey,
              name: 'firstname',
              initialValue: formData.firstname,
              onChanged: (v) {
                formData.firstname = v ?? "";
              },
              decoration:
                  AppInputDecoration.defaultInput(hintText: "Votre prénom"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            MySpacing.height(10),
            Row(
              children: [
                SizedBox(
                  width: 70,
                  child: FormBuilderTextField(
                    key: _phoneCodeFieldKey,
                    name: 'phone_code',
                    initialValue: formData.dialCode,
                    onChanged: (v) {
                      formData.dialCode = v ?? "";
                    },
                    decoration: AppInputDecoration.defaultInput(
                        hintText: "+225",
                        contentPadding:
                            MySpacing.symmetric(vertical: 5, horizontal: 8)),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                MySpacing.width(12),
                Expanded(
                  child: FormBuilderTextField(
                    key: _phoneFieldKey,
                    name: 'phone',
                    initialValue: formData.phoneNumber,
                    onChanged: (v) {
                      formData.phoneNumber = v ?? "";
                    },
                    decoration: AppInputDecoration.defaultInput(
                        hintText: "Votre numéro de téléphone"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
              ],
            ),
            MySpacing.height(16),
            MyText.titleMedium("Date de naissance"),
            MySpacing.height(6),
            FormBuilderDateTimePicker(
              key: _birthdateFieldKey,
              name: 'birthdate',
              initialDate: birthdate,
              inputType: InputType.date,
              format: DateFormat("d/M/y"),
              valueTransformer: (v) {
                // print(v?.toString());
                return v;
              },
              decoration: AppInputDecoration.defaultInput(
                hintText: "01/02/1990",
              ),
            ),
            MySpacing.height(10),
            const SectionTitle(
              title: 'Mot de passe',
            ),
            FormBuilderTextField(
              name: 'password',
              initialValue: formData.password,
              decoration:
                  AppInputDecoration.defaultInput(hintText: "Mot de passe"),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(8),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'confirm_password',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: AppInputDecoration.defaultInput(
                  hintText: "Confirmation de mot de passe"),
              obscureText: true,
              validator: (value) =>
                  _formKey.currentState?.fields['password']?.value != value
                      ? 'Les mots ne sont pas identiques.'
                      : null,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

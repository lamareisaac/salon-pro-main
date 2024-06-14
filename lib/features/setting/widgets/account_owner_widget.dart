import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/components/my_spacing.dart';
import '../../../core/components/my_text.dart';
import '../../../core/utils/inputs.dart';

class AccountOwnerWidget extends StatefulWidget {
  final String title;
  const AccountOwnerWidget({super.key, required this.title});

  @override
  State<AccountOwnerWidget> createState() => _AccountOwnerWidgetState();
}

class _AccountOwnerWidgetState extends State<AccountOwnerWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _lastnameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _firstnameFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    var contentPadding = MySpacing.symmetric(vertical: 16, horizontal: 16);

    return Container(
      padding: MySpacing.symmetric(vertical: 10, horizontal: 16),
      child: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySpacing.height(20),
              MyText.titleLarge(
                widget.title,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              MySpacing.height(16),
              FormBuilderTextField(
                key: _lastnameFieldKey,
                initialValue: 'Salamanca'.toUpperCase(),
                name: 'name',
                decoration: AppInputDecoration.defaultInput(
                  hintText: 'Nom du propriétaire',
                  labelText: 'Nom du propriétaire'.toUpperCase(),
                  contentPadding: contentPadding,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              MySpacing.height(16),
              FormBuilderTextField(
                key: _firstnameFieldKey,
                initialValue: 'Juan Gabriel'.toUpperCase(),
                name: 'firstname',
                decoration: AppInputDecoration.defaultInput(
                  hintText: 'Prénoms du propriétaire',
                  labelText: 'Prénoms du propriétaire'.toUpperCase(),
                  contentPadding: contentPadding,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              MySpacing.height(16),
              FormBuilderDateTimePicker(
                name: 'birthdate',
                initialValue: DateTime.now(),
                decoration: AppInputDecoration.defaultInput(
                  hintText: 'Prénoms du propriétaire',
                  labelText: 'Prénoms du propriétaire'.toUpperCase(),
                  contentPadding: contentPadding,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              MySpacing.height(30),
            ],
          ),
        ),
      ),
    );
  }
}

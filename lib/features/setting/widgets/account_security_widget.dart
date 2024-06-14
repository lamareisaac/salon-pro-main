import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';
import 'package:saloon_pro/core/components/my_text.dart';

import '../../../core/components/saloon_button.dart';
import '../../../core/utils/font.dart';
import '../../../core/utils/inputs.dart';

class AccountSecurityWidget extends StatefulWidget {
  final String title;
  const AccountSecurityWidget({super.key, required this.title});

  @override
  State<AccountSecurityWidget> createState() => _AccountSecurityWidgetState();
}

class _AccountSecurityWidgetState extends State<AccountSecurityWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
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
                key: _passwordFieldKey,
                initialValue: 'testdgdgzezttg',
                name: 'password',
                obscureText: true,
                decoration: AppInputDecoration.defaultInput(
                  hintText: '',
                  labelText: 'Mot de passe',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

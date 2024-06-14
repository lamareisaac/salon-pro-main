import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';
import 'package:saloon_pro/core/components/my_text.dart';

import '../../../core/utils/font.dart';
import '../../../core/utils/inputs.dart';
import '../../../core/utils/navigation_helper.dart';
import '../../authentication/presentation/bloc/auth_bloc.dart';
import '../../authentication/presentation/pages/login_page.dart';

class AccountInformationWidget extends StatefulWidget {
  final String title;
  const AccountInformationWidget({super.key, required this.title});

  @override
  State<AccountInformationWidget> createState() =>
      _AccountInformationWidgetState();
}

class _AccountInformationWidgetState extends State<AccountInformationWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _saloonNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _phoneFieldKey = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

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
                key: _saloonNameFieldKey,
                initialValue: 'Salon Hilligo',
                name: 'name',
                decoration: AppInputDecoration.defaultInput(
                  hintText: 'Saloon 1',
                  labelText: "NOM D'ETABLISSEMENT",
                  contentPadding: contentPadding,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              MySpacing.height(16),
              FormBuilderTextField(
                key: _phoneFieldKey,
                initialValue: '+33 65 82 35',
                name: 'phone',
                decoration: AppInputDecoration.defaultInput(
                  hintText: '',
                  labelText: 'NUMERO DE TELEPHONE',
                  prefix: Padding(
                    padding: MySpacing.only(top: 8, right: 8),
                    child: Image.asset(
                      'assets/images/icons/french_flag.png',
                    ),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              MySpacing.height(16),
              FormBuilderTextField(
                key: _emailFieldKey,
                initialValue: 'Juan.gabriel@gmail.com',
                name: 'email',
                decoration: AppInputDecoration.defaultInput(
                  hintText: '',
                  labelText: 'EMAIL',
                  contentPadding: contentPadding,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              MySpacing.height(16),
              Stack(
                children: [
                  FormBuilderTextField(
                    name: 'subdomain',
                    initialValue: 'baber',
                    decoration: AppInputDecoration.defaultInput(
                      labelText:
                          'Lien vers votre page de réservation'.toUpperCase(),
                      hintText: '',
                      contentPadding: MySpacing.only(
                          top: 16, bottom: 16, left: 16, right: 120),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 1,
                          color: Color(0xFF8F90A6).withAlpha(100),
                        ),
                      )),
                      child: Row(
                        children: [
                          MySpacing.width(8),
                          MyText.labelMedium(
                            '.svloon.com',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF8F90A6),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              MySpacing.height(16),
              FormBuilderTextField(
                maxLines: 6,
                name: 'description',
                decoration: AppInputDecoration.defaultInput(
                  contentPadding:
                      MySpacing.symmetric(vertical: 16, horizontal: 16),
                  hintText:
                      "Breve description de votre entreprise (recommandé)",
                  // labelText: 'Brève description'.toUpperCase(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              MySpacing.height(30),
              Center(
                child: BlocConsumer<AuthBloc, AuthState>(listener: (_, state) {
                  if (state is LogoutComplete) {
                    pushAndRemoveAll(context, const LoginPage());
                  }
                }, builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const Logout());
                    },
                    child: MyText.labelLarge(
                      'Déconnexion',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

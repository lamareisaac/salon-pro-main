import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';
import 'package:saloon_pro/features/authentication/presentation/pages/register_page.dart';

import '../../../../core/components/failure_dialog.dart';
import '../../../../core/components/loading.dart';
import '../../../../core/components/saloon_button.dart';
import '../../../../core/utils/failure.dart';
import '../../../../core/utils/font.dart';
import '../../../../core/utils/inputs.dart';
import '../../../home/presentation/pages/global_home_page.dart';
import '../../domain/usecases/login_usecase.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/section_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();

  showMyDialog(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            child:
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthComplete) {
                pushAndRemoveAll(context, const GlobalHomePage());
              }
              if (state is AuthFailed) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FailureDialog(failure: state.failure);
                  },
                );
              }
            }, builder: (context, state) {
              return FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      title: 'Se connecter',
                    ),
                    FormBuilderTextField(
                      key: _emailFieldKey,
                      initialValue: 'chicsalon5@gmail.com',
                      name: 'email',
                      decoration: AppInputDecoration.defaultInput(
                        labelText: 'Votre email',
                        hintText: 'Votre email',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      key: _passwordFieldKey,
                      initialValue: '111111111',
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      name: 'password',
                      decoration: AppInputDecoration.defaultInput(
                        labelText: 'Mot de passe',
                        hintText: 'Mot de passe',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      child: state is AuthLoading
                          ? const LoadingCircular(
                              color: Colors.black,
                            )
                          : SaloonButton(
                              label: 'Connexion',
                              onPressed: () {
                                if (_formKey.currentState?.saveAndValidate() ??
                                    false) {
                                  LoginParams params = LoginParams(
                                    email:
                                        _formKey.currentState!.value['email'],
                                    password: _formKey
                                        .currentState!.value['password'],
                                  );
                                  context
                                      .read<AuthBloc>()
                                      .add(LoginSubmited(params: params));
                                }
                              },
                            ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Vous n'avez pas de compte ?",
                            style: TextStyle(
                              color: AppColors.black,
                            )),
                        TextButton(
                          onPressed: () {
                            pushNavigation(context, const RegisterPage());
                          },
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: AppColors.link,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

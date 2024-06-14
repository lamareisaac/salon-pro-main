import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saloon_pro/core/components/loading.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';
import 'package:saloon_pro/features/home/presentation/pages/home_page.dart';

import '../../../../core/components/failure_dialog.dart';
import '../../../../core/components/saloon_button.dart';
import '../../../../core/utils/font.dart';
import '../../domain/usecases/register_usecase.dart';
import '../bloc/auth_bloc.dart';
import '../models/registration_view_model.dart';
import 'registration/background_check.dart';
import 'registration/choose_account_type.dart';
import 'registration/have_account_already.dart';
import 'registration/personnal_information.dart';
import 'registration/professional_certification.dart';
import 'registration/professionnal_categories.dart';
import '../../../../core/components/step_phase.dart';
import 'registration/user_saloon_address.dart';
import 'registration/user_saloon_photos.dart';
import 'registration/weekly_deposit.dart';
import 'registration/work_authorization_proof.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController controller = PageController();
  int currentStep = 0;
  int nbSteps = 8;
  late RegistrationViewModel formData;

  @override
  void initState() {
    super.initState();
    formData = RegistrationViewModel.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: MySpacing.horizontal(20),
          child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            if (state is AuthComplete) {
              pushAndRemoveAll(context, const HomePage());
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
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: PageView(
                      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                      /// Use [Axis.vertical] to scroll vertically.
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: <Widget>[
                        ChooseAccountType(
                          type: formData.accountTypeData,
                          onChanged: (v) {
                            setState(() {
                              formData.accountTypeData = v;
                            });
                          },
                        ),
                        PersonnalInformation(
                          initialData: formData.personnalInformation,
                        ),
                        WorkAuthorizationProof(
                            initialData: formData.workAuthorizationProof),
                        ProfessionalCategories(
                          selected: formData.categoryProId,
                          onChanged: (v) {
                            formData.categoryProId = v;
                          },
                        ),
                        ProfessionalCertifcation(
                          certification: formData.certificationPro,
                          onChanged: (v) {
                            formData.certificationPro = v;
                          },
                        ),
                        UserSaloonAddress(
                          initalData: formData.addSaloonAddress,
                          // onChanged: (v) {
                          //   formData.addSaloonAddress = v;
                          // },
                        ),
                        UserSaloonPhotos(
                          photos: formData.photos,
                        ),
                        WeeklyDesposit(),
                        BackgroundCheck(),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: MySpacing.only(top: 16),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      StepPhase(current: currentStep, steps: nbSteps),
                      MySpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SaloonElevatedButton(
                            label: 'Retour',
                            backgroundColor: AppColors.white,
                            color: AppColors.black,
                            onPressed: () {
                              // Don't go back if we are on first step
                              if (currentStep == 0) return;

                              setState(() {
                                currentStep--;
                                controller.jumpToPage(currentStep);
                              });
                            },
                          ),
                          SaloonElevatedButton(
                            label:
                                currentStep < nbSteps ? 'Suivant' : 'Terminé',
                            child: state is AuthSignupInProgress
                                ? const LoadingCircular(size: 20)
                                : null,
                            onPressed: () {
                              if (currentStep > nbSteps) return;

                              print(formData.toJson());

                              /// We are finish all steps
                              if (currentStep == nbSteps) {
                                /// TODO: Validate data before sent
                                return;
                                context.read<AuthBloc>().add(RegisterSubmited(
                                    params:
                                        SaloonRegistrationParams.fromViewModel(
                                            formData)));
                                return;
                              }

                              setState(() {
                                currentStep++;
                                controller.jumpToPage(currentStep);
                              });
                            },
                          ),
                        ],
                      ),
                      const HaveAccountAlready(),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

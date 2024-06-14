import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saloon_pro/core/components/loading.dart';
import 'package:saloon_pro/core/utils/font.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';
import 'package:saloon_pro/features/authentication/presentation/pages/register_page.dart';

import '../../../../core/components/saloon_button.dart';
import '../bloc/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WelcomeBloc, WelcomeState>(listener: (context, state) {
        if (state == WelcomeComplete()) {
          pushNavigation(context, const RegisterPage());
          return;
        }
      }, builder: (context, state) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 218,
                      child: Image.asset('assets/images/welcome.png'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // height: 254,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  'Passer en mode pro',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppFontSize.large,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                'ZUEGFVBJK N.?DHUFEDVJF SV?CEFGD NKOHIUBOJK DN?AFENZB GMOKN DVFHIBJD ZNDV ?.CBVM?OJFDBAZVH BVEFNGZR?./EKMOP3RZUGYVEG NBDVD.QCLCSOJD IHXY8U',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppFontSize.regular,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SaloonButton(
                                  label: 'Commencer',
                                  backgroundColor: Colors.white,
                                  color: Colors.black,
                                  onPressed: () {
                                    context
                                        .read<WelcomeBloc>()
                                        .add(WelcomeStart());
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class WelcomePageGrey extends StatelessWidget {
  const WelcomePageGrey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.lightGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.lightGrey,
              height: MediaQuery.of(context).size.height * 0.60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/welcome.png',
                    width: double.maxFinite,
                    // height: 218,
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 254,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Passer en mode pro',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: AppFontSize.large,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              'ZUEGFVBJK N.?DHUFEDVJF SV?CEFGD NKOHIUBOJK DN?AFENZB GMOKN DVFHIBJD ZNDV ?.CBVM?OJFDBAZVH BVEFNGZR?./EKMOP3RZUGYVEG NBDVD.QCLCSOJD IHXY8U',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppFontSize.regular,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SaloonButton(
                                label: 'Commencer',
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                onPressed: () {
                                  pushNavigation(context, const WelcomePage());
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

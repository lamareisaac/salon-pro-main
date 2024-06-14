import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/core/utils/localization.dart';
import 'package:saloon_pro/features/home/presentation/pages/global_home_page.dart';
import 'package:saloon_pro/features/welcome/presentation/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/models/user_preferences.dart';
import 'core/utils/font.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/authentication/presentation/pages/register_page.dart';
import 'features/home/presentation/bloc/app_bloc.dart';
import 'features/welcome/presentation/bloc/welcome_bloc.dart';
import "injection_container.dart" as di;

void main() async {
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // Dependencies injections
  await di.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            registerUsecase: di.sl(),
            loginUsecase: di.sl(),
            logoutUsecase: di.sl(),
          ),
        ),
        BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (_) => AppBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizationsDelegate(context),
          // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.black,
            primary: AppColors.black,
            onPrimary: AppColors.white,
          ),
          useMaterial3: true,
          tabBarTheme: TabBarTheme(
            indicatorColor: AppColors.black,
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.inter(
                fontSize: 14, color: AppColors.inputLabelText),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.inputBorder),
            ),
            fillColor: AppColors.white,
          ),
          datePickerTheme: const DatePickerThemeData().copyWith(
            backgroundColor: AppColors.white,
          ),
          dialogBackgroundColor: AppColors.white,
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.black;
                }
                return AppColors.black;
              },
            ),
          ),
          checkboxTheme: CheckboxThemeData(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.black;
                }
                return AppColors.white;
              },
            ),
          ),
          switchTheme: SwitchThemeData(
            trackColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.switchColor;
                }
                return AppColors.lightGrey;
              },
            ),
            thumbColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.white;
                }
                return AppColors.white;
              },
            ),
            trackOutlineColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.switchColor;
                }
                return AppColors.lightGrey;
              },
            ),
          ),
        ),
        supportedLocales: const <Locale>[
          Locale('en', ''), // English
          Locale('fr', ''), // French
        ],
        routes: {
          '/': (context) => _getHomePage(),
          '/login': (context) => const RegisterPage(),
        },
      ),
    );
  }

  Widget _getHomePage() {
    // Get user custom local settings
    UserPreferences preference = UserPreferences(
      sharedPreferences: di.sl<SharedPreferences>(),
      authBox: di.sl(),
    );

    if (preference.isUserLoggedIn()) {
      return const GlobalHomePage();
    } else if (preference.isFirstLoggin()) {
      return const WelcomePage();
    } else {
      return const RegisterPage();
    }
  }
}

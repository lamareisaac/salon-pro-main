import 'package:flutter/material.dart';

enum AppColorsMode { light, dark }

class AppColors {
  AppColorsMode mode;
  AppColors({this.mode = AppColorsMode.light});

  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color primary = Colors.white;
  static Color secondary = Colors.black;
  static Color transparent = Colors.transparent;
  static Color lightGrey = const Color(0xFFDADADA);
  static Color link = Colors.blueAccent;
  static Color darkRed = const Color(0xFFBF0D02);
  static Color red = const Color(0xFFEC0202);
  static Color pink = const Color(0xFF9747FF);
  static Color error = darkRed;
  static Color quickService = const Color(0xFFE67E22);
  static Color swipeableButtonBackgroundColor = const Color(0xFF173621);
  static Color swipeableButtonColor = const Color(0xFF548065);
  static Color settingListItemBorderColor = const Color(0xFFF5F5F5);
  static Color grey = const Color(0xFF686767);
  static Color staffItemPositionColor = const Color(0xFFA3A3A3);

  /// Text
  static Color textGreen = const Color(0xFF49A064);

  /// Forms
  static Color inputBorder = const Color(0xFFCECECE);
  static Color inputHintText = const Color(0xFFCECECE);
  static Color inputLabelText = const Color(0xFF929292);
  static Color switchColor = const Color(0xFF49A064);

  static Color saloonGreyBorder = const Color(0xFFD9D9D9);

  static Color walletWeekAmountColor = const Color(0xFF49A064);

  static Color employeeOverviewBorderColor = const Color(0xFFDADADA);
  static Color calendarDayHighlightColor = const Color(0xFFD8D8D8DB);

  static Color quickServiceOrange = const Color(0xFFE67E22);
  static Color quickServicePriceBgColor = const Color(0xFF49A064);
  static Color quickServiceDisableColor = const Color(0xFF8F90A6);
  static Color myServiceSearchInputBgColor = const Color(0xFFEEEEEE);

  static Color quickServiceBottomSheetBorderColor = const Color(0xFFAFAFAF);
  static Color quickServiceAddStyleBgColor = const Color(0xFFE8E8E8);

  static Color travelWorkBorderColor = const Color(0xFFDFDFDF);
  static Color travelWorkActivateColor = const Color(0xFF17BB4A);
  static Color anoucementDividerColor = const Color(0xFFDEDEDE);
  static Color commodityBorderColor = const Color(0xFFCCCCCC);

  static Color saloonPriceTextfieldColor = const Color(0xFFDADADA);
  static Color cancelButtonBgColor = const Color(0xFFB90B00);
  static Color validateButtonBgColor = const Color(0xFF49A064);
  static Color updateButtonTextColor = const Color(0xFF26A7C3);

  static Color activeStateColor = const Color(0xFF17BB4A);

  static List<Color> appointsColors = [
    switchColor,
    pink,
    quickServiceOrange,
    red,
    link
  ];
}

class AppFontSize {
  static double xlarge = 35;
  static double large = 25;
  static double medium = 20;
  static double small = 16;
  static double regular = 14;

  static double buttonRadius = 32;
  static double swipeRadius = 10;
}

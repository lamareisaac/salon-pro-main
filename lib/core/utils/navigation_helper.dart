import 'package:flutter/material.dart';

void pushNavigation(BuildContext context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void popNavigation(BuildContext context) {
  Navigator.pop(context);
}

void popNavigationUntil(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}

void pushReplacement(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}

void pushAndRemoveAll(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute<void>(builder: (_) => page), (route) => route.isFirst);
}

void appDailogBuilder(BuildContext context, Widget contentWidget,
    {bool barrierDismissible = true}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return contentWidget;
      },
    );
  });
}

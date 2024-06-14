import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../utils/failure.dart';
import '../utils/font.dart';

class FailureDialog extends StatelessWidget {
  final Failure failure;
  const FailureDialog({super.key, required this.failure});

  String getMessage() {
    if (failure is ValidationException) {
      print((failure as ValidationException).response);
      return failure.message;
    }
    return failure.message;
  }

  @override
  Widget build(BuildContext context) {
    print(failure.message);
    return Dialog(
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Center(
                  child: Icon(
                LucideIcons.alertTriangle,
                size: 40,
                color: AppColors.error,
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Center(
                  child: Text(
                failure.message,
                style: const TextStyle(fontWeight: FontWeight.w700),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

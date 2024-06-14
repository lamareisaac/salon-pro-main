import 'package:flutter/material.dart';

import '../../../../../core/utils/font.dart';
import '../../../../../core/utils/navigation_helper.dart';
import '../login_page.dart';

class HaveAccountAlready extends StatelessWidget {
  const HaveAccountAlready({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Vous avez un compte ?',
            style: TextStyle(
              color: AppColors.black,
            )),
        TextButton(
          onPressed: () {
            pushNavigation(context, const LoginPage());
          },
          child: Text(
            'Se sonnecter',
            style: TextStyle(
              color: AppColors.link,
            ),
          ),
        )
      ],
    );
  }
}

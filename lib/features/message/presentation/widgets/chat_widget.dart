import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_app_bar.dart';

import '../../../../core/components/my_text.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        actionIcon: LucideIcons.settings,
        actionCallback: () {},
        child: MyText.titleLarge('Messages'),
      ),
    );
  }
}

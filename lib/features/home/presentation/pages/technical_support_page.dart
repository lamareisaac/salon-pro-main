import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/components/chat_message_room.dart';
import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../../../core/components/saloon_app_bar.dart';
import '../widgets/technical_support_questions.dart';

class TechnicalSupportPage extends StatefulWidget {
  const TechnicalSupportPage({super.key});

  @override
  State<TechnicalSupportPage> createState() => _TechnicalSupportPageState();
}

class _TechnicalSupportPageState extends State<TechnicalSupportPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      displayBottomSheet();
    });
  }

  void displayBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return const FractionallySizedBox(
              heightFactor: 0.65, child: TechnicalSupportQuestions());
        });
  }

  @override
  Widget build(BuildContext context) {
    var messages = [
      ChatMessageModel(
          direction: 'received',
          message: 'Bonjour, comment pouvons-nous vous aider ?'),
      ChatMessageModel(
          direction: 'sent',
          message:
              'Bonjour, j’ai des difficultés à ajouter un service personnalisé.'),
      ChatMessageModel(
          direction: 'received',
          message:
              'Bonjour, j’ai des difficultés à ajouter un service personnalisé.'),
    ];

    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.appBarTitle('Soutien technique'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MySpacing.height(16),
            ChatMessageRoom(
              messages: messages,
              onTap: () {
                displayBottomSheet();
              },
            ),
          ],
        ),
      ),
    );
  }
}

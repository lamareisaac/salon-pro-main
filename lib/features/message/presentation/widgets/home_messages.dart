import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_app_bar.dart';

import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../data/models/message_model.dart';
import 'message_item.dart';

class HomeMessages extends StatelessWidget {
  const HomeMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(
          LucideIcons.arrowLeft,
        ),
        child: MyText.titleLarge('Messages'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: MySpacing.horizontal(16),
          child: Column(
            children: [
              MySpacing.height(16),
              MessageItem(
                message: MessageModel(
                  name: 'Sarah Nicolo',
                  shortMessage: 'Avez-vous de la place cet ...',
                  type: MessageType.customer,
                  date: '17 nov',
                ),
              ),
              MessageItem(
                message: MessageModel(
                  name: 'Sarah Nicolo',
                  shortMessage: 'Avez-vous de la place cet ...',
                  type: MessageType.artist,
                  date: '17 nov',
                  readed: true,
                ),
              ),
              MessageItem(
                message: MessageModel(
                  name: 'Sarah Nicolo',
                  shortMessage: 'Avez-vous de la place cet ...',
                  type: MessageType.customer,
                  date: '17 nov',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

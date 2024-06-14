import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_app_bar.dart';
import 'package:saloon_pro/core/utils/font.dart';

import '../../../core/components/my_spacing.dart';
import '../../../core/components/my_text.dart';

class AlertsNotificationsPage extends StatefulWidget {
  const AlertsNotificationsPage({super.key});

  @override
  State<AlertsNotificationsPage> createState() =>
      _AlertsNotificationsPageState();
}

class _AlertsNotificationsPageState extends State<AlertsNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.titleLarge('Alertes et notifications'),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Container(
            padding: MySpacing.symmetric(horizontal: 16),
            child: Column(
              children: [
                MySpacing.height(16),
                const AlertNotificationItem(
                  title: 'Travel work',
                  subTitle:
                      'Afficher les apperçus des notifications pour le travel work',
                ),
                const AlertNotificationItem(
                  title: 'Service rapide',
                  subTitle:
                      'Afficher les apperçus des notifications pour le service rapide',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlertNotificationItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const AlertNotificationItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      name: title,
      title: MyText.labelLarge(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: MyText.labelMedium(subTitle),
      decoration: const InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}

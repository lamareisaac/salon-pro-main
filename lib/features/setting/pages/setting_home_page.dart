import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';

import '../../../core/components/my_spacing.dart';
import '../widgets/setting_list_item.dart';
import 'account_setting_page.dart';
import 'alerts_notifications_page.dart';
import 'business_card_page.dart';
import 'language_setting_page.dart';

class SettingHomePage extends StatelessWidget {
  const SettingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets pagePadding = const EdgeInsets.symmetric(horizontal: 20);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: pagePadding,
                    height: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Paramètres',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SettingPageListItem(
                        padding: pagePadding,
                        icon: Image.asset(
                            'assets/images/icons/icon_professional_card.png'),
                        title: 'Carte professionnelle',
                        background:
                            const AssetImage('assets/images/pro_card.png'),
                        onTap: () {
                          pushNavigation(context, const BusinessCardPage());
                        },
                      ),
                      MySpacing.height(16),
                      SettingPageListItem(
                        padding: pagePadding,
                        icon: Image.asset('assets/images/icons/icon_user.png'),
                        title: 'Paramètre du compte',
                        onTap: () {
                          pushNavigation(context, const AccountSettingPage());
                        },
                      ),
                      MySpacing.height(16),
                      SettingPageListItem(
                        padding: pagePadding,
                        icon: Image.asset(
                            'assets/images/icons/icon_alerts_notifications.png'),
                        title: 'Alertes et notifications',
                        onTap: () {
                          pushNavigation(
                              context, const AlertsNotificationsPage());
                        },
                      ),
                      MySpacing.height(16),
                      SettingPageListItem(
                        padding: pagePadding,
                        icon:
                            Image.asset('assets/images/icons/french_flag.png'),
                        title: 'Langues',
                        onTap: () {
                          pushNavigation(context, const LanguageSettingPage());
                        },
                      ),
                      MySpacing.height(16),
                      SettingPageListItem(
                        padding: pagePadding,
                        icon: Image.asset(
                            'assets/images/icons/icon_professional_card.png'),
                        title: 'Tutoriels',
                      ),
                      MySpacing.height(16),
                      SettingPageListItem(
                        padding: pagePadding,
                        icon: Image.asset(
                            'assets/images/icons/icon_paid_bill.png'),
                        title: 'Abonnement et Facture',
                      ),
                      MySpacing.height(16),
                      SettingPageListItem(
                        padding: pagePadding,
                        icon: Image.asset('assets/images/icons/icon_help.png'),
                        title: 'Aide',
                      ),
                      MySpacing.height(16),
                      SettingPageListItem(
                        padding: pagePadding,
                        icon: Image.asset('assets/images/icons/mdi_about.png'),
                        title: 'A propos de Saloon ',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

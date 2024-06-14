import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/components/my_spacing.dart';
import '../../../core/components/my_text.dart';
import '../../../core/components/saloon_app_bar.dart';
import '../widgets/account_information_widget.dart';
import '../widgets/account_owner_widget.dart';
import '../widgets/account_security_widget.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({super.key});

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  List<String> tabs = [
    'Informations du compte',
    'Proprietaire du compte',
    'Sécurité'
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: tabs.length, vsync: this, initialIndex: selectedIndex);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.appBarTitle('Paramètres du compte'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MySpacing.height(16),
            TabBar(
              controller: tabController,
              tabs: tabs
                  .map((text) => Container(
                        padding: MySpacing.only(bottom: 8),
                        child: MyText.labelSmall(
                          text,
                          fontSize: 11,
                          textAlign: TextAlign.center,
                        ),
                      ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  AccountInformationWidget(title: tabs[0]),
                  AccountOwnerWidget(title: tabs[1]),
                  AccountSecurityWidget(title: tabs[2]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

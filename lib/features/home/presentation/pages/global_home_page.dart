import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/features/home/presentation/bloc/app_bloc.dart';

import '../../../../core/utils/font.dart';
import '../../../setting/pages/setting_home_page.dart';
import '../../../wallet/presentation/pages/wallet_page.dart';
import 'home_page.dart';

class GlobalHomePage extends StatefulWidget {
  const GlobalHomePage({super.key});

  @override
  State<GlobalHomePage> createState() => _GlobalHomePageState();
}

class _GlobalHomePageState extends State<GlobalHomePage>
    with SingleTickerProviderStateMixin {
  late ThemeData theme;
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    theme = ThemeData();
    tabController =
        TabController(length: 5, vsync: this, initialIndex: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    double iconWidth = MediaQuery.of(context).size.width - 64;
    double unSelectedWidth = iconWidth * (1 / 5);
    double iconSize = 30;

    return SafeArea(
      top: false,
      bottom: false,
      child: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Theme(
              data: theme,
              child: Scaffold(
                backgroundColor: AppColors.lightGrey,
                body: Stack(
                  children: [
                    TabBarView(
                      controller: tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const <Widget>[
                        HomePage(),
                        HomePage(),
                        HomePage(),
                        WalletPage(),
                        SettingHomePage(),
                      ],
                    ),
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 12),
                        child: PhysicalModel(
                          color: Colors.transparent,
                          elevation: 12,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32)),
                          shadowColor:
                              theme.colorScheme.onBackground.withAlpha(180),
                          shape: BoxShape.rectangle,
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.cardTheme.color?.withAlpha(200) ??
                                  AppColors.primary,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(35)),
                              border: Border.all(
                                  width: 0.2,
                                  color: AppColors.black.withAlpha(180)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                singleItem(
                                  index: 0,
                                  width: unSelectedWidth,
                                  icon: SizedBox(
                                    height: iconSize,
                                    child: Transform.scale(
                                      scale: 1.2,
                                      child: Image.asset(
                                        'assets/images/icons/icon_home.png',
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  activeIcon: SizedBox(
                                    child: Transform.scale(
                                      scale: 1.25,
                                      child: Image.asset(
                                          'assets/images/icons/icon_home.png'),
                                    ),
                                  ),
                                  iconSize: iconSize,
                                ),
                                singleItem(
                                  index: 1,
                                  width: unSelectedWidth,
                                  icon: SizedBox(
                                    height: iconSize,
                                    child: Transform.scale(
                                      scale: 1.25,
                                      child: Image.asset(
                                          'assets/images/icons/insights.png'),
                                    ),
                                  ),
                                  activeIcon: SizedBox(
                                    height: iconSize,
                                    child: Transform.scale(
                                      scale: 1.25,
                                      child: Image.asset(
                                        'assets/images/icons/insights.png',
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  iconSize: iconSize,
                                ),
                                singleItem(
                                  index: 2,
                                  width: unSelectedWidth,
                                  icon: Icon(
                                    LucideIcons.users2,
                                    size: iconSize,
                                    color: AppColors.black,
                                  ),
                                  activeIcon: Icon(
                                    LucideIcons.users2,
                                    size: iconSize,
                                    color: AppColors.white,
                                  ),
                                  iconSize: iconSize,
                                ),
                                singleItem(
                                  index: 3,
                                  width: unSelectedWidth,
                                  icon: Icon(
                                    LucideIcons.landmark,
                                    size: iconSize,
                                    color: AppColors.black,
                                  ),
                                  activeIcon: Icon(
                                    LucideIcons.landmark,
                                    size: iconSize,
                                    color: AppColors.white,
                                  ),
                                  iconSize: iconSize,
                                ),
                                singleItem(
                                  index: 4,
                                  width: unSelectedWidth,
                                  icon: Icon(
                                    LucideIcons.settings,
                                    size: iconSize,
                                    color: AppColors.black,
                                  ),
                                  activeIcon: Icon(
                                    LucideIcons.settings,
                                    size: iconSize,
                                    color: AppColors.white,
                                  ),
                                  iconSize: iconSize,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget singleItem({
    required int index,
    required Widget icon,
    required Widget activeIcon,
    required double width,
    double iconSize = 25,
  }) {
    bool selected = index == selectedIndex;
    double containerSize = iconSize + 10;

    if (selected) {
      return SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: containerSize,
              width: containerSize,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: activeIcon,
            ),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
            if (tabController.index != selectedIndex) {
              tabController.animateTo(selectedIndex);
            }
          });
        },
        child: SizedBox(
          width: width,
          child: Center(
            child: icon,
          ),
        ),
      );
    }
  }
}

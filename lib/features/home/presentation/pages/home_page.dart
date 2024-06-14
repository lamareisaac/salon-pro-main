import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_button.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'dart:math';

import '../../../../core/components/quick_service_dialog.dart';
import '../../../../core/utils/font.dart';
import '../widgets/background_widget.dart';
import '../widgets/expanded_widget.dart';
import '../widgets/preview.dart';
import 'new_ unavailability_page.dart';
import 'new_appointment_page.dart';
import 'technical_support_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double iconSize = 32;
  late AnimationController _controller;

  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 95.0;
  late final ScrollController scrollController;
  late final PanelController panelController;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    panelController = PanelController();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    theme = ThemeData();

    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showQuickServiceDialog(context,
            title: "Commencez votre parcours maintenant  !");
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _panelHeightOpen = size.height - 183;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: BackgroundWidget(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: SlidingUpPanel(
                snapPoint: .7,
                defaultPanelState: PanelState.OPEN,
                disableDraggableOnScrolling: false,
                collapsed: const PreviewWidget(),
                maxHeight: _panelHeightOpen,
                minHeight: _panelHeightClosed,
                parallaxEnabled: false,
                parallaxOffset: 0.5,
                body: const ExpandedWidget(),
                controller: panelController,
                scrollController: scrollController,
                panelBuilder: () => _panel(),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
                onPanelSlide: (double pos) => setState(() {}),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 65,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    width: MediaQuery.of(context).size.width,
                    child: ScaleTransition(
                      scale: CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.0, 1.0 - 0 / 3 / 2.0,
                            curve: Curves.easeOutQuint),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SaloonElevatedButton(
                            label: "Nouveau rendez-vous",
                            height: 50,
                            labelStyle: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            onPressed: () {
                              closeFloatingButtonList();
                              pushNavigation(
                                  context, const NewAppointmentPage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    width: MediaQuery.of(context).size.width,
                    child: ScaleTransition(
                      scale: CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(
                          0.0,
                          1.0 - 1 / 3 / 2.0,
                          curve: Curves.easeOutQuint,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SaloonElevatedButton(
                            label: "Nouvelle indisponibilite",
                            height: 50,
                            labelStyle: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            onPressed: () {
                              closeFloatingButtonList();
                              pushNavigation(
                                  context, const NewUnavailabilityPage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    width: MediaQuery.of(context).size.width,
                    child: ScaleTransition(
                      scale: CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(0.0, 1.0 - 2 / 3 / 2.0,
                            curve: Curves.easeOutQuint),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SaloonElevatedButton(
                            label: "Soutien technique",
                            height: 50,
                            labelStyle: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            onPressed: () {
                              closeFloatingButtonList();
                              pushNavigation(
                                  context, const TechnicalSupportPage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: AppColors.primary,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Transform(
                          transform:
                              Matrix4.rotationZ(_controller.value * 0.5 * pi),
                          alignment: FractionalOffset.center,
                          child: Icon(
                            _controller.isDismissed
                                ? LucideIcons.plus
                                : LucideIcons.x,
                            color: AppColors.black,
                            size: 35,
                            weight: 900,
                          ),
                        );
                      },
                    ),
                    onPressed: () {
                      if (_controller.isDismissed) {
                        // setState(() {
                        //   _contentOpacity = 0.6;
                        // });
                        _controller.forward();
                      } else {
                        closeFloatingButtonList();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void closeFloatingButtonList() {
    _controller.reverse();
  }

  Widget _panel() {
    return SizedBox(
      child: (panelController.isPanelOpen ||
              panelController.isPanelShown && !panelController.isPanelClosed)
          ? const ExpandedWidget()
          : Container(),
    );
  }
}

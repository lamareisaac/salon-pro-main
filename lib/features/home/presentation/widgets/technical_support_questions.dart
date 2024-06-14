import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/my_text.dart';
import 'package:saloon_pro/core/utils/font.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';

import '../../../../core/components/my_spacing.dart';

class TechnicalSupportQuestions extends StatefulWidget {
  const TechnicalSupportQuestions({super.key});

  @override
  State<TechnicalSupportQuestions> createState() =>
      TechnicalSupportQuestionsState();
}

class TechnicalSupportQuestionsState extends State<TechnicalSupportQuestions> {
  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color(0xFF1C1C28);

    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 62,
                padding: MySpacing.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.white,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        popNavigation(context);
                      },
                      child: Icon(
                        LucideIcons.x,
                        color: AppColors.white,
                      ),
                    ),
                    MySpacing.width(10),
                    Expanded(
                      child: Wrap(
                        children: [
                          MyText.titleLarge(
                            'Comment pouvons nous vous aider ?',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const TechnicalQuestionItem(
                icon: LucideIcons.alertTriangle,
                title: 'Signaler un incident',
              ),
              const TechnicalQuestionItem(
                icon: LucideIcons.calendar,
                title: "Question sur l’horaire",
              ),
              const TechnicalQuestionItem(
                icon: LucideIcons.alertTriangle,
                title: 'Question sur les revenus',
              ),
              const TechnicalQuestionItem(
                icon: LucideIcons.userCircle2,
                title: "Question sur le compte",
              ),
              const TechnicalQuestionItem(
                icon: LucideIcons.mapPin,
                title: 'Mettre à jour mes zones',
              ),
              const TechnicalQuestionItem(
                icon: LucideIcons.locateFixed,
                title: "Problème de GPS/d’appli",
              ),
              const TechnicalQuestionItem(
                title: "Autre problème",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TechnicalQuestionItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  const TechnicalQuestionItem({
    super.key,
    this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.white.withAlpha(90),
          ),
        ),
      ),
      child: ListTile(
        leading: icon != null
            ? Icon(
                icon,
                color: AppColors.white,
              )
            : null,
        title: MyText.titleMedium(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Icon(
          LucideIcons.chevronRight,
          color: AppColors.white,
        ),
      ),
    );
  }
}

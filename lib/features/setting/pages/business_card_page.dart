import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_app_bar.dart';

import '../../../core/components/my_spacing.dart';
import '../../../core/components/my_text.dart';
import '../../../core/components/saloon_plus_rounded_button.dart';
import '../../../core/utils/font.dart';

class BusinessCardPage extends StatefulWidget {
  const BusinessCardPage({super.key});

  @override
  State<BusinessCardPage> createState() => _BusinessCardPageState();
}

class _BusinessCardPageState extends State<BusinessCardPage> {
  late String cardBackgroundImage;

  @override
  void initState() {
    super.initState();
    cardBackgroundImage = "assets/images/customer/slider_1.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.titleLarge("Carte Professionelle"),
      ),
      body: Container(
        padding: MySpacing.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySpacing.height(20),
            MyText.titleLarge(
              'Carte professionnelle',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            MyText.titleLarge(
              '(pour le travel work)',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            MySpacing.height(16),
            MyText.bodySmall(
              "Cette carte sera visible seulement par les salons avec lesquels vous intéragissez dans le travel work",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            MySpacing.height(16),
            BusinessCard(background: cardBackgroundImage),
            MySpacing.height(32),
            BusinessCardBackgroundPicker(
              initialValue: cardBackgroundImage,
              onChanged: (v) {
                setState(() {
                  cardBackgroundImage = v;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SaloonPlusRoundedButton(
        onPressed: () {},
        child: Icon(
          LucideIcons.arrowRight,
          color: AppColors.white,
          size: 35,
        ),
      ),
    );
  }
}

class BusinessCardBackgroundPicker extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String initialValue;
  const BusinessCardBackgroundPicker({
    super.key,
    required this.onChanged,
    required this.initialValue,
  });

  @override
  State<BusinessCardBackgroundPicker> createState() =>
      _BusinessCardBackgroundPickerState();
}

class _BusinessCardBackgroundPickerState
    extends State<BusinessCardBackgroundPicker> {
  List<String> links = [
    "assets/images/customer/slider_1.png",
    "assets/images/customer/slider_2.png",
    "assets/images/customer/slider_3.png",
    "assets/images/customer/slider_1.png",
  ];
  late String selectedLink;

  @override
  void initState() {
    super.initState();
    selectedLink = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...links.map(
            (link) => CardBackgroundItem(
                assetLink: link,
                isSelected: selectedLink == link,
                onTap: (v) {
                  setState(() {
                    selectedLink = v;
                    widget.onChanged(v);
                  });
                }),
          )
        ],
      ),
    );
  }
}

class CardBackgroundItem extends StatelessWidget {
  final String assetLink;
  final bool isSelected;
  final Function(String) onTap;

  const CardBackgroundItem({
    super.key,
    required this.assetLink,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(10);
    return InkWell(
      onTap: () {
        onTap(assetLink);
      },
      child: Opacity(
        opacity: isSelected ? 1 : 0.5,
        child: Container(
          padding: MySpacing.all(6),
          decoration: BoxDecoration(
            border: isSelected ? Border.all(color: AppColors.black) : null,
            borderRadius: radius,
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: radius,
              image: DecorationImage(
                image: AssetImage(assetLink),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  final String background;
  const BusinessCard({super.key, required this.background});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 197,
        padding: MySpacing.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(background), opacity: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.titleSmall(
                              "Carte pro (Salon)",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            MyText.titleLarge(
                              "Salon Hilligo",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            MyText.labelSmall(
                              "Barbier",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.labelSmall(
                              "07-01-00-00-00",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            MyText.labelMedium(
                              "Travel Work",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            MySpacing.height(10),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/images/icons/saloon_logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      MySpacing.height(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            LucideIcons.star,
                            fill: 1,
                            color: AppColors.black,
                          ),
                          MySpacing.width(8),
                          MyText.labelMedium(
                            "4.76",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.labelSmall(
                  "Note : 4.9",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                MyText.labelSmall(
                  "Effectués : 36",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                MyText.labelSmall(
                  "Annulations : 3",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

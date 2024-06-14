import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/font.dart';
import 'my_spacing.dart';

class GuideView extends StatelessWidget {
  final List<String> items;
  const GuideView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ...items.map((item) {
            var index = items.indexOf(item) + 1;
            return Padding(
              padding: MySpacing.symmetric(vertical: 10),
              child: GuideItem(label: item, order: index),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class GuideItem extends StatelessWidget {
  final int order;
  final String label;
  const GuideItem({super.key, required this.order, required this.label});

  @override
  Widget build(BuildContext context) {
    double size = 40;

    return SizedBox(
      child: Row(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.all(Radius.circular(size)),
            ),
            child: Center(
              child: Text(
                '$order',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
          ),
          MySpacing.width(10),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

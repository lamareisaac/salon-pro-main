import 'package:flutter/material.dart';
import 'package:saloon_pro/core/utils/font.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subTitle;
  final EdgeInsets? padding;
  const SectionTitle(
      {super.key, required this.title, this.subTitle, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: AppFontSize.large,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          getSubTitle(),
        ],
      ),
    );
  }

  Widget getSubTitle() {
    if (subTitle != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          subTitle ?? '',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: AppFontSize.regular,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

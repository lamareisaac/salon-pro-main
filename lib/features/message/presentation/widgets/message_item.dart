import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';

import '../../../../core/components/my_text.dart';
import '../../../../core/utils/font.dart';
import '../../data/models/message_model.dart';

class MessageItem extends StatelessWidget {
  final MessageModel message;
  const MessageItem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MySpacing.vertical(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('assets/images/message_default.png'),
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.titleLarge(
                  message.name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MyText.titleSmall(
                  message.shortMessage,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Opacity(
            opacity: message.readed ? 0 : 1,
            child: Container(
              width: 10,
              height: 10,
              margin: MySpacing.only(left: 3, right: 6),
              decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          Column(
            children: [
              MyText.titleMedium(
                message.typeLabel,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              MyText.titleSmall(
                message.date,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF242424),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/saloon_button.dart';
import '../utils/font.dart';
import 'my_text.dart';
import 'my_spacing.dart';

class ChatMessageRoom extends StatelessWidget {
  final List<ChatMessageModel> messages;
  final Function onTap;
  const ChatMessageRoom({
    super.key,
    required this.messages,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 139),
      child: Container(
        padding: MySpacing.symmetric(horizontal: 8),
        // height: MediaQuery.of(context).size.height - 130,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children:
                        messages.map((e) => ChatMessage(message: e)).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SaloonElevatedButton(
                    minWidth: 200,
                    onPressed: () {
                      onTap();
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.messageSquare,
                            color: AppColors.white,
                          ),
                          MySpacing.width(8),
                          MyText(
                            'Clavarder'.toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MySpacing.width(16),
                  MaterialButton(
                    color: AppColors.black,
                    minWidth: 34,
                    height: 32,
                    padding: MySpacing.all(8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    onPressed: () {},
                    child: Icon(
                      LucideIcons.thumbsDown,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ),
                  MaterialButton(
                    color: AppColors.black,
                    minWidth: 34,
                    height: 32,
                    padding: MySpacing.all(8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    onPressed: () {},
                    child: Icon(
                      LucideIcons.thumbsUp,
                      color: AppColors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final ChatMessageModel message;
  const ChatMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment alignment = message.direction == 'received'
        ? MainAxisAlignment.start
        : MainAxisAlignment.end;
    Color bgColor =
        message.direction == 'received' ? AppColors.white : AppColors.black;

    Color textColor =
        message.direction == 'received' ? AppColors.black : AppColors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Material(
            color: bgColor,
            elevation: 8,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              padding: MySpacing.symmetric(vertical: 16, horizontal: 16),
              decoration: const BoxDecoration(),
              child: MyText.bodyMedium(
                message.message,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessageModel {
  final String direction;
  final String message;

  ChatMessageModel({required this.direction, required this.message});
}

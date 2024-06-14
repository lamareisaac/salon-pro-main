import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/font.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../../../message/presentation/widgets/home_messages.dart';

class PreviewWidget extends StatefulWidget {
  const PreviewWidget({super.key});

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  double radiusSize = 30;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.17,
      decoration: BoxDecoration(
        color: AppColors.white.withAlpha(100),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusSize),
          topRight: Radius.circular(radiusSize),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 6),
                child: MaterialButton(
                  onPressed: () {
                    pushNavigation(context, const HomeMessages());
                  },
                  child: Image.asset(
                    'assets/images/icons/messenger-svgrepo-com1.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Icon(
                LucideIcons.chevronUp,
                color: Colors.red,
                size: 30,
              ),
              Text(
                'Calendrier',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

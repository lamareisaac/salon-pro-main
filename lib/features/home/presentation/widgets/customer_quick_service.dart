import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';

import '../../../../core/components/slise_to_act.dart';
import '../../../../core/utils/font.dart';
import 'background_widget.dart';

class CustomerQuickService extends StatefulWidget {
  final CustomerQuickServiceModel data;
  const CustomerQuickService({super.key, required this.data});

  @override
  State<CustomerQuickService> createState() => _CustomerQuickServiceState();
}

class _CustomerQuickServiceState extends State<CustomerQuickService> {
  CustomerQuickServiceModel get data => widget.data;
  final _slideToActKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double imgSize = 50;
    double iconItemSize = 20;

    return Container(
      margin: MySpacing.horizontal(6),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/customer.png',
                    height: imgSize, width: imgSize),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.getFullNamme,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Client',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 25,
                    padding: const EdgeInsets.only(left: 10, right: 8, top: 3),
                    decoration: BoxDecoration(
                      color: AppColors.darkRed,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Via profil',
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 13,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/icons/staff_labeled.png',
                        width: 37, height: 30),
                    const SizedBox(width: 8),
                    Text(
                      'avec ${data.getFullNamme}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                IconItem(
                  icon: Icon(
                    LucideIcons.clock,
                    size: iconItemSize,
                  ),
                  label: '09:30',
                ),
                IconItem(
                  icon: Icon(
                    LucideIcons.mapPin,
                    size: iconItemSize,
                  ),
                  label: 'Au salon',
                ),
                IconItem(
                  icon: Icon(
                    LucideIcons.timerReset,
                    size: iconItemSize,
                  ),
                  label: '01:09:30',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, top: 8),
                  child: Text(
                    'Shampoing et soins',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, top: 10),
                  child: Text(
                    'Note du client :',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Wrap(
                    children: [
                      Text(
                        'udhjeh dka sadjhwd jds wdejed wjw am wjjaw djdklkjdjkfnjsadncskm.csn,,scmnkmmekks sjbws sjw wjwius sjw wh sdj dhjdjkf eke djdlde',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SlideAction(
                  key: _slideToActKey,
                  height: 52,
                  padding: const EdgeInsets.all(0),
                  sliderButtonIconPadding: 14,
                  sliderButtonYOffset: 0,
                  outerColor: AppColors.swipeableButtonBackgroundColor,
                  innerColor: AppColors.swipeableButtonColor,
                  borderRadius: AppFontSize.swipeRadius,
                  sliderButtonIcon: Icon(
                    LucideIcons.chevronsRight,
                    color: AppColors.white,
                  ),
                  child: Text(
                    'Encaisser',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryIconTheme.color,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  final String label;
  final Widget icon;
  const IconItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

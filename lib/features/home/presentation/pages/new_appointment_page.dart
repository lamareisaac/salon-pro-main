import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';
import 'package:saloon_pro/core/components/my_text.dart';

import '../../../../core/components/saloon_app_bar.dart';
import '../../../../core/components/saloon_button.dart';
import '../../../../core/utils/font.dart';
import '../../../../core/utils/navigation_helper.dart';

class NewAppointmentPage extends StatefulWidget {
  const NewAppointmentPage({super.key});

  @override
  State<NewAppointmentPage> createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  EdgeInsets buttonPadding =
      const EdgeInsets.symmetric(horizontal: 50, vertical: 12);

  @override
  Widget build(BuildContext context) {
    const benefits = [
      DropdownMenuItem(
        child: Text(
          'Choisir une prestation',
        ),
      )
    ];

    const collaborators = [
      DropdownMenuItem(
        child: Text(
          'Choisir un collaborateur',
        ),
      )
    ];

    EdgeInsets pagePadding =
        const EdgeInsets.symmetric(horizontal: 8, vertical: 8);

    var size = MediaQuery.of(context).size;
    var fieldRadius = const BorderRadius.all(Radius.circular(10));

    return Scaffold(
      appBar: SaloonAppBar(
        child: Text(
          'Nouveau rendez vous',
          style: GoogleFonts.dmSans(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: size.height * 0.9),
          padding: pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MySpacing.height(16),
                      Container(
                        padding: MySpacing.only(top: 6, left: 16, bottom: 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: AppColors.lightGrey,
                          ),
                          borderRadius: fieldRadius,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Icon(
                                LucideIcons.userCircle2,
                                size: 50,
                                color: AppColors.lightGrey,
                              ),
                            ),
                            MySpacing.width(8),
                            Expanded(
                              child: Wrap(
                                children: [
                                  MyText.labelLarge(
                                    'Sélectionner un client ou laisser le champ vide',
                                    color: AppColors.black.withAlpha(120),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              LucideIcons.chevronRight,
                              color: AppColors.lightGrey,
                            ),
                          ],
                        ),
                      ),
                      MySpacing.height(24),
                      FormBuilderDropdown(
                        name: 'benefit',
                        items: benefits,
                        icon: Icon(
                          LucideIcons.chevronDown,
                          color: AppColors.lightGrey,
                        ),
                        decoration: InputDecoration(
                          labelText: 'PRESTATION',
                          hintText: 'Choisir une prestation',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 18),
                          focusColor: AppColors.lightGrey,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppColors.lightGrey,
                            ),
                            borderRadius: fieldRadius,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppColors.lightGrey,
                            ),
                            borderRadius: fieldRadius,
                          ),
                        ),
                      ),
                      MySpacing.height(24),
                      SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: FormBuilderDateTimePicker(
                                name: 'start',
                                initialValue: DateTime.now(),
                                format: DateFormat('d/M/y H:mm'),
                                decoration: InputDecoration(
                                  labelText: 'DATE ET HEURE DE DEBUT',
                                  hintText: 'DATE ET HEURE DE DEBUT',
                                  contentPadding: MySpacing.only(
                                      top: 8, bottom: 8, left: 16, right: 8),
                                  focusColor: AppColors.lightGrey,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: AppColors.lightGrey,
                                    ),
                                    borderRadius: fieldRadius,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: AppColors.lightGrey,
                                    ),
                                    borderRadius: fieldRadius,
                                  ),
                                  suffix: Icon(
                                    LucideIcons.chevronDown,
                                    color: AppColors.lightGrey,
                                  ),
                                ),
                              ),
                            ),
                            MySpacing.width(16),
                            SizedBox(
                              width: 100,
                              child: FormBuilderDateTimePicker(
                                name: 'end',
                                initialValue: DateTime.now(),
                                format: DateFormat('H:mm'),
                                decoration: InputDecoration(
                                  labelText: 'FIN',
                                  hintText: 'FIN',
                                  contentPadding: MySpacing.only(
                                      top: 8, bottom: 8, left: 16, right: 8),
                                  focusColor: AppColors.lightGrey,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: AppColors.lightGrey,
                                    ),
                                    borderRadius: fieldRadius,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: AppColors.lightGrey,
                                    ),
                                    borderRadius: fieldRadius,
                                  ),
                                  suffix: Icon(
                                    LucideIcons.chevronDown,
                                    color: AppColors.lightGrey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MySpacing.height(24),
                      FormBuilderDropdown(
                        name: 'collaborators',
                        items: collaborators,
                        icon: Icon(
                          LucideIcons.chevronDown,
                          color: AppColors.lightGrey,
                        ),
                        decoration: InputDecoration(
                          labelText: 'COLLABORATEURS',
                          hintText: 'Choisir un collaborateur',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 18),
                          focusColor: AppColors.lightGrey,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppColors.lightGrey,
                            ),
                            borderRadius: fieldRadius,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppColors.lightGrey,
                            ),
                            borderRadius: fieldRadius,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: MySpacing.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SaloonElevatedButton(
                      label: 'Annuler',
                      backgroundColor: AppColors.white,
                      color: AppColors.black,
                      radius: 8,
                      minWidth: 162,
                      padding: buttonPadding,
                      onPressed: () {
                        popNavigation(context);
                      },
                    ),
                    SaloonElevatedButton(
                      label: 'Enregistrer',
                      radius: 8,
                      minWidth: 162,
                      padding: buttonPadding,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RectanglePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 20;

    // canvas.drawLine(Offset(0, 0), Offset(100, 100), paint);
    // paint.color = Colors.red;
    // canvas.drawLine(Offset(100, 100), Offset(100, 0), paint);
    // paint.color = Colors.green;
    // canvas.drawLine(Offset(0, 0), Offset(100, 0), paint);

    paint.color = Colors.red;

    // canvas.clipRRect(RRect.fromLTRBAndCorners(100, 100, 100, 100));
    // canvas.drawOval(Rect.fromLTWH(50, 50, 100, 100), paint);
    var path = Path();
    // path.moveTo(0, size.width * 1 / 4);
    path.addRRect(
      RRect.fromLTRBAndCorners(
        100,
        150,
        100,
        140,
        topRight: const Radius.circular(10),
      ),
    );
    path.cubicTo(20, 30, 30, 100, 120, 10);
    // path.lineTo(0, 0);
    // path.lineTo(50, 50);
    // path.lineTo(0, 100);

    // path.arcToPoint(Offset(100, 200), radius: Radius.circular(10));
    // path.close();
    // paint.color = Colors.black;
    // path.addPolygon([Offset(10, 200), Offset(50, 100)], true);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

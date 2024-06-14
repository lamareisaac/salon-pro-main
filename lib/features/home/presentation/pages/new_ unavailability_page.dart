import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';

import '../../../../core/components/saloon_app_bar.dart';
import '../../../../core/components/saloon_button.dart';
import '../../../../core/utils/font.dart';

class NewUnavailabilityPage extends StatefulWidget {
  const NewUnavailabilityPage({super.key});

  @override
  State<NewUnavailabilityPage> createState() => _NewUnavailabilityPageState();
}

class _NewUnavailabilityPageState extends State<NewUnavailabilityPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  EdgeInsets buttonPadding =
      const EdgeInsets.symmetric(horizontal: 50, vertical: 12);

  @override
  Widget build(BuildContext context) {
    EdgeInsets pagePadding =
        const EdgeInsets.symmetric(horizontal: 8, vertical: 8);

    var size = MediaQuery.of(context).size;
    var fieldRadius = const BorderRadius.all(Radius.circular(10));

    return Scaffold(
      appBar: SaloonAppBar(
        child: Text(
          'Ajouter une indisponibilité',
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
                      FormBuilderTextField(
                        name: 'reason',
                        decoration: InputDecoration(
                          labelText: 'Raison'.toUpperCase(),
                          hintText: 'Raison',
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

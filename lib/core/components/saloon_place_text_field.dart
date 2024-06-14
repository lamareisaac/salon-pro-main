import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';
import 'package:saloon_pro/core/utils/inputs.dart';

import '../utils/font.dart';

class SaloonPlaceTextField extends StatefulWidget {
  const SaloonPlaceTextField({super.key});

  @override
  State<SaloonPlaceTextField> createState() => _SaloonPlaceTextFieldState();
}

class _SaloonPlaceTextFieldState extends State<SaloonPlaceTextField> {
  int nbPlace = 0;
  final nbPlaceFieldKey = GlobalKey<FormBuilderFieldState>();
  late TextEditingController _nbPlaceController;

  @override
  void initState() {
    super.initState();
    _nbPlaceController = TextEditingController(text: "0$nbPlace");
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.lightGrey.withOpacity(0.5);
    InputBorder fieldBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 0, color: backgroundColor),
      borderRadius: BorderRadius.circular(10),
    );

    return SizedBox(
      child: Row(
        children: [
          IconButton(
            padding: MySpacing.all(10),
            onPressed: () {
              if (nbPlace <= 0) return;
              setState(() {
                nbPlace -= 1;
                _nbPlaceController.text = "$nbPlace".padLeft(2, '0');
              });
            },
            icon: Icon(
              LucideIcons.minus,
              color: AppColors.black,
            ),
            style: IconButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
          ),
          MySpacing.width(10),
          Expanded(
            child: FormBuilderTextField(
              controller: _nbPlaceController,
              key: nbPlaceFieldKey,
              name: 'nb_place',
              // initialValue: nbPlace.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (v) {
                setState(() {
                  nbPlace = v != null ? int.tryParse(v) ?? 0 : 0;
                });
              },
              decoration: AppInputDecoration.defaultInput(
                border: fieldBorder,
                enabledBorder: fieldBorder,
                focusedBorder: fieldBorder,
                fillColor: backgroundColor,
                filled: true,
              ),
            ),
          ),
          MySpacing.width(10),
          IconButton(
            padding: MySpacing.all(10),
            onPressed: () {
              setState(() {
                nbPlace += 1;
                _nbPlaceController.text = "$nbPlace".padLeft(2, '0');
              });
            },
            icon: Icon(
              LucideIcons.plus,
              color: AppColors.black,
            ),
            style: IconButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}

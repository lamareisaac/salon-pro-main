import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saloon_pro/features/authentication/presentation/widgets/section_title.dart';
import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';

class ChooseAccountType extends StatefulWidget {
  final int type;
  final ValueChanged<int> onChanged;
  const ChooseAccountType(
      {super.key, required this.type, required this.onChanged});

  @override
  State<ChooseAccountType> createState() => _ChooseAccountTypeState();
}

class _ChooseAccountTypeState extends State<ChooseAccountType> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _typeAccountFieldKey = GlobalKey<FormBuilderFieldState>();
  int selectedAccountType = 1;

  @override
  void initState() {
    super.initState();
    selectedAccountType = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Quelle type de compte voulez vous ?',
            ),
            MySpacing.height(10),
            FormBuilderRadioGroup(
              key: _typeAccountFieldKey,
              initialValue: selectedAccountType,
              wrapRunSpacing: 35,
              name: 'account-type',
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (v) {
                if (v != null) {
                  widget.onChanged(v);
                }
              },
              options: [
                FormBuilderFieldOption(
                  value: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.titleLarge(
                        'Compte salon',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      MyText.titleMedium("Je suis propriétaire d'un salon"),
                    ],
                  ),
                ),
                FormBuilderFieldOption(
                  value: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.titleLarge(
                        "Compte individuel (artiste)",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      MyText.titleMedium(
                          "l’offre des services à domicile ou/et je travaille dans un salon"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

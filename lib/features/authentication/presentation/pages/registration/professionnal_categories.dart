import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:saloon_pro/core/utils/inputs.dart';

import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';
import '../../widgets/section_title.dart';

class ProfessionalCategories extends StatefulWidget {
  final int? selected;
  final ValueChanged<int?> onChanged;
  const ProfessionalCategories(
      {super.key, this.selected, required this.onChanged});

  @override
  State<ProfessionalCategories> createState() => _ProfessionalCategoriesState();
}

class _ProfessionalCategoriesState extends State<ProfessionalCategories> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _categoryFieldKey = GlobalKey<FormBuilderFieldState>();
  late int? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Choisissez votre categorie professionnelle',
            ),
            MySpacing.height(10),
            FormBuilderRadioGroup<int>(
              key: _categoryFieldKey,
              name: "category",
              initialValue: selected,
              onChanged: (v) {
                if (v != null) {
                  widget.onChanged(v);
                }
              },
              orientation: OptionsOrientation.vertical,
              options: [
                FormBuilderFieldOption(
                  value: 1,
                  child: MyText.labelLarge('Barbier'),
                ),
                FormBuilderFieldOption(
                  value: 2,
                  child: MyText.labelLarge('Tresse'),
                ),
                FormBuilderFieldOption(
                  value: 3,
                  child: MyText.labelLarge('Maquillage'),
                )
              ],
              decoration: AppInputDecoration.defaultInput(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}

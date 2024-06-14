import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/components/my_spacing.dart';
import '../../../core/components/my_text.dart';
import '../../../core/components/saloon_app_bar.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({super.key});

  @override
  State<LanguageSettingPage> createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SaloonAppBar(
        icon: const Icon(LucideIcons.arrowLeft),
        child: MyText.appBarTitle('Langue'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MySpacing.height(16),
            Center(
                child: Image.asset('assets/images/icons/image_language.png')),
            MySpacing.height(16),
            Container(
              padding: MySpacing.symmetric(horizontal: 16),
              child: FormBuilderRadioGroup(
                name: 'lang',
                initialValue: 'fr',
                // materialTapTargetSize: MaterialTapTargetSize.padded,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                options: [
                  FormBuilderFieldOption(
                    value: 'fr',
                    child: Row(
                      children: [
                        Image.asset('assets/images/icons/french_flag.png'),
                        MySpacing.width(8),
                        MyText.labelLarge(
                          'Français',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FormBuilderFieldOption(
                    value: 'en',
                    child: Row(
                      children: [
                        Image.asset('assets/images/icons/english_flag.png'),
                        MySpacing.width(8),
                        MyText.labelLarge(
                          'English',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

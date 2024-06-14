import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/utils/font.dart';
import 'package:saloon_pro/features/authentication/presentation/models/registration_view_model.dart';
import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';
import '../../../../../core/components/saloon_button.dart';
import '../../../../../core/utils/inputs.dart';
import '../../widgets/section_title.dart';

class UserSaloonPhotos extends StatefulWidget {
  SaloonPhotos photos;
  UserSaloonPhotos({super.key, required this.photos});

  @override
  State<UserSaloonPhotos> createState() => _UserSaloonPhotosState();
}

class _UserSaloonPhotosState extends State<UserSaloonPhotos> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _mainPhotoFieldKey = GlobalKey<FormBuilderFieldState>();
  Widget iconImage = Icon(
    LucideIcons.image,
    color: AppColors.grey.withAlpha(150),
    size: 30,
  );
  List<double> dashPattern = const [10, 6];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Ajoutez des photos de votre espace ',
            ),
            MySpacing.height(10),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SaloonElevatedButton(
                    onPressed: () {},
                    backgroundColor: AppColors.white,
                    color: AppColors.black,
                    borderSide: BorderSide(
                      color: AppColors.lightGrey,
                      width: 1,
                    ),
                    radius: 8,
                    elevation: 0,
                    padding: MySpacing.symmetric(vertical: 10, horizontal: 14),
                    child: Row(
                      children: [
                        const Icon(LucideIcons.camera),
                        MySpacing.width(10),
                        MyText.labelSmall(
                          "Prendre une photo",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  MySpacing.height(8),
                  SaloonElevatedButton(
                    onPressed: () {},
                    backgroundColor: AppColors.white,
                    color: AppColors.black,
                    borderSide: BorderSide(
                      color: AppColors.lightGrey,
                      width: 1,
                    ),
                    radius: 8,
                    elevation: 0,
                    padding: MySpacing.symmetric(vertical: 10, horizontal: 14),
                    child: Row(
                      children: [
                        const Icon(LucideIcons.plus),
                        MySpacing.width(10),
                        MyText.labelSmall(
                          "Ajouter une photo",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(14),
            FormBuilderFilePicker(
              key: _mainPhotoFieldKey,
              name: "images",
              decoration: AppInputDecoration.defaultInput(
                contentPadding: MySpacing.symmetric(horizontal: 0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              maxFiles: null,
              previewImages: true,
              onChanged: (val) => print(val),
              typeSelectors: [
                TypeSelector(
                  type: FileType.any,
                  selector: DottedBorder(
                    color: Colors.grey,
                    strokeWidth: 1,
                    dashPattern: dashPattern,
                    child: SizedBox(
                      height: 182,
                      width: MediaQuery.of(context).size.width - 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText.titleMedium("Photo principale"),
                          MySpacing.height(10),
                          MyText.titleSmall(
                              "la plus belle photo de votre espace."),
                          MySpacing.height(10),
                          iconImage,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              onFileLoading: (val) {
                print(val);
              },
            ),
            MySpacing.height(10),
            Row(
              children: [
                secondaryFileWidget(),
                MySpacing.width(16),
                secondaryFileWidget(),
              ],
            ),
            MySpacing.height(10),
            Row(
              children: [
                secondaryFileWidget(),
                MySpacing.width(16),
                secondaryFileWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget secondaryFileWidget({double left = 0}) {
    double miniSize = (MediaQuery.of(context).size.width - 60) / 2;
    return Expanded(
      child: Center(
        child: FormBuilderFilePicker(
          name: "images",
          decoration: AppInputDecoration.defaultInput(
            contentPadding: MySpacing.symmetric(horizontal: 0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          maxFiles: null,
          previewImages: true,
          onChanged: (val) => print(val),
          typeSelectors: [
            TypeSelector(
              type: FileType.image,
              selector: Container(
                width: miniSize,
                height: miniSize,
                // color: Colors.red,
                child: DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 1,
                  dashPattern: dashPattern,
                  child: Center(
                    child: iconImage,
                  ),
                ),
              ),
            ),
          ],
          onFileLoading: (val) {
            print(val);
          },
        ),
      ),
    );
  }
}

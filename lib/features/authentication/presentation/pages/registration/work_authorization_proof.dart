import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:saloon_pro/core/components/my_spacing.dart';

import '../../../../../core/components/my_text.dart';
import '../../../../../core/utils/inputs.dart';
import '../../models/registration_view_model.dart';
import '../../widgets/section_title.dart';

class WorkAuthorizationProof extends StatefulWidget {
  WorkAuthorizationProofModel initialData;
  WorkAuthorizationProof({super.key, required this.initialData});

  @override
  State<WorkAuthorizationProof> createState() => _WorkAuthorizationProofState();
}

class _WorkAuthorizationProofState extends State<WorkAuthorizationProof> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _identityTypeFieldKey = GlobalKey<FormBuilderFieldState>();
  late WorkAuthorizationProofModel formData;

  @override
  void initState() {
    super.initState();
    formData = widget.initialData;
  }

  FileImage? getSelectedImage() {
    var path = formData.idFilePath != "" ? formData.idFilePath : null;
    if (path != null) {
      File file = File(path);
      return FileImage(file);
    }
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
              title: 'Preuve d’autorisation de travail',
            ),
            MySpacing.height(10),
            MyText.bodySmall(
                "Veuillez vous assurer que la photo est nette et que la d’expiration est visible. Les photos difficiles à lire pourraient retarder l’acceptation de votre candidature."),
            MySpacing.height(40),
            FormBuilderDropdown(
              key: _identityTypeFieldKey,
              isExpanded: false,
              name: 'identity_type',
              initialValue: formData.typeID,
              onChanged: (v) {
                if (v != null) {
                  formData.typeID = v;
                }
              },
              items: [
                DropdownMenuItem(
                  value: 'cni',
                  child: MyText.labelMedium("Carte nationale d'identité"),
                ),
                DropdownMenuItem(
                  value: 'passeport',
                  child: MyText.labelMedium("Passeport"),
                )
              ],
              decoration: AppInputDecoration.defaultInput(
                labelText: "Type de votre pièce",
                contentPadding: MySpacing.symmetric(
                  vertical: 5,
                  horizontal: 8,
                ),
              ),
            ),
            MySpacing.height(30),
            FormBuilderFilePicker(
              name: "images",
              decoration: AppInputDecoration.defaultInput(
                  labelText: "Téléversez votre pièce"),
              maxFiles: null,
              previewImages: true,
              onChanged: (val) {
                if (val != null && val.isNotEmpty) {
                  setState(() {
                    var [file] = val;
                    formData.idFilePath = file.path ?? "";
                  });
                } else {
                  setState(() {
                    formData.idFilePath = "";
                  });
                }
              },
              typeSelectors: [
                TypeSelector(
                  type: FileType.any,
                  selector: Container(
                    decoration: BoxDecoration(
                      image: getSelectedImage() != null
                          ? DecorationImage(
                              image: getSelectedImage()!,
                            )
                          : null,
                    ),
                    height: 182,
                    width: MediaQuery.of(context).size.width - 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 88,
                          height: 97,
                          child: Image.asset(
                              "assets/images/icons/televerse-icon.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              onFileLoading: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}

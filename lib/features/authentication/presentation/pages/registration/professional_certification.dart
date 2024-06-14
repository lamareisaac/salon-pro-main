import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';
import '../../../../../core/utils/inputs.dart';
import '../../widgets/section_title.dart';

class ProfessionalCertifcation extends StatefulWidget {
  final String? certification;
  final ValueChanged<String?> onChanged;
  const ProfessionalCertifcation(
      {super.key, this.certification, required this.onChanged});

  @override
  State<ProfessionalCertifcation> createState() =>
      _ProfessionalCertifcationState();
}

class _ProfessionalCertifcationState extends State<ProfessionalCertifcation> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _certificatFieldKey = GlobalKey<FormBuilderFieldState>();
  PlatformFile? certification;

  @override
  void initState() {
    super.initState();
    certification = PlatformFile(
        path: widget.certification, name: 'certification', size: 200);
  }

  FileImage? getSelectedImage() {
    var path = certification?.path != null ? certification?.path : null;
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
              title: 'Preuve ou certification professionnelle',
            ),
            MySpacing.height(10),
            MyText.bodySmall(
                "Veuillez vous assurer que la photo est nette et que la d’expiration est visible. Les photos difficiles à lire pourraient retarder l’acceptation de votre candidature."),
            MySpacing.height(40),
            FormBuilderFilePicker(
              key: _certificatFieldKey,
              name: "images",
              decoration: AppInputDecoration.defaultInput(
                  labelText: "Téleversez votre certificat de barbier"),
              maxFiles: 1,
              previewImages: true,
              onChanged: (val) {
                if (val != null && val.isNotEmpty) {
                  var file = val[0];
                  setState(() {
                    // var [file] = val;
                    certification = file;
                  });
                  widget.onChanged(file.path);
                } else {
                  setState(() {
                    certification = null;
                  });
                  widget.onChanged(null);
                }
              },
              typeSelectors: [
                TypeSelector(
                  type: FileType.any,
                  selector: Container(
                    height: 182,
                    decoration: BoxDecoration(
                      image: getSelectedImage() != null
                          ? DecorationImage(
                              image: getSelectedImage()!,
                            )
                          : null,
                    ),
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
              onFileLoading: (val) {
                print(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}

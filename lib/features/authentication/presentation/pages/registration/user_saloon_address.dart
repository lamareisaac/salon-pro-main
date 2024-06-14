import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../core/components/my_spacing.dart';
import '../../../../../core/components/my_text.dart';
import '../../../../../core/utils/inputs.dart';
import '../../models/registration_view_model.dart';
import '../../widgets/section_title.dart';

class UserSaloonAddress extends StatefulWidget {
  SaloonAddressModel initalData;
  UserSaloonAddress({super.key, required this.initalData});

  @override
  State<UserSaloonAddress> createState() => _UserSaloonAddressState();
}

class _UserSaloonAddressState extends State<UserSaloonAddress> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _leaseFieldKey = GlobalKey<FormBuilderFieldState>();
  final _addressFieldKey = GlobalKey<FormBuilderFieldState>();
  final _buildingNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _houseNumberFieldKey = GlobalKey<FormBuilderFieldState>();
  final _indicationFieldKey = GlobalKey<FormBuilderFieldState>();

  PlatformFile? bail;
  SaloonAddressModel get saloonAddress => widget.initalData;

  @override
  void initState() {
    super.initState();
    bail = saloonAddress.bail != ""
        ? PlatformFile(name: 'bail', size: 100, path: saloonAddress.bail)
        : null;
  }

  FileImage? getSelectedImage({String? old}) {
    String? path = old ?? bail?.path;
    if (path == null) return null;

    File file = File(path);
    return FileImage(file);
  }

  DecorationImage? getDecorationImage(FileImage? fileImage) {
    return fileImage != null
        ? DecorationImage(
            image: getSelectedImage()!,
          )
        : null;
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
              title: 'Ajoutez votre adresse',
              subTitle: "Ou le client peut t-il trouvé votre établissement ?",
            ),
            MySpacing.height(10),
            FormBuilderTextField(
              key: _addressFieldKey,
              name: 'address',
              decoration: AppInputDecoration.defaultInput(labelText: "Adresse"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              onChanged: (v) {
                saloonAddress.address = v ?? "";
                // widget.onChanged(saloonAddress);
              },
            ),
            MySpacing.height(16),
            FormBuilderTextField(
              key: _buildingNameFieldKey,
              name: 'building_name',
              decoration:
                  AppInputDecoration.defaultInput(labelText: "Nom du batiment"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              onChanged: (v) {
                saloonAddress.buildingName = v ?? "";
              },
            ),
            MySpacing.height(16),
            FormBuilderTextField(
              key: _houseNumberFieldKey,
              name: 'house_number',
              decoration:
                  AppInputDecoration.defaultInput(labelText: "Numéro du local"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              onChanged: (v) {
                saloonAddress.appartmentName = v ?? "";
              },
            ),
            MySpacing.height(16),
            FormBuilderTextField(
              key: _indicationFieldKey,
              name: 'indication',
              decoration:
                  AppInputDecoration.defaultInput(labelText: "Indications"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              onChanged: (v) {
                saloonAddress.indications = v ?? "";
              },
            ),
            MySpacing.height(16),
            MyText.bodyMedium(
                "Veuillez vous assurer que la photo est nette et que la d’expiration est visible. Les photos difficiles à lire pourraient retarder l’acceptation de votre candidature."),
            MySpacing.height(18),
            FormBuilderFilePicker(
              key: _leaseFieldKey,
              name: "images",
              decoration: AppInputDecoration.defaultInput(
                  labelText: "Téleversez votre bail"),
              maxFiles: null,
              previewImages: true,
              initialValue: bail != null ? [bail!] : [],
              onChanged: (val) {
                if (val != null && val.isNotEmpty) {
                  var file = val[0];
                  setState(() {
                    bail = file;
                  });
                  saloonAddress.bail = file.path ?? "";
                } else {
                  setState(() {
                    bail = null;
                  });
                  saloonAddress.bail = "";
                }
              },
              typeSelectors: [
                TypeSelector(
                  type: FileType.any,
                  selector: Container(
                    height: 182,
                    decoration: BoxDecoration(
                      image: getDecorationImage(getSelectedImage()),
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
                // print(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../utils/font.dart';
import '../utils/inputs.dart';
import 'my_spacing.dart';
import 'my_text.dart';

class SaloonPhotoPicker extends StatefulWidget {
  final double circleSize;
  final String? photo;
  final ValueChanged<List<PlatformFile>?>? onChanged;
  final bool enabled;
  final Widget? selector;
  final bool isLogo;
  const SaloonPhotoPicker({
    super.key,
    this.circleSize = 100,
    this.photo,
    this.onChanged,
    this.enabled = true,
    this.selector,
    this.isLogo = false,
  });

  @override
  State<SaloonPhotoPicker> createState() => _SaloonPhotoPickerState();
}

class _SaloonPhotoPickerState extends State<SaloonPhotoPicker> {
  PlatformFile? pickPhoto;

  void setPickedPhoto(PlatformFile? v) {
    setState(() {
      pickPhoto = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.circleSize,
        height: widget.circleSize + 4,
        child: FormBuilderFilePicker(
          name: "photo",
          decoration: AppInputDecoration.defaultInput(
            contentPadding: MySpacing.symmetric(horizontal: 0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          enabled: widget.enabled,
          maxFiles: null,
          previewImages: true,
          onChanged: (v) {
            if (v != null) {
              if (v.isNotEmpty) {
                setPickedPhoto(v.first);
              } else {
                setPickedPhoto(null);
              }
            }
            if (widget.onChanged != null) {
              widget.onChanged!(v);
            }
          },
          typeSelectors: [
            TypeSelector(
              type: FileType.image,
              selector: widget.selector != null
                  ? widget.selector!
                  : widget.isLogo
                      ? circleLogo(photo: widget.photo)
                      : circleAvatar(photo: widget.photo),
            ),
          ],
          // customTypeViewerBuilder: (v) {
          //   return Container();
          // },
        ),
      ),
    );
  }

  Widget circleAvatar({String? photo}) {
    return Container(
      width: widget.circleSize,
      height: widget.circleSize,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.lightGrey),
        borderRadius: BorderRadius.all(Radius.circular(widget.circleSize)),
        image: photo != null || pickPhoto != null
            ? DecorationImage(
                image: (pickPhoto != null
                    ? FileImage(File(pickPhoto?.path ?? ""))
                    : AssetImage(photo ?? '')) as ImageProvider,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: photo == null
          ? Center(
              child: Icon(
                LucideIcons.plus,
                color: AppColors.black,
                size: widget.circleSize / 2.5,
              ),
            )
          : null,
    );
  }

  Widget circleLogo({String? photo}) {
    return Container(
      width: widget.circleSize,
      height: widget.circleSize,
      decoration: BoxDecoration(
        color: widget.isLogo ? AppColors.lightGrey.withAlpha(50) : null,
        border: Border.all(width: 1, color: AppColors.lightGrey),
        borderRadius: BorderRadius.all(Radius.circular(widget.circleSize)),
        image: photo != null || pickPhoto != null
            ? DecorationImage(
                image: (pickPhoto != null
                    ? FileImage(File(pickPhoto?.path ?? ""))
                    : AssetImage(photo ?? '')) as ImageProvider,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: photo == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.camera,
                  size: 50,
                  color: AppColors.grey.withAlpha(150),
                ),
                MyText.labelSmall(
                  "Ajouter un logo",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                )
              ],
            )
          : null,
    );
  }
}

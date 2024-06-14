import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../utils/font.dart';
import '../utils/inputs.dart';
import 'my_spacing.dart';

class SaloonSearchInput extends StatefulWidget {
  final ValueChanged<dynamic> onChanged;
  final Function()? onEditingComplete;
  final EdgeInsets? padding;
  const SaloonSearchInput({
    super.key,
    required this.onChanged,
    this.onEditingComplete,
    this.padding,
  });

  @override
  State<SaloonSearchInput> createState() => _SaloonSearchInputState();
}

class _SaloonSearchInputState extends State<SaloonSearchInput> {
  final _searchAddFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? MySpacing.symmetric(horizontal: 16),
      child: FormBuilderTextField(
        key: _searchAddFieldKey,
        name: "search",
        decoration: AppInputDecoration.defaultInput(
          hintText: "Search stores and produ...",
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.myServiceSearchInputBgColor),
            borderRadius: const BorderRadius.all(Radius.circular(80)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.myServiceSearchInputBgColor),
            borderRadius: const BorderRadius.all(Radius.circular(80)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.myServiceSearchInputBgColor),
            borderRadius: const BorderRadius.all(Radius.circular(80)),
          ),
          filled: true,
          fillColor: AppColors.myServiceSearchInputBgColor,
          prefixIcon: const Icon(
            LucideIcons.search,
            color: Color(0xFF6B6B6B),
            size: 20,
          ),
        ),
        onEditingComplete: () {
          if (widget.onEditingComplete != null) {
            widget.onEditingComplete!();
          }
        },
        onChanged: (v) {
          widget.onChanged(v);
        },
      ),
    );
  }
}

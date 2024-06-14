import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../utils/font.dart';
import 'my_spacing.dart';
import 'my_text.dart';

class SaloonCheckBoxList extends StatefulWidget {
  final List<SaloonCheckBoxItemModel> items;
  const SaloonCheckBoxList({super.key, required this.items});

  @override
  State<SaloonCheckBoxList> createState() => _SaloonCheckBoxListState();
}

class _SaloonCheckBoxListState extends State<SaloonCheckBoxList> {
  List<SaloonCheckBoxItemModel> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...items
            .map(
              (item) => Padding(
                padding: MySpacing.only(bottom: 6, top: 6),
                child: SaloonCheckBoxItem(
                  onToggle: (v) {},
                  data: item,
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}

class SaloonCheckBoxItem extends StatefulWidget {
  final SaloonCheckBoxItemModel data;
  final ValueChanged<SaloonCheckBoxItemModel> onToggle;
  const SaloonCheckBoxItem({
    super.key,
    required this.data,
    required this.onToggle,
  });

  @override
  State<SaloonCheckBoxItem> createState() => _SaloonCheckBoxItemState();
}

class _SaloonCheckBoxItemState extends State<SaloonCheckBoxItem> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          active = !active;
        });
        widget.onToggle(widget.data);
      },
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: active ? AppColors.black : null,
                border: Border.all(
                  color: AppColors.black,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: active
                ? Icon(
                    LucideIcons.check,
                    color: AppColors.white,
                  )
                : null,
          ),
          MySpacing.width(16),
          MyText.titleMedium(
            widget.data.label,
          )
        ],
      ),
    );
  }
}

class SaloonCheckBoxItemModel extends Equatable {
  final String value;
  final String label;

  const SaloonCheckBoxItemModel({required this.value, required this.label});

  @override
  List<Object?> get props => [value, label];
}

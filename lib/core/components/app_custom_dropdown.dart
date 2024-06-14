import 'package:flutter/material.dart';

import 'my_spacing.dart';

class AppCustomDropdown<T> extends StatefulWidget {
  final T? initialValue;
  final Widget child;
  final List<AppCustomDropdownItem> items;
  final Color? menuColor;
  final BorderRadius? menuRadius;
  final double? menuMaxWidth;
  final EdgeInsets? padding;
  final EdgeInsets? menuPadding;

  const AppCustomDropdown({
    super.key,
    this.initialValue,
    required this.child,
    required this.items,
    this.menuColor,
    this.menuMaxWidth,
    this.padding,
    this.menuRadius,
    this.menuPadding,
  });

  @override
  _AppCustomDropdownState createState() => _AppCustomDropdownState();
}

class _AppCustomDropdownState<T> extends State<AppCustomDropdown> {
  bool _isDropdownOpen = false;
  T? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.menuMaxWidth,
      child: Stack(
        children: [
          SizedBox(child: () {
            if (_isDropdownOpen) {
              return Container(
                clipBehavior: Clip.hardEdge,
                padding: widget.menuPadding ?? MySpacing.only(top: 60),
                decoration: BoxDecoration(
                  color: widget.menuColor,
                  borderRadius: widget.menuRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.items,
                ),
              );
            }

            return const SizedBox.shrink();
          }()),
          InkWell(
            onTap: () {
              setState(() {
                _isDropdownOpen = !_isDropdownOpen;
              });
            },
            child: Container(padding: widget.padding, child: widget.child),
          ),
        ],
      ),
    );
  }
}

class AppCustomDropdownItem<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T>? onSelected;
  final Widget child;

  AppCustomDropdownItem({
    this.onSelected,
    required this.value,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (onSelected != null) {
            onSelected!(value);
          }
        },
        child: child);
  }
}

import 'package:flutter/material.dart';

import 'my_spacing.dart';

class CustomPageView extends StatefulWidget {
  final List<Widget>? children;
  final double? height;
  final double viewportFraction;
  final bool padEnds;
  final PageController? controller;

  const CustomPageView({
    Key? key,
    this.children,
    this.height,
    this.viewportFraction = 1,
    this.padEnds = true,
    this.controller,
  }) : super(key: key);

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late PageController _pageController;
  bool get padEnds => widget.padEnds;

  @override
  void initState() {
    _pageController = widget.controller ??
        PageController(viewportFraction: widget.viewportFraction);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 0,
      child: PageView(
        clipBehavior: Clip.none,
        controller: _pageController,
        padEnds: false,
        children: (widget.children ?? [])
            .map((e) => Padding(
                  padding: MySpacing.symmetric(horizontal: 0),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

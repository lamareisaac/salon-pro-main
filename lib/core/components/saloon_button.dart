import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/font.dart';
import 'loading.dart';

class SaloonButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color color;
  final Function() onPressed;
  final bool loading;
  final BorderSide? side;
  final double radius;
  final BorderSide borderSide;

  const SaloonButton({
    super.key,
    required this.label,
    this.backgroundColor = Colors.black,
    this.color = Colors.white,
    this.loading = false,
    required this.onPressed,
    this.side,
    this.radius = 30,
    this.borderSide = BorderSide.none,
  });

  @override
  State<SaloonButton> createState() => _SaloonButtonState();
}

class _SaloonButtonState extends State<SaloonButton> {
  String get label => widget.label;
  Color get background => widget.backgroundColor;
  bool get loading => widget.loading;
  BorderSide get borderSide => widget.borderSide;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(45),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        backgroundColor: background,
        side: widget.side,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
      onPressed: widget.onPressed,
      child: loading
          ? const LoadingCircular()
          : Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: widget.color,
              ),
            ),
    );
  }
}

class SaloonElevatedButton extends StatelessWidget {
  final String? label;
  final TextStyle? labelStyle;
  final Color backgroundColor;
  final Color? color;
  final double? height;
  final double radius;
  final EdgeInsets? padding;
  final double? minWidth;
  final Widget? child;
  final double? elevation;
  final BorderSide borderSide;
  final Function() onPressed;

  const SaloonElevatedButton({
    super.key,
    this.color,
    this.height,
    this.labelStyle,
    this.padding,
    this.radius = 30,
    this.label,
    this.minWidth,
    required this.onPressed,
    this.child,
    this.elevation,
    this.borderSide = BorderSide.none,
    this.backgroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      height: height ?? 40,
      minWidth: minWidth,
      elevation: elevation,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
          side: borderSide, borderRadius: BorderRadius.circular(radius)),
      onPressed: onPressed,
      child: child ??
          Text(
            label ?? '',
            style: labelStyle ??
                GoogleFonts.poppins(
                  color: color ?? AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
          ),
    );
  }
}

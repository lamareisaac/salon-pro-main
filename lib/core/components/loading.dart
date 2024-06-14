import 'package:flutter/material.dart';

import '../utils/font.dart';

class LoadingCircular extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingCircular({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: size ?? 40,
        width: size ?? 40,
        child: CircularProgressIndicator(
          color: color ?? AppColors.primary,
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    this.child,
    this.color,
    this.shadowColor,
    required this.borderColor,
    this.padding,
  });

  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  Color borderColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: const Offset(1, 2),
            color: TPColor.black.withOpacity(0.2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        color: TPColor.white,
      ),
      child: child,
    );
  }
}

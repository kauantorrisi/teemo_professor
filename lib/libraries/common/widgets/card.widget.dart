import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.child,
    this.color,
    this.shadowColor,
    this.borderColor,
    this.padding,
    this.height,
    this.width,
  });

  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor ?? TPColor.darkBlue),
        color: color ?? TPColor.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: const Offset(1, 2),
            color: TPColor.black.withOpacity(0.2),
          ),
        ],
      ),
      child: child,
    );
  }
}

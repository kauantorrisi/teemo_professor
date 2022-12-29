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
    this.borderRadius,
    this.margin,
  });

  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
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

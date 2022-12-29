import 'package:flutter/material.dart';

import 'package:teemo_professor/libraries/common/design/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
    this.width,
    this.heigth,
    required this.borderRadius,
  });

  final void Function()? onTap;
  final Widget child;
  final Color? color;
  final double? width;
  final double? heigth;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: TPColor.darkBlue,
      hoverColor: TPColor.darkBlue.withOpacity(0.3),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        height: heigth,
        width: width,
        child: Center(child: child),
      ),
    );
  }
}

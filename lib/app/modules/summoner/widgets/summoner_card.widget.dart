// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {super.key, this.child, this.color, this.shadowColor, this.borderColor});

  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: shadowColor,
      elevation: 10,
      color: color,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide:
            BorderSide(color: borderColor ?? Colors.transparent, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}

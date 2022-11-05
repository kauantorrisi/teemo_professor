import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: TPColor.purple, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}

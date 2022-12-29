import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget(
      {super.key, required this.icon, this.onPressed});

  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.02,
          horizontal: screenSize.width * 0.03,
        ),
        child: FloatingActionButton(
          backgroundColor: TPColor.darkBlue,
          onPressed: onPressed,
          child: Icon(icon),
        ),
      ),
    );
  }
}

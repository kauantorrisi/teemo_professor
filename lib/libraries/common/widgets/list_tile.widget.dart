// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.onTap,
    required this.label,
    this.icon,
  });

  final void Function()? onTap;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
      child: ListTile(
        selectedTileColor: TPColor.darkBlue,
        selected: true,
        selectedColor: TPColor.black,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: TPColor.white),
          borderRadius: BorderRadius.circular(18),
        ),
        title: Text(label,
            style: TPTexts.t4(fontFamily: 'TeemoFont1', color: TPColor.white)),
        leading: Icon(icon, color: TPColor.white, size: 20),
        onTap: onTap,
      ),
    );
  }
}

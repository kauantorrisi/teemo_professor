// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    super.key,
    required this.onTap,
    required this.label,
    required this.selected,
    this.icon,
  });

  final void Function()? onTap;
  final String label;
  bool selected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
      child: ListTile(
        selectedTileColor: TPColor.purple,
        selectedColor: TPColor.black,
        selected: selected,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: TPColor.white),
          borderRadius: BorderRadius.circular(18),
        ),
        title: Text(label, style: TPTexts.t4(fontFamily: 'TeemoFont1')),
        leading: Icon(icon),
        onTap: () {
          onTap;
        },
      ),
    );
  }
}

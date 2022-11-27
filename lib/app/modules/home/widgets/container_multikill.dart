import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/home/home_page_store.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class ContainerMultikill extends StatelessWidget {
  ContainerMultikill({super.key});

  final HomePageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final int? largestMultiKill = store.me.first.largestMultiKill;
    String text = '';

    if (largestMultiKill == 2) text = 'DOUBLE KILL';
    if (largestMultiKill == 3) text = 'TRIPLE KILL';
    if (largestMultiKill == 4) text = 'QUADRA KILL';
    if (largestMultiKill == 5) text = 'PENTAKILL';

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: TPColor.darkBlue,
      ),
      child: Text(text, style: TPTexts.t7(isBold: true)),
    );
  }
}

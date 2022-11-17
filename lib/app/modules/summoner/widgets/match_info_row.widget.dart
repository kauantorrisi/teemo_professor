import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class MatchInfoRowWidget extends StatelessWidget {
  const MatchInfoRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Nick', style: TPTexts.t9()),
        Column(
          children: [
            Text('K/D/A', style: TPTexts.t9()),
            Text('KDA', style: TPTexts.t9()),
          ],
        ),
        Column(
          children: [
            Text('Dano causado', style: TPTexts.t9(color: Colors.red)),
            Text('Dano sofrido', style: TPTexts.t9(color: Colors.grey)),
          ],
        ),
        Column(
          children: [
            Text('Sentinela de controle', style: TPTexts.t9()),
            Text('Wards colocadas / Wards destruídas', style: TPTexts.t9()),
          ],
        ),
        Text('CS', style: TPTexts.t9()),
      ],
    );
  }
}

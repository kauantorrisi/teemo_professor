import 'package:flutter/material.dart';

import 'package:teemo_professor/libraries/common/design/texts.dart';

class ErrorSummonerNotFoundWidget extends StatelessWidget {
  const ErrorSummonerNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Text('Invocador não encontrado!', style: TPTexts.h5()),
        SizedBox(
          height: screenSize.height * 0.2,
          child: Image.network(
            'https://static.wikia.nocookie.net/leagueoflegends/images/1/1b/Does_Not_Compute_Emote.png/revision/latest/scale-to-width-down/90?cb=20171120235504',
          ),
        ),
      ],
    );
  }
}

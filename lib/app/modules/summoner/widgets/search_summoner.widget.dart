import 'package:flutter/material.dart';

import 'package:teemo_professor/libraries/common/design/texts.dart';

class SearchSummonerWidget extends StatelessWidget {
  const SearchSummonerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Text('Procure por alguém!', style: TPTexts.h5()),
        SizedBox(
          height: screenSize.height * 0.2,
          child: Image.network(
            'https://static.wikia.nocookie.net/leagueoflegends/images/9/9b/Carry_Me_Emote.png/revision/latest/scale-to-width-down/90?cb=20200707214209',
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
      ],
    );
  }
}

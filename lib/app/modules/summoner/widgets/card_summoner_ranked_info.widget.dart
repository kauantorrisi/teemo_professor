import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerTappedPage/summoner_tapped_page_store.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

import 'summoner_card.widget.dart';

final SummonerTappedPageStore store = Modular.get();

class CardSummonerRankedInfoWidget extends StatelessWidget {
  const CardSummonerRankedInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: store.tappedSummonerRankedInfoIcon ? 270 : 0,
        height: store.tappedSummonerRankedInfoIcon ? 200 : 0,
        child: CardWidget(
          borderColor:
              store.tappedSummonerRankedInfoIcon ? TPColor.purple : null,
          shadowColor: TPColor.purple,
          child: ListView.builder(
            itemCount: store.entriesInfo.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (store.entriesInfo[index]?.queueType == 'RANKED_SOLO_5x5')
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        CardWidget(
                          borderColor: store.tappedSummonerRankedInfoIcon
                              ? TPColor.purple
                              : null,
                          shadowColor: TPColor.purple,
                          child: Text(
                              '${store.entriesInfo[index]?.queueType}'
                                  .replaceAll('_', ' ')
                                  .replaceAll('5x5', '')
                                  .replaceAll('ANKED', 'anked')
                                  .replaceAll('OLO', 'olo'),
                              style: TPTexts.t5()),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            'Elo: ${store.entriesInfo[index]?.tier?.replaceAll('IRON', 'Ferro').replaceAll('BRONZE', 'Bronze').replaceAll('SILVER', 'Prata').replaceAll('GOLD', 'Ouro').replaceAll('PLATINUM', 'Platina').replaceAll('DIAMOND', 'Diamante').replaceAll('MASTER', 'Mestre').replaceAll('GRANDMASTER', 'Grão-mestre').replaceAll('CHALLENGER', 'Desafiante')} ${store.entriesInfo[index]?.rank}',
                            style: TPTexts.t6()),
                        Text('Vitórias: ${store.entriesInfo[index]?.wins}',
                            style: TPTexts.t6()),
                        Text('Derrotas: ${store.entriesInfo[index]?.losses}',
                            style: TPTexts.t6()),
                      ],
                    ),
                  if (store.entriesInfo[index]?.queueType == 'RANKED_FLEX_SR')
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        CardWidget(
                          borderColor: store.tappedSummonerRankedInfoIcon
                              ? TPColor.purple
                              : null,
                          shadowColor: TPColor.purple,
                          child: Text(
                              '${store.entriesInfo[index]?.queueType}'
                                  .replaceAll('_', ' ')
                                  .replaceAll('5x5', '')
                                  .replaceAll('ANKED', 'anked')
                                  .replaceAll('SR', '')
                                  .replaceAll('LEX', 'lex'),
                              style: TPTexts.t5()),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            'Elo: ${store.entriesInfo[index]?.tier?.replaceAll('IRON', 'Ferro').replaceAll('BRONZE', 'Bronze').replaceAll('SILVER', 'Prata').replaceAll('GOLD', 'Ouro').replaceAll('PLATINUM', 'Platina').replaceAll('DIAMOND', 'Diamante').replaceAll('MASTER', 'Mestre').replaceAll('GRANDMASTER', 'Grão-mestre').replaceAll('CHALLENGER', 'Desafiante')} ${store.entriesInfo[index]?.rank}',
                            style: TPTexts.t6()),
                        Text('Vitórias: ${store.entriesInfo[index]?.wins}',
                            style: TPTexts.t6()),
                        Text('Derrotas: ${store.entriesInfo[index]?.losses}',
                            style: TPTexts.t6()),
                      ],
                    ),
                  if (store.entriesInfo[index]?.queueType ==
                      'RANKED_TFT_DOUBLE_UP')
                    Column(
                      children: [
                        CardWidget(
                          borderColor: store.tappedSummonerRankedInfoIcon
                              ? TPColor.purple
                              : null,
                          shadowColor: TPColor.purple,
                          child: Text(
                              '${store.entriesInfo[index]?.queueType}'
                                  .replaceAll('_', ' ')
                                  .replaceAll('DOUBLE UP', ''),
                              style: TPTexts.t5()),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            'Elo: ${store.entriesInfo[index]?.tier?.replaceAll('IRON', 'Ferro').replaceAll('BRONZE', 'Bronze').replaceAll('SILVER', 'Prata').replaceAll('GOLD', 'Ouro').replaceAll('PLATINUM', 'Platina').replaceAll('DIAMOND', 'Diamante').replaceAll('MASTER', 'Mestre').replaceAll('GRANDMASTER', 'Grão-mestre').replaceAll('CHALLENGER', 'Desafiante')} ${store.entriesInfo[index]?.rank}',
                            style: TPTexts.t6()),
                        Text('Vitórias: ${store.entriesInfo[index]?.wins}',
                            style: TPTexts.t6()),
                        Text('Derrotas: ${store.entriesInfo[index]?.losses}',
                            style: TPTexts.t6()),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}

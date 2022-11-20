import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/button.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/card_summoner_ranked_info.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/card.widget.dart';

final SummonerPageStore store = Modular.get();

class CardSummonerInfoWidget extends StatelessWidget {
  const CardSummonerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          SizedBox(
            width: 300,
            child: CardWidget(
              borderColor: TPColor.purple,
              shadowColor: TPColor.purple,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: TPColor.black, width: 1),
                            borderRadius: BorderRadius.circular(26)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image.network(
                                '$LOL_SUMMONERICONS${store.summonerByName?.profileIconId}.png',
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                        'lib/assets/images/error.image.png'))),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Text('${store.summonerByName?.name}',
                              style: TPTexts.h6()),
                          Text('Level: ${store.summonerByName?.summonerLevel}',
                              style: TPTexts.t7()),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ButtonWidget(
                    heigth: 30,
                    borderRadius: 24,
                    onTap: () => store.toggleArrowButton(),
                    child: store.tappedSummonerRankedInfoIcon
                        ? const Icon(Icons.arrow_upward,
                            size: 20, color: TPColor.black)
                        : const Icon(Icons.arrow_downward,
                            size: 20, color: TPColor.black),
                  ),
                ],
              ),
            ),
          ),
          const CardSummonerRankedInfoWidget(),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/libraries/common/constants.dart';

final SummonerPageStore store = Modular.get();

class SummonerSpellsWidget extends StatelessWidget {
  const SummonerSpellsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          if (store.isMySpell && store.summonerSpellId.first != null)
            SizedBox(
              height: 24,
              child: Image.network(
                  '$URL_IMGSPELLSSUMMONER${store.summonerSpellId.first}.png'),
            ),
          if (store.isMySecondSpell && store.summonerSpellId2.first != null)
            SizedBox(
              height: 24,
              child: Image.network(
                  '$URL_IMGSPELLSSUMMONER${store.summonerSpellId2.first}.png'),
            ),
        ],
      );
    });
  }
}

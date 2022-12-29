import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

final SummonerPageStore store = Modular.get();

class SummonerControlWardsAndCsWidget extends StatelessWidget {
  const SummonerControlWardsAndCsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final num totalCs = store.me.first.totalMinionsKilled! +
        store.me.first.neutralMinionsKilled!;

    return Observer(builder: (_) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pinks: ${store.me.first.detectorWardsPlaced}',
            style: TPTexts.t8(),
          ),
          Text(
            'Wards: ${store.me.first.wardsPlaced}',
            style: TPTexts.t8(),
          ),
          Text('$totalCs CS', style: TPTexts.t8()),
        ],
      );
    });
  }
}

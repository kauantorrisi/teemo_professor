import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

final SummonerPageStore store = Modular.get();

class SummonerKDAWidget extends StatelessWidget {
  const SummonerKDAWidget({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic kills = store.me.first.kills;
    dynamic deaths = store.me.first.deaths;
    dynamic assists = store.me.first.assists;
    final double kda = (kills + assists) / deaths;

    return Column(
      children: [
        Observer(builder: (_) {
          return Row(
            children: [
              Text('${store.me.first.kills}/', style: TPTexts.t7()),
              Text('${store.me.first.deaths}/', style: TPTexts.t7()),
              Text('${store.me.first.assists}', style: TPTexts.t7()),
            ],
          );
        }),
        if (kda.toString() != 'NaN')
          Text('${kda.toStringAsFixed(1)} KDA',
              style: TPTexts.t8(color: TPColor.grey)),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:teemo_professor/app/modules/home/home_page_store.dart';
import 'package:teemo_professor/app/modules/home/widgets/card_summoner_info.widget.dart';
import 'package:teemo_professor/app/modules/home/widgets/card_summoner_last_matches_info.widget.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/card.widget.dart';

class SummonerPage extends StatelessWidget {
  SummonerPage({super.key});

  final HomePageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(store.summonerByName!.name!,
              style: TPTexts.h1(color: TPColor.white)),
          backgroundColor: TPColor.darkBlue,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CardSummonerInfoWidget(),
              SizedBox(height: 14.h),
              textLastMatchsPlayed(),
              SizedBox(height: 14.h),
              listLastMatchsPlayed()
            ],
          ),
        ));
  }

  Widget textLastMatchsPlayed() {
    return CardWidget(
      color: TPColor.darkBlue,
      child: Text(
        'Últimas partidas jogadas:',
        style: TPTexts.t1(color: TPColor.white),
      ),
    );
  }

  Widget listLastMatchsPlayed() {
    return Expanded(
      child: ListView.builder(
        itemCount: store.me.length,
        itemBuilder: (context, index) => CardSummonerLastMatchesInfo(
          me: store.me[index],
          isMySpell: store.isMySpell,
          isMySecondSpell: store.isMySecondSpell,
          summonerSpellId: store.summonerSpellId[index],
          summonerSpellId2: store.summonerSpellId2[index],
          info: store.matchs[index]!.info!,
        ),
      ),
    );
  }
}

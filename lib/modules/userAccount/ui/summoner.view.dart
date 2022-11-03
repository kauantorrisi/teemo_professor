import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/drawer.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/summoner_card.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/textform_fields.widget.dart';
import 'package:teemo_professor/modules/userAccount/store/summoner.store.dart';

class SummonerView extends StatelessWidget {
  SummonerView({super.key});

  final SummonerStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        drawer: const DrawerWidget(),
        body: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormFieldWidget(
                  text: 'Pesquise um invocador (BR)',
                  controller: store.searchController,
                  onFieldSubmitted: (_) async {
                    if (store.searchController.text.isNotEmpty) {
                      store.onSearch();
                    }
                  }),
              if (store.summonerByName == null && store.rankedInfo == null ||
                  store.searchController.text.isEmpty)
                Column(
                  children: [
                    Text('Tente procurar por alguém!', style: TPTexts.h5()),
                    SizedBox(
                      height: screenSize.height * 0.3,
                      child: Image.network(
                          'https://giffiles.alphacoders.com/141/14109.gif'),
                    ),
                  ],
                ),
              if (store.isError == true)
                Column(
                  children: [
                    Text('Invocador não encontrado!', style: TPTexts.h5()),
                    SizedBox(
                      height: screenSize.height * 0.3,
                      child: Image.network(
                          'https://vignette.wikia.nocookie.net/leagueoflegends/images/d/d5/LoL_Facebook_Icon_16.gif/revision/latest?cb=20161029213900'),
                    ),
                  ],
                ),
              if (store.summonerByName != null &&
                  store.rankedInfo != null &&
                  store.isError == false &&
                  store.searchController.text.isNotEmpty)
                CardWidget(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: TPColor.black, width: 2),
                            ),
                            child: Image.network(
                                '$LOL_ICONS${store.summonerByName?.profileIconId}.png'),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Text('${store.summonerByName?.name}',
                                  style: TPTexts.h6()),
                              Text(
                                  'Level: ${store.summonerByName?.summonerLevel}',
                                  style: TPTexts.t7()),
                            ],
                          ),
                        ],
                      ),
                      Text(
                          'Elo: ${store.rankedInfo?.tier} ${store.rankedInfo?.rank}',
                          style: TPTexts.t6()),
                      Text('Vitórias: ${store.rankedInfo?.wins}',
                          style: TPTexts.t6()),
                      Text('Derrotas: ${store.rankedInfo?.losses}',
                          style: TPTexts.t6()),
                      Text('Pontos de Maestria: ${store.totalMasteryPoints}',
                          style: TPTexts.t6()),
                      if (store.rankedInfo?.queueType == 'RANKED_FLEX_SR')
                        Text('Modo de jogo: Ranked Flex', style: TPTexts.t6()),
                      if (store.rankedInfo?.queueType == 'RANKED_SOLO_5x5')
                        Text('Modo de jogo: Ranked Solo/Duo',
                            style: TPTexts.t6()),
                    ],
                  ),
                ),
              if (store.summonerByName != null &&
                  store.rankedInfo != null &&
                  store.isError == false &&
                  store.searchController.text.isNotEmpty)
                Column(
                  children: [
                    Text('Última partida jogada:', style: TPTexts.h8()),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
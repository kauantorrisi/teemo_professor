import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/app/widgets/app_bar.widget.dart';
import 'package:teemo_professor/app/widgets/drawer.widget.dart';
import 'package:teemo_professor/app/widgets/summoner_card.widget.dart';
import 'package:teemo_professor/app/widgets/textform_fields.widget.dart';
import 'package:teemo_professor/app/modules/summoner/summoner_store.dart';

class SummonerPage extends StatefulWidget {
  SummonerPage({super.key});

  @override
  State<SummonerPage> createState() => _SummonerViewState();
}

class _SummonerViewState extends State<SummonerPage> {
  final SummonerStore store = Modular.get();

  @override
  void initState() {
    store.initState();
    super.initState();
  }

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
                  await store.onSearch();
                },
              ),
              if (store.summonerByName == null ||
                  store.searchController.text.isEmpty)
                rankedInfoWidget,
              if (store.isError == true &&
                  store.searchController.text.isNotEmpty)
                errorSummonerNotFound,
              if (store.summonerByName != null &&
                  store.entriesInfo != null &&
                  store.isError == false &&
                  store.searchController.text.isNotEmpty)
                summonerCard,
            ],
          );
        }),
      ),
    );
  }

  Widget get rankedInfoWidget {
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
        Text('${store.rankedChallengerSoloQInfo!.tier}', style: TPTexts.h8()),
        Text(
          store.rankedChallengerSoloQInfo!.queue!.replaceAll(RegExp(r'_'), ' '),
          style: TPTexts.t7(),
        ),
        SizedBox(
          width: double.infinity,
          height: screenSize.height * 0.4,
          child: ListView.builder(
            itemCount: store.rankedChallengerSoloQInfo!.entries!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    '${store.rankedChallengerSoloQInfo!.entries![index]!.summonerName}'),
              );
            },
          ),
        )
      ],
    );
  }

  Widget get errorSummonerNotFound {
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

  Widget get summonerCard {
    return CardWidget(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: TPColor.black, width: 2),
                ),
                child: Image.network(
                    '$LOL_ICONS${store.summonerByName?.profileIconId}.png',
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('lib/assets/images/error.image.png')),
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text('${store.summonerByName?.name}', style: TPTexts.h6()),
                  Text('Level: ${store.summonerByName?.summonerLevel}',
                      style: TPTexts.t7()),
                ],
              ),
            ],
          ),
          Text('Elo: ${store.entriesInfo?.tier} ${store.entriesInfo?.rank}',
              style: TPTexts.t6()),
          Text('Vitórias: ${store.entriesInfo?.wins}', style: TPTexts.t6()),
          Text('Derrotas: ${store.entriesInfo?.losses}', style: TPTexts.t6()),
          Text('Pontos de Maestria: ${store.totalMasteryPoints}',
              style: TPTexts.t6()),
          if (store.entriesInfo?.queueType == 'RANKED_FLEX_SR')
            Text('Modo de jogo: Ranked Flex', style: TPTexts.t6()),
          if (store.entriesInfo?.queueType == 'RANKED_SOLO_5x5')
            Text('Modo de jogo: Ranked Solo/Duo', style: TPTexts.t6()),
        ],
      ),
    );
  }
}

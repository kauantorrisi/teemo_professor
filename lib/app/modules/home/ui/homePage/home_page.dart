import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:teemo_professor/app/modules/home/ui/homePage/home_page_store.dart';
import 'package:teemo_professor/libraries/common/models/entry.model.dart';
import 'package:teemo_professor/libraries/common/widgets/card.widget.dart';
import 'package:teemo_professor/app/modules/home/ui/homePage/widgets/card_favorite_summoner.widget.dart';
import 'package:teemo_professor/app/modules/home/ui/summoner/widgets/card_summoner_last_matches_info.widget.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/drawer.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/loading_widget.dart';
import 'package:teemo_professor/libraries/common/widgets/text_formField.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = Modular.get();

  @override
  void initState() {
    store.getRankedChallengerSoloQInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        builder: (BuildContext context, Widget? child) {
          return Observer(builder: (context) {
            return SafeArea(
              child: Scaffold(
                appBar: const AppBarWidget(),
                drawer: const DrawerWidget(),
                body: store.isLoading == true
                    ? const LoadingWidget()
                    : Column(
                        children: [
                          TextFormFieldWidget(
                            text: 'Pesquise um invocador (BR)',
                            controller: store.searchController,
                            onFieldSubmitted: (_) async {
                              await store.onSearch();
                            },
                          ),
                          const SizedBox(height: 20),
                          listFavoriteSummoners(),
                          const SizedBox(height: 20),
                          listTopRankSummoners(
                            store.rankedChallengerSoloQInfo?.entries,
                          ),
                        ],
                      ),
              ),
            );
          });
        });
  }

  Widget listFavoriteSummoners() {
    return CardWidget(
      color: TPColor.blue,
      width: 350.w,
      height: 200.h,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: TPColor.darkBlue,
            ),
            child: Center(
              child: Text(
                'Invocadores Favoritos',
                style: TPTexts.t4(color: TPColor.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: store.favoriteSummoners.length,
              itemBuilder: (context, index) => Column(
                children: [
                  store.isFavorite
                      ? CardFavoriteSummonerWidget(
                          favoriteSummoner: store.favoriteSummoners[index],
                          favoriteSummonerEntries:
                              store.favoriteSummonersEntriesModel[index],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listTopRankSummoners(List<EntryModel?>? entries) {
    return CardWidget(
      width: 350.w,
      height: 400.h,
      color: TPColor.blue,
      child: Column(
        children: [
          Text('Ranqueada 2022', style: TPTexts.t1()),
          const SizedBox(height: 5),
          selectTopRankInfoRow(),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: entries!.length,
              itemBuilder: (context, index) {
                int wins = entries[index]!.wins!;
                int losses = entries[index]!.losses!;
                int totalMatchsPlayed = wins + losses;

                return CardWidget(
                  child: ListTile(
                    title: Text(
                      '${entries[index]?.summonerName}',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vitórias: ${entries[index]?.wins}',
                        ),
                        Text(
                          'Derrotas: ${entries[index]?.losses}',
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pontos: ${entries[index]?.leaguePoints}',
                        ),
                        Text(
                          'Partidas jogadas: $totalMatchsPlayed',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget selectTopRankInfoRow() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: TPColor.darkBlue,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              'Melhores jogadores',
              style: TPTexts.t6(color: TPColor.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_downward,
              color: TPColor.orange,
            ),
          ),
          Text('Solo / Duo', style: TPTexts.t6(color: TPColor.white)),
          const SizedBox(width: 15),
          SizedBox(
            height: 30,
            child: Image.asset('lib/assets/images/9.png'),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_downward,
              color: TPColor.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget listSummonerLastMatches() {
    return SizedBox(
      height: 2950.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: store.matchs.length,
        itemBuilder: (context, index) => CardSummonerLastMatchesInfo(
          info: store.matchs[index]!.info!,
          isMySpell: store.isMySpell,
          isMySecondSpell: store.isMySecondSpell,
          me: store.me[index],
          summonerSpellId: store.summonerSpellId[index],
          summonerSpellId2: store.summonerSpellId2[index],
        ),
      ),
    );
  }
}

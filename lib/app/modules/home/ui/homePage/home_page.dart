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
        builder: (context, child) {
          return Observer(builder: (context) {
            return Scaffold(
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
                            Modular.to.pushNamed('/summoner-page');
                          },
                        ),
                        const SizedBox(height: 20),
                        listFavoriteSummoners(),
                        const SizedBox(height: 20),
                        cardRankScoreInfo(),
                      ],
                    ),
            );
          });
        });
  }

  Widget listFavoriteSummoners() {
    return Observer(builder: (context) {
      return CardWidget(
        color: TPColor.blue,
        width: 350.w,
        height: 220.h,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: TPColor.darkBlue,
                borderRadius: BorderRadius.circular(20),
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
    });
  }

  Widget cardRankScoreInfo() {
    return CardWidget(
      width: 350.w,
      height: 400.h,
      color: TPColor.blue,
      child: Column(
        children: [
          cardHeader(),
          const SizedBox(height: 5),
          cardBody(store.rankedChallengerSoloQInfo!.entries),
        ],
      ),
    );
  }

  Widget cardHeader() {
    return Column(
      children: [
        Text('Temporada 2022', style: TPTexts.t1()),
        const SizedBox(height: 5),
        CardWidget(
          color: TPColor.darkBlue,
          child: Row(
            children: [
              rankTypeDropDownButton(),
              const Spacer(),
              rankModeDropDownButton(),
              const Spacer(),
              store.selectedBestPlayers
                  ? rankEloDropDownButton()
                  : rankTierDropDownButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget rankTypeDropDownButton() {
    final ValueNotifier<String> rankTypeValue = ValueNotifier('');
    final List<String> rankTypeOptions = ['Melhores jogadores', 'Minhas ligas'];

    return ValueListenableBuilder(
      valueListenable: rankTypeValue,
      builder: (context, value, _) {
        return DropdownButton(
            hint: Text(
              'Melhores jogadores',
              style: TPTexts.t6(color: TPColor.white),
            ),
            value: (value.isEmpty) ? null : value,
            alignment: AlignmentDirectional.center,
            dropdownColor: TPColor.darkBlue,
            items: rankTypeOptions
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(
                        option,
                        style: TPTexts.t5(color: TPColor.white),
                      ),
                    ))
                .toList(),
            icon: const Icon(Icons.arrow_drop_down, color: TPColor.orange),
            onChanged: (choice) {
              rankTypeValue.value = choice.toString();
              if (choice.toString() == 'Minhas ligas') {
                store.setSelectedBestPlayers(false);
              } else {
                store.setSelectedBestPlayers(true);
              }
            });
      },
    );
  }

  Widget rankModeDropDownButton() {
    final ValueNotifier<String> rankModeValue = ValueNotifier('');
    final List<String> rankModeOptions = ['Solo / Duo', 'Flex 5x5'];

    return ValueListenableBuilder(
      valueListenable: rankModeValue,
      builder: (context, value, _) {
        return DropdownButton(
          hint: Text(
            'Solo / Duo',
            style: TPTexts.t6(color: TPColor.white),
          ),
          value: (value.isEmpty) ? null : value,
          alignment: AlignmentDirectional.center,
          borderRadius: BorderRadius.circular(20),
          dropdownColor: TPColor.darkBlue,
          items: rankModeOptions
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(
                      option,
                      style: TPTexts.t5(color: TPColor.white),
                    ),
                  ))
              .toList(),
          icon: const Icon(Icons.arrow_drop_down, color: TPColor.orange),
          onChanged: (choice) => rankModeValue.value = choice.toString(),
        );
      },
    );
  }

  Widget rankEloDropDownButton() {
    final ValueNotifier<String> rankEloValue = ValueNotifier('');
    final List<String> rankEloOptions = ['Desafiante', 'Grão-Mestre', 'Mestre'];

    return store.selectedBestPlayers
        ? ValueListenableBuilder(
            valueListenable: rankEloValue,
            builder: (context, value, _) {
              return DropdownButton(
                hint: SizedBox(
                  width: 40,
                  child: Image.asset('lib/assets/images/9.png'),
                ),
                value: (value.isEmpty) ? null : value,
                alignment: AlignmentDirectional.center,
                dropdownColor: TPColor.darkBlue,
                items: rankEloOptions
                    .map(
                      (option) => DropdownMenuItem(
                        value: option,
                        child: option == 'Desafiante'
                            ? SizedBox(
                                width: 40,
                                child: Image.asset('lib/assets/images/9.png'),
                              )
                            : option == 'Grão-Mestre'
                                ? SizedBox(
                                    width: 40,
                                    child:
                                        Image.asset('lib/assets/images/8.png'),
                                  )
                                : SizedBox(
                                    width: 40,
                                    child:
                                        Image.asset('lib/assets/images/7.webp'),
                                  ),
                      ),
                    )
                    .toList(),
                icon: const Icon(Icons.arrow_drop_down, color: TPColor.orange),
                onChanged: (choice) => rankEloValue.value = choice.toString(),
              );
            },
          )
        : rankTierDropDownButton();
  }

  Widget rankTierDropDownButton() {
    final ValueNotifier<String> rankEloValue = ValueNotifier('');
    final List<String> rankEloOptions = ['I', 'II', 'III', 'IV'];

    return ValueListenableBuilder(
      valueListenable: rankEloValue,
      builder: (context, value, _) {
        return DropdownButton(
          hint: Image.asset('lib/assets/images/5.png', width: 30),
          value: (value.isEmpty) ? null : value,
          alignment: AlignmentDirectional.center,
          dropdownColor: TPColor.darkBlue,
          items: rankEloOptions
              .map(
                (option) => DropdownMenuItem(
                    value: option,
                    child: Row(
                      children: [
                        Image.asset('lib/assets/images/5.png', width: 30),
                        Text(
                          ' $option',
                          style: TPTexts.t8(color: TPColor.white),
                        ),
                      ],
                    )),
              )
              .toList(),
          icon: const Icon(Icons.arrow_drop_down, color: TPColor.orange),
          onChanged: (choice) => rankEloValue.value = choice.toString(),
        );
      },
    );
  }

  Widget cardBody(List<EntryModel?>? entries) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: entries!.length,
          itemBuilder: (context, index) {
            int totalMatchsPlayed =
                entries[index]!.wins! + entries[index]!.losses!;

            return CardWidget(
              child: ListTile(
                title: Text(
                  entries[index]!.summonerName!,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vitórias: ${entries[index]!.wins}',
                    ),
                    Text(
                      'Derrotas: ${entries[index]!.losses}',
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pontos: ${entries[index]!.leaguePoints}',
                    ),
                    Text(
                      'Partidas jogadas: $totalMatchsPlayed',
                    ),
                  ],
                ),
              ),
            );
          }),
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

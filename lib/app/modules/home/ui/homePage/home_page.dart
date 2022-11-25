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
    store.makeRequestRankedInfoListBasedInUserChoice();
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
      height: 405.h,
      color: TPColor.blue,
      child: Column(
        children: [
          titleAndDropDownButtonsRow(),
          const SizedBox(height: 5),
          store.isLoadingList == true
              ? loadingList()
              : (store.selectedBestPlayers == true)
                  ? listSummonersRankScore(store.rankedModel!.entries)
                  : listSummonersRankScore(store.diamondToIronEntriesInfo)
        ],
      ),
    );
  }

  Widget titleAndDropDownButtonsRow() {
    return Column(
      children: [
        Text('Temporada 2022', style: TPTexts.t1()),
        const SizedBox(height: 5),
        CardWidget(
          color: TPColor.darkBlue,
          child: Column(
            children: [
              Row(
                children: [
                  rankTypeDropDownButton(),
                  const Spacer(),
                  rankModeDropDownButton(),
                  const Spacer(),
                  store.selectedBestPlayers == true
                      ? rankEloDropDownButton()
                      : rankTierDropDownButton(),
                ],
              ),
              if (store.selectedBestPlayers == false) rowSelectEloButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget rankTypeDropDownButton() {
    final List<String> rankTypeOptions = ['Melhores jogadores', 'Ligas'];

    return ValueListenableBuilder(
      valueListenable: store.rankTypeValue,
      builder: (context, value, _) {
        return DropdownButton(
            hint: Text(
              'Melhores jogadores',
              style: TPTexts.t6(color: TPColor.white),
            ),
            value: value.isEmpty ? null : value,
            alignment: AlignmentDirectional.center,
            dropdownColor: TPColor.darkBlue,
            borderRadius: BorderRadius.circular(20),
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
            onChanged: store.isLoadingList == true
                ? null
                : (choice) {
                    store.rankTypeValue.value = choice.toString();
                    switch (choice.toString()) {
                      case 'Melhores jogadores':
                        store.setSelectedBestPlayers(true);
                        store.makeRequestRankedInfoListBasedInUserChoice();
                        break;
                      case 'Ligas':
                        store.setSelectedBestPlayers(false);
                        store.makeRequestRankedInfoListBasedInUserChoice();
                        break;
                    }
                  });
      },
    );
  }

  Widget rankModeDropDownButton() {
    final List<String> rankModeOptions = [
      'Solo / Duo',
      'Flex 5x5',
    ];

    return ValueListenableBuilder(
      valueListenable: store.rankModeValue,
      builder: (context, value, _) {
        return DropdownButton(
            hint: Text(
              'Solo / Duo',
              style: TPTexts.t5(color: TPColor.white),
            ),
            value: (store.rankModeValue.value.isEmpty)
                ? null
                : store.rankModeValue.value,
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
            onChanged: store.isLoadingList == true
                ? null
                : (choice) {
                    store.rankModeValue.value = choice.toString();
                    if (choice.toString() == 'Solo / Duo') {
                      store.setSelectedSoloQ(true);
                      store.makeRequestRankedInfoListBasedInUserChoice();
                    } else {
                      store.setSelectedSoloQ(false);
                      store.makeRequestRankedInfoListBasedInUserChoice();
                    }
                  });
      },
    );
  }

  Widget rankEloDropDownButton() {
    final List<String> rankEloOptions = ['Desafiante', 'Grão-Mestre', 'Mestre'];

    return ValueListenableBuilder(
      valueListenable: store.rankEloValue,
      builder: (context, value, _) {
        return DropdownButton(
            hint: eloImg('lib/assets/images/9.png'),
            alignment: AlignmentDirectional.center,
            dropdownColor: TPColor.darkBlue,
            borderRadius: BorderRadius.circular(20),
            value: value.isEmpty ? null : value,
            items: rankEloOptions
                .map(
                  (option) => DropdownMenuItem(
                      value: option,
                      child: option == 'Desafiante'
                          ? eloImg('lib/assets/images/9.png')
                          : option == 'Grão-Mestre'
                              ? eloImg('lib/assets/images/8.png')
                              : eloImg('lib/assets/images/7.webp')),
                )
                .toList(),
            icon: const Icon(Icons.arrow_drop_down, color: TPColor.orange),
            onChanged: store.isLoadingList == true
                ? null
                : (choice) async {
                    store.rankEloValue.value = choice.toString();
                    if (choice.toString() == 'Desafiante') {
                      store.setSelectedChallenger(true);
                      store.setSelectedGrandMaster(false);
                      store.setSelectedMaster(false);
                      store.makeRequestRankedInfoListBasedInUserChoice();
                    } else if (choice.toString() == 'Grão-Mestre') {
                      store.setSelectedGrandMaster(true);
                      store.setSelectedChallenger(false);
                      store.setSelectedMaster(false);
                      store.makeRequestRankedInfoListBasedInUserChoice();
                    } else {
                      store.setSelectedMaster(true);
                      store.setSelectedChallenger(false);
                      store.setSelectedGrandMaster(false);
                      store.makeRequestRankedInfoListBasedInUserChoice();
                    }
                  });
      },
    );
  }

  Widget rankTierDropDownButton() {
    final List<String> rankTierOptions = ['I', 'II', 'III', 'IV'];

    return ValueListenableBuilder(
      valueListenable: store.rankTierValue,
      builder: (context, value, _) {
        return DropdownButton(
            hint: Row(
              children: [
                if (store.selectedElo == 'Iron')
                  Image.asset('lib/assets/images/1.png', width: 30),
                if (store.selectedElo == 'Bronze')
                  Image.asset('lib/assets/images/2.png', width: 30),
                if (store.selectedElo == 'Silver')
                  Image.asset('lib/assets/images/3.webp', width: 30),
                if (store.selectedElo == 'Gold')
                  Image.asset('lib/assets/images/4.webp', width: 30),
                if (store.selectedElo == 'Platinum')
                  Image.asset('lib/assets/images/5.png', width: 30),
                if (store.selectedElo == 'Diamond')
                  Image.asset('lib/assets/images/6.png', width: 30),
                Text(store.selectedTier!,
                    style: TPTexts.t8(color: TPColor.white)),
              ],
            ),
            alignment: AlignmentDirectional.center,
            dropdownColor: TPColor.darkBlue,
            borderRadius: BorderRadius.circular(20),
            value: value.isEmpty ? null : value,
            items: rankTierOptions
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Row(
                      children: [
                        if (store.selectedElo == 'Iron')
                          Image.asset('lib/assets/images/1.png', width: 30),
                        if (store.selectedElo == 'Bronze')
                          Image.asset('lib/assets/images/2.png', width: 30),
                        if (store.selectedElo == 'Silver')
                          Image.asset('lib/assets/images/3.webp', width: 30),
                        if (store.selectedElo == 'Gold')
                          Image.asset('lib/assets/images/4.webp', width: 30),
                        if (store.selectedElo == 'Platinum')
                          Image.asset('lib/assets/images/5.png', width: 30),
                        if (store.selectedElo == 'Diamond')
                          Image.asset('lib/assets/images/6.png', width: 30),
                        Text(
                          ' $option',
                          style: TPTexts.t8(color: TPColor.white),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            icon: const Icon(Icons.arrow_drop_down, color: TPColor.orange),
            onChanged: store.isLoadingList == true
                ? null
                : (choice) {
                    store.rankTierValue.value = choice.toString();
                    store.selectedTier = choice.toString();
                    store.makeRequestRankedInfoListBasedInUserChoice();
                  });
      },
    );
  }

  Widget rowSelectEloButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        eloButton('Iron', 'lib/assets/images/1.png'),
        eloButton('Bronze', 'lib/assets/images/2.png'),
        eloButton('Silver', 'lib/assets/images/3.webp'),
        eloButton('Gold', 'lib/assets/images/4.webp'),
        eloButton('Platinum', 'lib/assets/images/5.png'),
        eloButton('Diamond', 'lib/assets/images/6.png'),
      ],
    );
  }

  Widget listSummonersRankScore(List<EntryModel?>? entries) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 5.h),
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

  Widget eloImg(String imgPath, {double? width}) {
    return Image.asset(imgPath, width: 40);
  }

  Widget loadingList() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: TPColor.orange,
          backgroundColor: TPColor.darkBlue,
        ),
      ),
    );
  }

  Widget eloButton(String? selectedElo, String imgPath) {
    return InkWell(
      onTap: () {
        store.isLoadingList == true ? null : store.selectedElo = selectedElo;
        store.makeRequestRankedInfoListBasedInUserChoice();
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: TPColor.lightGrey,
          border: store.selectedElo == selectedElo
              ? Border.all(color: TPColor.orange, width: 2)
              : Border.all(color: TPColor.cyan, width: 2),
        ),
        child: Image.asset(imgPath, fit: BoxFit.contain),
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

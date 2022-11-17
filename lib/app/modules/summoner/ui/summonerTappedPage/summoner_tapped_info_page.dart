import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summonerTappedPage/summoner_tapped_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/button.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/card_summoner_ranked_info.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoner_card.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoner_item_frame.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/loading_widget.dart';

final SummonerTappedPageStore store = Modular.get();

class SummonerTappedInfoPage extends StatelessWidget {
  const SummonerTappedInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Observer(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('${store.summonerTappedInfoModel?.name}'),
            backgroundColor: TPColor.purple,
          ),
          body: store.isLoading == true
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Observer(builder: (context) {
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: TPColor.black,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          26)),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(26),
                                                  child: Image.network(
                                                      '$LOL_SUMMONERICONS${store.summonerTappedInfoModel?.profileIconId}.png',
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                              'lib/assets/images/error.image.png'))),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              children: [
                                                Text(
                                                    '${store.summonerTappedInfoModel?.name}',
                                                    style: store.summonerTappedInfoModel!
                                                                .name!.length >
                                                            15
                                                        ? TPTexts.h8()
                                                        : TPTexts.h6()),
                                                Text(
                                                    'Level: ${store.summonerTappedInfoModel?.summonerLevel}',
                                                    style: TPTexts.t7()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        ButtonWidget(
                                          borderRadius: 24,
                                          onTap: () =>
                                              store.toggleArrowButton(),
                                          child: store
                                                  .tappedSummonerRankedInfoIcon
                                              ? const Icon(Icons.arrow_upward,
                                                  size: 20,
                                                  color: TPColor.black)
                                              : const Icon(Icons.arrow_downward,
                                                  size: 20,
                                                  color: TPColor.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const CardSummonerRankedInfoWidget(),
                              ],
                            );
                          }),
                          SizedBox(height: screenSize.height * 0.015),
                          Text(
                            'Últimas partidas:',
                            style: TPTexts.h6(color: TPColor.black),
                          ),
                          SizedBox(
                            height: screenSize.height * 1.85,
                            width: screenSize.width * 1,
                            child: ListView.builder(
                              itemCount: store.matchs.length,
                              itemBuilder: (context, index) {
                                final int? item0 =
                                    store.summonerTappedList[index].item0;
                                final int? item1 =
                                    store.summonerTappedList[index].item1;
                                final int? item2 =
                                    store.summonerTappedList[index].item2;
                                final int? item3 =
                                    store.summonerTappedList[index].item3;
                                final int? item4 =
                                    store.summonerTappedList[index].item4;
                                final int? item5 =
                                    store.summonerTappedList[index].item5;

                                bool haveItem(int? value) {
                                  if (value != 0) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }

                                final num totalCs = store
                                        .summonerTappedList[index]
                                        .totalMinionsKilled! +
                                    store.summonerTappedList[index]
                                        .neutralMinionsKilled!;

                                dynamic kills =
                                    store.summonerTappedList[index].kills;
                                dynamic deaths =
                                    store.summonerTappedList[index].deaths;
                                dynamic assists =
                                    store.summonerTappedList[index].assists;
                                final double kda = (kills + assists) / deaths;

                                final int? largestMultiKill = store
                                    .summonerTappedList[index].largestMultiKill;
                                String text = '';

                                if (largestMultiKill == 2) {
                                  text = 'DOUBLE KILL';
                                }
                                if (largestMultiKill == 3) {
                                  text = 'TRIPLE KILL';
                                }
                                if (largestMultiKill == 4) {
                                  text = 'QUADRA KILL';
                                }
                                if (largestMultiKill == 5) text = 'PENTAKILL';

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 125,
                                      width: 350,
                                      child: CardWidget(
                                        borderColor: store
                                                    .summonerTappedList[index]
                                                    .win ==
                                                true
                                            ? TPColor.blue
                                            : Colors.red,
                                        shadowColor: TPColor.purple,
                                        color: store.summonerTappedList[index]
                                                    .win ==
                                                true
                                            ? Colors.blue[100]
                                            : Colors.red[100],
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: store
                                                                          .summonerTappedList[
                                                                              index]
                                                                          .win ==
                                                                      true
                                                                  ? Colors.blue
                                                                      .shade200
                                                                  : Colors.red
                                                                      .shade200,
                                                              spreadRadius: 1,
                                                              blurRadius: 8,
                                                            ),
                                                          ]),
                                                      child: CardWidget(
                                                        borderColor: store
                                                                    .summonerTappedList[
                                                                        index]
                                                                    .win ==
                                                                true
                                                            ? TPColor.blue
                                                            : Colors.red,
                                                        child: Column(
                                                          children: [
                                                            store
                                                                        .summonerTappedList[
                                                                            index]
                                                                        .win ==
                                                                    true
                                                                ? Text(
                                                                    'Vitória!',
                                                                    style: TPTexts.t7(
                                                                        color: TPColor
                                                                            .blue))
                                                                : Text(
                                                                    'Derrota',
                                                                    style: TPTexts.t7(
                                                                        color: Colors
                                                                            .red[400])),
                                                            if (store.matchs
                                                                .isNotEmpty)
                                                              if (store
                                                                      .matchs[
                                                                          index]!
                                                                      .info!
                                                                      .gameDuration!
                                                                      .toString()
                                                                      .length >=
                                                                  4)
                                                                Text(store
                                                                    .matchs[
                                                                        index]!
                                                                    .info!
                                                                    .gameDuration
                                                                    .toString()
                                                                    .replaceRange(
                                                                        2,
                                                                        2,
                                                                        ':')),
                                                            if (store.matchs
                                                                .isNotEmpty)
                                                              if (store
                                                                      .matchs[
                                                                          index]!
                                                                      .info!
                                                                      .gameDuration!
                                                                      .toString()
                                                                      .length ==
                                                                  3)
                                                                Text(store
                                                                    .matchs[
                                                                        index]!
                                                                    .info!
                                                                    .gameDuration
                                                                    .toString()
                                                                    .replaceRange(
                                                                        1,
                                                                        1,
                                                                        ':')),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (store
                                                                .summonerTappedList[
                                                                    index]
                                                                .largestMultiKill !=
                                                            0 &&
                                                        store
                                                                .summonerTappedList[
                                                                    index]
                                                                .largestMultiKill! !=
                                                            1)
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: TPColor.purple,
                                                        ),
                                                        child: Text(text,
                                                            style: TPTexts.t7(
                                                                isBold: true)),
                                                      ),
                                                    const SizedBox(height: 3),
                                                  ],
                                                ),
                                                const SizedBox(width: 5),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          children: [
                                                            SizedBox(
                                                              height: 50,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            26),
                                                                child: Image
                                                                    .network(
                                                                  '$URL_IMGSQUARE${store.summonerTappedList[index].championName}.png',
                                                                  errorBuilder:
                                                                      (context,
                                                                          error,
                                                                          stackTrace) {
                                                                    return Image
                                                                        .asset(
                                                                            'lib/assets/images/error.image.png');
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: TPColor
                                                                      .black),
                                                              child: Text(
                                                                  '${store.summonerTappedList[index].champLevel}',
                                                                  style: TPTexts.t7(
                                                                      color: TPColor
                                                                          .white)),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        //
                                                        // SPELLS
                                                        //
                                                        Column(
                                                          children: [
                                                            if (store
                                                                    .isSummonerTappedSpell &&
                                                                store.summonerTappedSpellId[
                                                                        index] !=
                                                                    null)
                                                              SizedBox(
                                                                height: 24,
                                                                child: Image
                                                                    .network(
                                                                        '$URL_IMGSPELLSSUMMONER${store.summonerTappedSpellId[index]}.png'),
                                                              ),
                                                            // if (store
                                                            //         .isSummonerTappedSSecondSpell &&
                                                            //     store.summonerSpellId2[
                                                            //             index] !=
                                                            //         null)
                                                            // SizedBox(
                                                            //   height: 24,
                                                            //   child: Image
                                                            //       .network(
                                                            //           // '$URL_IMGSPELLSSUMMONER${store.summonerSpellId2[index]}.png'),
                                                            // ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            width: 20),
                                                        //
                                                        // KDA
                                                        //
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '${store.summonerTappedList[index].kills}/',
                                                                    style: TPTexts
                                                                        .t7()),
                                                                Text(
                                                                    '${store.summonerTappedList[index].deaths}/',
                                                                    style: TPTexts
                                                                        .t7()),
                                                                Text(
                                                                    '${store.summonerTappedList[index].assists}',
                                                                    style: TPTexts
                                                                        .t7()),
                                                              ],
                                                            ),
                                                            if (kda.toString() !=
                                                                'NaN')
                                                              Text(
                                                                  '${kda.toStringAsFixed(1)} KDA',
                                                                  style: TPTexts.t8(
                                                                      color: TPColor
                                                                          .grey)),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            width: 20),
                                                        //
                                                        // ControlWards and Cs
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Pinks: ${store.summonerTappedList[index].detectorWardsPlaced}',
                                                              style:
                                                                  TPTexts.t8(),
                                                            ),
                                                            Text(
                                                              'Wards: ${store.summonerTappedList[index].wardsPlaced}',
                                                              style:
                                                                  TPTexts.t8(),
                                                            ),
                                                            Text('$totalCs CS',
                                                                style: TPTexts
                                                                    .t8()),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    //
                                                    // ITENS
                                                    //
                                                    Row(
                                                      children: [
                                                        if (haveItem(item0))
                                                          SummonerItemFrameWidget(
                                                              urlImage:
                                                                  '$URL_ITENSIMAGE${store.summonerTappedList[index].item0}.png'),
                                                        if (haveItem(item1))
                                                          SummonerItemFrameWidget(
                                                              urlImage:
                                                                  '$URL_ITENSIMAGE${store.summonerTappedList[index].item1}.png'),
                                                        if (haveItem(item2))
                                                          SummonerItemFrameWidget(
                                                              urlImage:
                                                                  '$URL_ITENSIMAGE${store.summonerTappedList[index].item2}.png'),
                                                        if (haveItem(item3))
                                                          SummonerItemFrameWidget(
                                                              urlImage:
                                                                  '$URL_ITENSIMAGE${store.summonerTappedList[index].item3}.png'),
                                                        if (haveItem(item4))
                                                          SummonerItemFrameWidget(
                                                              urlImage:
                                                                  '$URL_ITENSIMAGE${store.summonerTappedList[index].item4}.png'),
                                                        if (haveItem(item5))
                                                          SummonerItemFrameWidget(
                                                              urlImage:
                                                                  '$URL_ITENSIMAGE${store.summonerTappedList[index].item5}.png'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/button.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/match_details_dialog.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/card.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoner_item_frame.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class ListCardMatchHistoryWidget extends StatelessWidget {
  ListCardMatchHistoryWidget({super.key});

  final SummonerPageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2950.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: store.matchs.length,
        itemBuilder: (context, index) {
          final int totalCs = store.me[index].totalMinionsKilled! +
              store.me[index].neutralMinionsKilled!;

          dynamic kills = store.me[index].kills;
          dynamic deaths = store.me[index].deaths;
          dynamic assists = store.me[index].assists;
          final double kda = (kills + assists) / deaths;

          final int? largestMultiKill = store.me[index].largestMultiKill;
          String text = '';

          if (largestMultiKill == 2) text = 'DOUBLE KILL';
          if (largestMultiKill == 3) text = 'TRIPLE KILL';
          if (largestMultiKill == 4) text = 'QUADRA KILL';
          if (largestMultiKill == 5) text = 'PENTAKILL';

          return Column(
            children: [
              SizedBox(
                height: 147,
                width: 350,
                child: CardWidget(
                  borderColor:
                      store.me[index].win == true ? TPColor.blue : Colors.red,
                  shadowColor: TPColor.purple,
                  color: store.me[index].win == true
                      ? Colors.blue[100]
                      : Colors.red[100],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: store.me[index].win == true
                                        ? Colors.blue.shade200
                                        : Colors.red.shade200,
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                  ),
                                ]),
                                child: CardWidget(
                                  borderColor: store.me[index].win == true
                                      ? TPColor.blue
                                      : Colors.red,
                                  child: Column(
                                    children: [
                                      store.me[index].win == true
                                          ? Text('Vitória!',
                                              style: TPTexts.t7(
                                                  color: TPColor.blue))
                                          : Text('Derrota',
                                              style: TPTexts.t7(
                                                  color: Colors.red[400])),
                                      if (store.matchs.isNotEmpty)
                                        if (store.matchs[index]!.info!
                                                .gameDuration!
                                                .toString()
                                                .length >=
                                            4)
                                          Text(store
                                              .matchs[index]!.info!.gameDuration
                                              .toString()
                                              .replaceRange(2, 2, ':')),
                                      if (store.matchs.isNotEmpty)
                                        if (store.matchs[index]!.info!
                                                .gameDuration!
                                                .toString()
                                                .length ==
                                            3)
                                          Text(store
                                              .matchs[index]!.info!.gameDuration
                                              .toString()
                                              .replaceRange(1, 1, ':')),
                                    ],
                                  ),
                                ),
                              ),
                              if (store.me[index].largestMultiKill != 0 &&
                                  store.me[index].largestMultiKill! != 1)
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: TPColor.purple,
                                  ),
                                  child: Text(text,
                                      style: TPTexts.t7(isBold: true)),
                                ),
                              const SizedBox(height: 3),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          child: Image.network(
                                            '$URL_IMGSQUARE${store.me[index].championName}.png',
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  'lib/assets/images/error.image.png');
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: TPColor.black),
                                        child: Text(
                                            '${store.me[index].champLevel}',
                                            style: TPTexts.t7(
                                                color: TPColor.white)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      if (store.isMySpell &&
                                          store.summonerSpellId[index] != null)
                                        SizedBox(
                                          height: 24,
                                          child: Image.network(
                                              '$URL_IMGSPELLSSUMMONER${store.summonerSpellId[index]}.png'),
                                        ),
                                      if (store.isMySecondSpell &&
                                          store.summonerSpellId2[index] != null)
                                        SizedBox(
                                          height: 24,
                                          child: Image.network(
                                              '$URL_IMGSPELLSSUMMONER${store.summonerSpellId2[index]}.png'),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('${store.me[index].kills}/',
                                              style: TPTexts.t7()),
                                          Text('${store.me[index].deaths}/',
                                              style: TPTexts.t7()),
                                          Text('${store.me[index].assists}',
                                              style: TPTexts.t7()),
                                        ],
                                      ),
                                      if (kda.toString() != 'NaN')
                                        Text('${kda.toStringAsFixed(1)} KDA',
                                            style: TPTexts.t8(
                                                color: TPColor.grey)),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Pinks: ${store.me[index].detectorWardsPlaced}',
                                        style: TPTexts.t8(),
                                      ),
                                      Text(
                                        'Wards: ${store.me[index].wardsPlaced}',
                                        style: TPTexts.t8(),
                                      ),
                                      Text('$totalCs CS', style: TPTexts.t8()),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SummonerItemFrameWidget(
                                      urlImage:
                                          '$URL_ITENSIMAGE${store.me[index].item0}.png'),
                                  SummonerItemFrameWidget(
                                      urlImage:
                                          '$URL_ITENSIMAGE${store.me[index].item1}.png'),
                                  SummonerItemFrameWidget(
                                      urlImage:
                                          '$URL_ITENSIMAGE${store.me[index].item2}.png'),
                                  SummonerItemFrameWidget(
                                      urlImage:
                                          '$URL_ITENSIMAGE${store.me[index].item3}.png'),
                                  SummonerItemFrameWidget(
                                      urlImage:
                                          '$URL_ITENSIMAGE${store.me[index].item4}.png'),
                                  SummonerItemFrameWidget(
                                      urlImage:
                                          '$URL_ITENSIMAGE${store.me[index].item5}.png'),
                                  SummonerItemFrameWidget(
                                      urlImage:
                                          '$URL_ITENSIMAGE${store.me[index].item6}.png'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      ButtonWidget(
                        borderRadius: 24,
                        heigth: 30,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                insetPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                backgroundColor: TPColor.white,
                                child: MatchDetailsDialogWidget(
                                    info: store.matchs[index]!.info!)),
                          );
                        },
                        child: Text('Ver detalhes', style: TPTexts.t7()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoner_card.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoner_item_frame.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';

class SummonersCardWidget extends StatelessWidget {
  const SummonersCardWidget({super.key, required this.summoner});

  final ParticipantModel summoner;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/summoner-tapped-info');
        // store.searchSummonerTapped(summoner.summonerName!);
      },
      child: CardWidget(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Image.network(
                          '$URL_IMGSQUARE${summoner.championName}.png',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                                'lib/assets/images/error.image.png');
                          },
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: TPColor.black),
                      child: Text('${summoner.champLevel}',
                          style: TPTexts.t7(color: TPColor.white)),
                    )
                  ],
                ),
                const SizedBox(width: 5),
                Text(
                  '${summoner.summonerName}',
                  style: TPTexts.t8(),
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('${summoner.kills}/', style: TPTexts.t7()),
                        Text('${summoner.deaths}/', style: TPTexts.t7()),
                        Text('${summoner.assists}', style: TPTexts.t7()),
                      ],
                    ),
                    if (store.calculateKDA(summoner).toString() != 'NaN' &&
                        store.calculateKDA(summoner).toString() != 'Infinity')
                      Text(store.calculateKDA(summoner).toStringAsFixed(1),
                          style: TPTexts.t8(color: TPColor.grey)),
                    if (store.calculateKDA(summoner).toString() == 'Infinity')
                      Text('100.0', style: TPTexts.t8(color: TPColor.grey)),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    Text(
                      '${summoner.totalDamageDealtToChampions}',
                      style: TPTexts.t8(color: Colors.red),
                    ),
                    Text(
                      '${summoner.totalDamageTaken}',
                      style: TPTexts.t8(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    Text(
                      '${summoner.detectorWardsPlaced}',
                      style: TPTexts.t7(),
                    ),
                    Row(
                      children: [
                        Text(
                          '${summoner.wardsPlaced}/',
                          style: TPTexts.t7(),
                        ),
                        Text(
                          '${summoner.wardsKilled}',
                          style: TPTexts.t7(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Text(
                    '${summoner.totalMinionsKilled! + summoner.neutralMinionsKilled!}')
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SummonerItemFrameWidget(
                    urlImage: '$URL_ITENSIMAGE${summoner.item0}.png'),
                SummonerItemFrameWidget(
                    urlImage: '$URL_ITENSIMAGE${summoner.item1}.png'),
                SummonerItemFrameWidget(
                    urlImage: '$URL_ITENSIMAGE${summoner.item2}.png'),
                SummonerItemFrameWidget(
                    urlImage: '$URL_ITENSIMAGE${summoner.item3}.png'),
                SummonerItemFrameWidget(
                    urlImage: '$URL_ITENSIMAGE${summoner.item4}.png'),
                SummonerItemFrameWidget(
                    urlImage: '$URL_ITENSIMAGE${summoner.item5}.png'),
                SummonerItemFrameWidget(
                    urlImage: '$URL_ITENSIMAGE${summoner.item6}.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

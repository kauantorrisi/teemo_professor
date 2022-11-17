import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoner_item_frame.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';

class SummonersCardWidget extends StatelessWidget {
  SummonersCardWidget({super.key, required this.summoner});

  final ParticipantModel summoner;
  final SummonerPageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: const Offset(1, 2),
            color: TPColor.black.withOpacity(0.2),
          ),
        ],
        border: Border.all(color: TPColor.purple),
        color: TPColor.white,
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: championImageAndLevel()),
          Expanded(flex: 9, child: cardHeader()),
        ],
      ),
    );
  }

  Widget cardHeader() {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text('${summoner.summonerName}', style: TPTexts.t6(isBold: true)),
              const Spacer(),
              Text(
                '${summoner.kills}/${summoner.deaths}/${summoner.assists}',
                style: TPTexts.t6(),
              ),
              const Spacer(),
              Text(store.calculateKDA(summoner).toStringAsFixed(1)),
            ],
          ),
          itensRow(),
        ],
      ),
    );
  }

  Widget cardBody() {
    return Column(
      children: [
        // RichText(
        //   text: TextSpan(
        //     text: 'Dano causado/sofrido: ',
        //     style: TPTexts.t6(isBold: true),
        //     children: [
        //       TextSpan(
        //           text: '${summoner.totalDamageDealtToChampions}',
        //           style: TPTexts.t6(color: TPColor.blue)),
        //       TextSpan(text: ' / ', style: TPTexts.t6()),
        //       TextSpan(
        //           text: '${summoner.totalDamageTaken}',
        //           style: TPTexts.t6(color: TPColor.red)),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget championImageAndLevel() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    NetworkImage('$URL_IMGSQUARE${summoner.championName}.png')),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: TPColor.black),
          child: Text('${summoner.champLevel}',
              style: TPTexts.t5(color: TPColor.white)),
        )
      ],
    );
  }

  Widget kda() {
    return Row(
      children: [
        Text(
          '${summoner.kills}/${summoner.deaths}/${summoner.assists}',
          style: TPTexts.t7(),
        ),
        const Spacer(),
        if (store.calculateKDA(summoner).toString() != 'NaN' &&
            store.calculateKDA(summoner).toString() != 'Infinity')
          Text(store.calculateKDA(summoner).toStringAsFixed(1),
              style: TPTexts.t8(color: TPColor.grey)),
        if (store.calculateKDA(summoner).toString() == 'Infinity')
          Text('100.0', style: TPTexts.t6(color: TPColor.black)),
      ],
    );
  }

  Widget damageColumn() {
    return Column(
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
    );
  }

  Widget wardsColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('${summoner.detectorWardsPlaced}', style: TPTexts.t7()),
        Text(
          '${summoner.wardsPlaced} / ${summoner.wardsKilled}',
          style: TPTexts.t7(),
        ),
      ],
    );
  }

  Widget itensRow() {
    return Row(
      children: [
        SummonerItemFrameWidget(
          urlImage: '$URL_ITENSIMAGE${summoner.item0}.png',
          height: 35,
        ),
        SummonerItemFrameWidget(
          urlImage: '$URL_ITENSIMAGE${summoner.item1}.png',
          height: 35,
        ),
        SummonerItemFrameWidget(
          urlImage: '$URL_ITENSIMAGE${summoner.item2}.png',
          height: 35,
        ),
        SummonerItemFrameWidget(
          urlImage: '$URL_ITENSIMAGE${summoner.item3}.png',
          height: 35,
        ),
        SummonerItemFrameWidget(
          urlImage: '$URL_ITENSIMAGE${summoner.item4}.png',
          height: 35,
        ),
        SummonerItemFrameWidget(
          urlImage: '$URL_ITENSIMAGE${summoner.item5}.png',
          height: 35,
        ),
        SummonerItemFrameWidget(
          urlImage: '$URL_ITENSIMAGE${summoner.item6}.png',
          height: 35,
        ),
      ],
    );
  }
}

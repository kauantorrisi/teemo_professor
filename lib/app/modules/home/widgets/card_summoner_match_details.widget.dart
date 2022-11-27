import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teemo_professor/app/modules/home/home_page_store.dart';

import 'package:teemo_professor/app/modules/home/widgets/summoner_item_frame.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';

class CardSummonerMatchDetails extends StatelessWidget {
  CardSummonerMatchDetails({super.key, required this.summoner});

  final ParticipantModel summoner;
  final HomePageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/summoner-tapped-info');
      },
      child: Container(
        height: 140.h,
        padding: const EdgeInsets.only(right: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: const Offset(1, 2),
              color: TPColor.black.withOpacity(0.2),
            ),
          ],
          border: Border.all(color: TPColor.black),
          color: TPColor.white,
        ),
        child: Row(
          children: [
            Expanded(flex: 3, child: championImageAndLevel()),
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  cardHeader(),
                  const Spacer(),
                  cardBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardHeader() {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Column(
        children: [
          nameAndKDA(),
          itensRow(),
        ],
      ),
    );
  }

  Widget cardBody() {
    return SizedBox(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          damageAndCsColumn(),
          wardsColumn(),
        ],
      ),
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
              style: TPTexts.t3(color: TPColor.white)),
        )
      ],
    );
  }

  Widget nameAndKDA() {
    return Row(
      children: [
        Text(
          '${summoner.summonerName}',
          style: TPTexts.t6(isBold: true),
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(flex: 4),
        RichText(
          text: TextSpan(
            text: 'KDA: ',
            style: TPTexts.t7(isBold: true),
            children: [
              TextSpan(
                text:
                    '${summoner.kills}/${summoner.deaths}/${summoner.assists}',
                style: TPTexts.t7(),
              ),
            ],
          ),
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            store.calculateKDA(summoner).toStringAsFixed(1),
            style: TPTexts.t6(),
          ),
        ),
      ],
    );
  }

  Widget damageAndCsColumn() {
    return Column(
      children: [
        Text('Dano', style: TPTexts.t6(isBold: true)),
        Text(
          'Causado: ${summoner.totalDamageDealtToChampions}',
          style: TPTexts.t6(color: TPColor.blue),
        ),
        Text(
          'Sofrido: ${summoner.totalDamageTaken}',
          style: TPTexts.t6(color: TPColor.red),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            text: 'CS: ',
            style: TPTexts.t7(isBold: true),
            children: [
              TextSpan(
                text:
                    '${summoner.totalMinionsKilled! + summoner.neutralMinionsKilled!}',
                style: TPTexts.t7(),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget wardsColumn() {
    return Column(
      children: [
        Text('Wards', style: TPTexts.t6(isBold: true)),
        Text(
          'Colocadas: ${summoner.wardsPlaced}',
          style: TPTexts.t6(color: TPColor.blue),
        ),
        Text(
          'Destruidas: ${summoner.wardsKilled}',
          style: TPTexts.t6(color: TPColor.red),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            text: 'Sent. de controle: ',
            style: TPTexts.t7(isBold: true),
            children: [
              TextSpan(
                text: '${summoner.detectorWardsPlaced}',
                style: TPTexts.t7(),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget itensRow() {
    return Row(
      children: [
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${summoner.item0}.png',
          height: 35.h,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${summoner.item1}.png',
          height: 35.h,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${summoner.item2}.png',
          height: 35.h,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${summoner.item3}.png',
          height: 35.h,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${summoner.item4}.png',
          height: 35.h,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${summoner.item5}.png',
          height: 35.h,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${summoner.item6}.png',
          height: 35.h,
        ),
      ],
    );
  }
}

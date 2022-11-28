import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:teemo_professor/app/modules/home/widgets/match_details_dialog.widget.dart';
import 'package:teemo_professor/app/modules/home/widgets/summoner_item_frame.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/info.model.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';
import 'package:teemo_professor/libraries/common/widgets/card.widget.dart';

class CardSummonerLastMatchesInfo extends StatelessWidget {
  const CardSummonerLastMatchesInfo({
    super.key,
    required this.me,
    required this.isMySpell,
    required this.isMySecondSpell,
    required this.summonerSpellId,
    required this.summonerSpellId2,
    required this.info,
  });

  final ParticipantModel me;
  final bool isMySpell;
  final bool isMySecondSpell;
  final String? summonerSpellId;
  final String? summonerSpellId2;
  final InfoModel info;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => Dialog(
          insetPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          backgroundColor: TPColor.white,
          child: MatchDetailsDialogWidget(info: info),
        ),
      ),
      child: CardWidget(
        height: 120.h,
        borderColor: me.win == true ? TPColor.darkBlue : Colors.red,
        shadowColor: TPColor.darkBlue,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: TPColor.white,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                summonerWinOrLoseMatchCard(),
                const Spacer(),
                summonerLargestKillContainer(),
                const Spacer(),
              ],
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      summonerChampionImgAndChampionLevel(),
                      const Spacer(flex: 1),
                      summonerSpellsColumn(),
                      const Spacer(flex: 3),
                      summonerKdaColumn(),
                      const Spacer(flex: 4),
                      wardsAndCsColumn(),
                      const Spacer(flex: 4),
                    ],
                  ),
                  const Spacer(),
                  summonerItensRow(),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summonerWinOrLoseMatchCard() {
    return CardWidget(
      borderColor: me.win == true ? TPColor.darkBlue : TPColor.red,
      color: me.win == true ? TPColor.blue : TPColor.lightRed,
      child: Column(
        children: [
          me.win == true
              ? Text(
                  'Vitória',
                  style: TPTexts.t6(color: TPColor.black, isBold: true),
                )
              : Text(
                  'Derrota',
                  style: TPTexts.t6(color: TPColor.black, isBold: true),
                ),
          if (info.gameDuration!.toString().length >= 4)
            Text(info.gameDuration.toString().replaceRange(2, 2, ':')),
          if (info.gameDuration!.toString().length == 3)
            Text(info.gameDuration.toString().replaceRange(1, 1, ':')),
        ],
      ),
    );
  }

  Widget summonerLargestKillContainer() {
    String text = '';

    switch (me.largestMultiKill) {
      case 2:
        text = 'DOUBLE KILL';
        break;
      case 3:
        text = 'TRIPLE KILL';
        break;
      case 4:
        text = 'QUADRA KILL';
        break;
      case 5:
        text = 'PENTA KILL';
        break;
      default:
        text = '';
        break;
    }

    return me.largestMultiKill != 0 && me.largestMultiKill! != 1
        ? Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: me.win == true
                  ? Border.all(color: TPColor.darkBlue)
                  : Border.all(color: TPColor.red),
              color: me.win! ? TPColor.blue : TPColor.lightRed,
            ),
            child: Text(text, style: TPTexts.t7(isBold: true)),
          )
        : SizedBox(child: Text(text));
  }

  Widget summonerChampionImgAndChampionLevel() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: CachedNetworkImage(
            imageUrl: '$URL_IMGSQUARE${me.championName}.png',
            height: 60.h,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: TPColor.black),
          child:
              Text('${me.champLevel}', style: TPTexts.t5(color: TPColor.white)),
        )
      ],
    );
  }

  Widget summonerSpellsColumn() {
    return Column(
      children: [
        if (isMySpell)
          CachedNetworkImage(
            imageUrl: '$URL_IMGSPELLSSUMMONER$summonerSpellId.png',
            height: 30.h,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        SizedBox(height: 2.h),
        if (isMySecondSpell)
          CachedNetworkImage(
            imageUrl: '$URL_IMGSPELLSSUMMONER$summonerSpellId2.png',
            height: 30.h,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
      ],
    );
  }

  Widget summonerKdaColumn() {
    final double kda = (me.kills! + me.assists!) / me.deaths!;

    return Column(
      children: [
        Row(
          children: [
            Text('${me.kills}/', style: TPTexts.t5()),
            Text('${me.deaths}/', style: TPTexts.t5()),
            Text('${me.assists}', style: TPTexts.t5()),
          ],
        ),
        if (kda.toString() != 'NaN')
          Text('${kda.toStringAsFixed(1)} KDA',
              style: TPTexts.t7(color: TPColor.grey)),
      ],
    );
  }

  Widget wardsAndCsColumn() {
    final int totalCs = me.totalMinionsKilled! + me.neutralMinionsKilled!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pinks: ${me.detectorWardsPlaced}',
          style: TPTexts.t6(),
        ),
        Text(
          'Wards: ${me.wardsPlaced}',
          style: TPTexts.t6(),
        ),
        Text('$totalCs CS', style: TPTexts.t6()),
      ],
    );
  }

  Widget summonerItensRow() {
    return Row(
      children: [
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${me.item0}.png',
          win: me.win,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${me.item1}.png',
          win: me.win,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${me.item2}.png',
          win: me.win,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${me.item3}.png',
          win: me.win,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${me.item4}.png',
          win: me.win,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${me.item5}.png',
          win: me.win,
        ),
        SummonerItemFrameWidget(
          urlImg: '$URL_ITENSIMAGE${me.item6}.png',
          win: me.win,
        ),
      ],
    );
  }
}

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
    final int totalCs = me.totalMinionsKilled! + me.neutralMinionsKilled!;

    final int? kills = me.kills;
    final int? deaths = me.deaths;
    final int? assists = me.assists;
    final double kda = (kills! + assists!) / deaths!;

    final int? largestMultiKill = me.largestMultiKill;
    String text = '';

    switch (largestMultiKill) {
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
        height: 135.h,
        borderColor: me.win == true ? TPColor.darkBlue : Colors.red,
        shadowColor: TPColor.darkBlue,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: TPColor.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                CardWidget(
                  borderColor: me.win == true ? TPColor.darkBlue : TPColor.red,
                  color: me.win == true ? TPColor.blue : TPColor.lightRed,
                  child: Column(
                    children: [
                      me.win == true
                          ? Text('Vitória!',
                              style: TPTexts.t6(color: TPColor.black))
                          : Text('Derrota',
                              style: TPTexts.t6(color: TPColor.black)),
                      if (info.gameDuration!.toString().length >= 4)
                        Text(info.gameDuration
                            .toString()
                            .replaceRange(2, 2, ':')),
                      if (info.gameDuration!.toString().length == 3)
                        Text(info.gameDuration
                            .toString()
                            .replaceRange(1, 1, ':')),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                if (me.largestMultiKill != 0 && me.largestMultiKill! != 1)
                  Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: me.win! ? TPColor.blue : TPColor.lightRed,
                    ),
                    child: Text(text, style: TPTexts.t7(isBold: true)),
                  ),
                const Spacer(),
              ],
            ),
            SizedBox(width: 5.w),
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
                          height: 50.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image.network(
                              '$URL_IMGSQUARE${me.championName}.png',
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
                          child: Text('${me.champLevel}',
                              style: TPTexts.t7(color: TPColor.white)),
                        )
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        if (isMySpell)
                          SizedBox(
                            height: 24,
                            child: Image.network(
                                '$URL_IMGSPELLSSUMMONER$summonerSpellId.png'),
                          ),
                        if (isMySecondSpell)
                          SizedBox(
                            height: 24,
                            child: Image.network(
                                '$URL_IMGSPELLSSUMMONER$summonerSpellId2.png'),
                          ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('${me.kills}/', style: TPTexts.t7()),
                            Text('${me.deaths}/', style: TPTexts.t7()),
                            Text('${me.assists}', style: TPTexts.t7()),
                          ],
                        ),
                        if (kda.toString() != 'NaN')
                          Text('${kda.toStringAsFixed(1)} KDA',
                              style: TPTexts.t8(color: TPColor.grey)),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pinks: ${me.detectorWardsPlaced}',
                          style: TPTexts.t8(),
                        ),
                        Text(
                          'Wards: ${me.wardsPlaced}',
                          style: TPTexts.t8(),
                        ),
                        Text('$totalCs CS', style: TPTexts.t8()),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SummonerItemFrameWidget(
                        urlImg: '$URL_ITENSIMAGE${me.item0}.png'),
                    SummonerItemFrameWidget(
                        urlImg: '$URL_ITENSIMAGE${me.item1}.png'),
                    SummonerItemFrameWidget(
                        urlImg: '$URL_ITENSIMAGE${me.item2}.png'),
                    SummonerItemFrameWidget(
                        urlImg: '$URL_ITENSIMAGE${me.item3}.png'),
                    SummonerItemFrameWidget(
                        urlImg: '$URL_ITENSIMAGE${me.item4}.png'),
                    SummonerItemFrameWidget(
                        urlImg: '$URL_ITENSIMAGE${me.item5}.png'),
                    SummonerItemFrameWidget(
                        urlImg: '$URL_ITENSIMAGE${me.item6}.png'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

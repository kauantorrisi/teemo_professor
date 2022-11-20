import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:teemo_professor/app/modules/home/ui/summoner/service/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/home/ui/summoner/widgets/card_summoner_ranked_info.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/button.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/card.widget.dart';

final SummonerPageStore store = Modular.get();

class CardSummonerInfoWidget extends StatelessWidget {
  const CardSummonerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          SizedBox(
            width: 300.w,
            child: CardWidget(
              borderColor: TPColor.darkBlue,
              shadowColor: TPColor.darkBlue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: TPColor.black, width: 1),
                            borderRadius: BorderRadius.circular(26)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: Image.network(
                                '$LOL_SUMMONERICONS${store.summonerByName?.profileIconId}.png',
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                        'lib/assets/images/error.image.png'))),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        children: [
                          Text('${store.summonerByName?.name}',
                              style: TPTexts.h6()),
                          Text('Level: ${store.summonerByName?.summonerLevel}',
                              style: TPTexts.t7()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  ButtonWidget(
                    heigth: 30.h,
                    borderRadius: 24,
                    onTap: () => store.toggleArrowButton(),
                    child: store.tappedSummonerRankedInfoIcon
                        ? const Icon(Icons.arrow_upward,
                            size: 20, color: TPColor.black)
                        : const Icon(Icons.arrow_downward,
                            size: 20, color: TPColor.black),
                  ),
                ],
              ),
            ),
          ),
          const CardSummonerRankedInfoWidget(),
        ],
      );
    });
  }
}

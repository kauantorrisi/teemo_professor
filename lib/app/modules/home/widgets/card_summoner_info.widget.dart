import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teemo_professor/app/modules/home/helpers/home.helper.dart';

import 'package:teemo_professor/app/modules/home/home_page_store.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/animated_card.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/button.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/card.widget.dart';

final HomePageStore store = Modular.get();

class CardSummonerInfoWidget extends StatelessWidget {
  const CardSummonerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Observer(builder: (_) {
        return AnimatedCardWidget(
          duration: const Duration(milliseconds: 200),
          width: 350.w,
          height: store.tappedInSummonerRankedInfoButton ? 450.h : 140.h,
          color: TPColor.blue,
          borderColor: TPColor.darkBlue,
          shadowColor: TPColor.darkBlue,
          child: Column(
            children: [
              summonerIconNameAndLevel(),
              const Spacer(),
              cardSummonerRankedInfoWidget(),
              iconButton(),
            ],
          ),
        );
      }),
    );
  }

  Widget summonerIconNameAndLevel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          height: 90.h,
          width: 90.w,
          decoration: BoxDecoration(
            border: Border.all(color: TPColor.darkBlue, width: 1.5),
            borderRadius: BorderRadius.circular(90.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90.r),
            child: Image.network(
              '$LOL_SUMMONERICONS${store.summonerByName?.profileIconId}.png',
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset('lib/assets/images/error.image.png'),
            ),
          ),
        ),
        const Spacer(),
        Column(
          children: [
            Text('${store.summonerByName?.name}', style: TPTexts.h4()),
            Text(
              'Nível: ${store.summonerByName?.summonerLevel}',
              style: TPTexts.t5(color: TPColor.grey),
            ),
          ],
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget iconButton() {
    return ButtonWidget(
      heigth: 35.h,
      borderRadius: 24.r,
      onTap: () => store.toggleTappedInSummonerRankedInfoButton(),
      child: store.tappedInSummonerRankedInfoButton
          ? Icon(
              Icons.arrow_drop_up,
              size: 25.r,
              color: TPColor.orange,
            )
          : Icon(
              Icons.arrow_drop_down,
              size: 25.r,
              color: TPColor.orange,
            ),
    );
  }

  Widget cardSummonerRankedInfoWidget() {
    return AnimatedCardWidget(
      width: 270.w,
      height: store.tappedInSummonerRankedInfoButton ? 300.h : 0,
      duration: store.tappedInSummonerRankedInfoButton
          ? const Duration(milliseconds: 201)
          : const Duration(milliseconds: 199),
      color: TPColor.lightBlue,
      borderColor: TPColor.darkBlue,
      shadowColor: TPColor.darkBlue,
      child: ListView.builder(
        itemCount: store.summonersEntriesInfo.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 140.h,
            child: Column(
              children: [
                const Spacer(),
                CardWidget(
                  borderRadius: BorderRadius.circular(100),
                  width: 150.w,
                  height: 50.h,
                  color: TPColor.darkBlue,
                  borderColor: TPColor.darkBlue,
                  shadowColor: TPColor.darkBlue,
                  child: Center(
                    child: Text(
                      store.summonersEntriesInfo[index]?.queueType ==
                              'RANKED_SOLO_5x5'
                          ? HomeHelper.rankedModeSoloQNameHelper(
                              store.summonersEntriesInfo[index]!.queueType!)
                          : store.summonersEntriesInfo[index]!.queueType ==
                                  'RANKED_FLEX_SR'
                              ? HomeHelper.rankedModeFlexNameHelper(
                                  store.summonersEntriesInfo[index]!.queueType!)
                              : HomeHelper.rankedModeTFTNameHelper(store
                                  .summonersEntriesInfo[index]!.queueType!),
                      style: TPTexts.t2(color: TPColor.white),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Text(
                    HomeHelper.eloNameHelper(
                        '${store.summonersEntriesInfo[index]!.tier} ${store.summonersEntriesInfo[index]!.rank}'),
                    style: TPTexts.t4()),
                const Spacer(),
                Text('Vitórias: ${store.summonersEntriesInfo[index]!.wins}',
                    style: TPTexts.t4()),
                const Spacer(),
                Text('Derrotas: ${store.summonersEntriesInfo[index]!.losses}',
                    style: TPTexts.t4()),
                const Spacer(flex: 2),
              ],
            ),
          );
        },
      ),
    );
  }
}

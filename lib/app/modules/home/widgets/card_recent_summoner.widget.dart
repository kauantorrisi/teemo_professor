import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teemo_professor/app/modules/home/home_page_store.dart';
import 'package:teemo_professor/libraries/common/models/entry.model.dart';
import 'package:teemo_professor/libraries/common/models/summoner.model.dart';

import 'package:teemo_professor/libraries/common/widgets/card.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class CardRecentSummonerWidget extends StatelessWidget {
  CardRecentSummonerWidget({
    super.key,
    required this.recentSummoner,
    required this.recentSummonerEntries,
  });

  final HomePageStore store = Modular.get();
  final SummonerModel? recentSummoner;
  final EntryModel? recentSummonerEntries;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Row(
        children: [
          summonerImageIcon(),
          const Spacer(),
          summonerNameAndLevel(),
          const Spacer(),
          summonerRankImage(),
          const Spacer(),
          IconButton(
            onPressed: () => store.removeRecentSummoner(
                recentSummoner, recentSummonerEntries),
            icon: const Icon(Icons.close, color: TPColor.red),
          ),
        ],
      ),
    );
  }

  Widget summonerImageIcon() {
    return CachedNetworkImage(
      imageUrl: '$LOL_SUMMONERICONS${recentSummoner?.profileIconId}.png',
      imageBuilder: (context, imageProvider) => Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          border: Border.all(color: TPColor.black),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            '$LOL_SUMMONERICONS${recentSummoner?.profileIconId}.png',
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
    );
  }

  Widget summonerNameAndLevel() {
    return Column(
      children: [
        Text(
          '${recentSummoner?.name}',
          style: TPTexts.t4(isBold: true),
        ),
        Text(
          'Nível: ${recentSummoner?.summonerLevel}',
          style: TPTexts.t6(color: TPColor.grey),
        )
      ],
    );
  }

  Widget summonerRankImage() {
    String imgPath = '';

    switch (recentSummonerEntries?.tier) {
      case 'IRON':
        imgPath = 'lib/assets/images/1.png';
        break;
      case 'BRONZE':
        imgPath = 'lib/assets/images/2.png';
        break;
      case 'SILVER':
        imgPath = 'lib/assets/images/3.webp';
        break;
      case 'GOLD':
        imgPath = 'lib/assets/images/4.webp';
        break;
      case 'PLATINUM':
        imgPath = 'lib/assets/images/5.png';
        break;
      case 'DIAMOND':
        imgPath = 'lib/assets/images/6.png';
        break;
      case 'MASTER':
        imgPath = 'lib/assets/images/7.webp';
        break;
      case 'GRANDMASTER':
        imgPath = 'lib/assets/images/8.png';
        break;
      case 'CHALLENGER':
        imgPath = 'lib/assets/images/9.png';
        break;
      default:
        imgPath = 'lib/assets/images/1.png';
        break;
    }

    switch (recentSummonerEntries?.tier) {
      case 'IRON':
        imgPath = 'lib/assets/images/1.png';
        break;
      case 'BRONZE':
        imgPath = 'lib/assets/images/2.png';
        break;
      case 'SILVER':
        imgPath = 'lib/assets/images/3.webp';
        break;
      case 'GOLD':
        imgPath = 'lib/assets/images/4.webp';
        break;
      case 'PLATINUM':
        imgPath = 'lib/assets/images/5.png';
        break;
      case 'DIAMOND':
        imgPath = 'lib/assets/images/6.png';
        break;
      case 'MASTER':
        imgPath = 'lib/assets/images/7.webp';
        break;
      case 'GRANDMASTER':
        imgPath = 'lib/assets/images/8.png';
        break;
      case 'CHALLENGER':
        imgPath = 'lib/assets/images/9.png';
        break;
      default:
        imgPath = 'lib/assets/images/1.png';
        break;
    }

    return eloImage(imgPath);
  }

  Widget eloImage(imgPath) {
    return SizedBox(
      width: 50.w,
      child: Image.asset(imgPath),
    );
  }
}

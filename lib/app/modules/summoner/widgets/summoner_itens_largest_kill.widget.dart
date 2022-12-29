import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoner_item_frame.widget.dart';
import 'package:teemo_professor/libraries/common/constants.dart';

final SummonerPageStore store = Modular.get();

class SummonerItensWidget extends StatelessWidget {
  SummonerItensWidget({super.key});

  final int? item0 = store.me.first.item0;
  final int? item1 = store.me.first.item1;
  final int? item2 = store.me.first.item2;
  final int? item3 = store.me.first.item3;
  final int? item4 = store.me.first.item4;
  final int? item5 = store.me.first.item5;

  bool haveItem(int? value) {
    if (value != 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Row(
        children: [
          if (haveItem(item0))
            SummonerItemFrameWidget(
                urlImage: '$URL_ITENSIMAGE${store.me.first.item0}.png'),
          const SizedBox(width: 1.5),
          if (haveItem(item1))
            SummonerItemFrameWidget(
                urlImage: '$URL_ITENSIMAGE${store.me.first.item1}.png'),
          const SizedBox(width: 1.5),
          if (haveItem(item2))
            SummonerItemFrameWidget(
                urlImage: '$URL_ITENSIMAGE${store.me.first.item2}.png'),
          const SizedBox(width: 1.5),
          if (haveItem(item3))
            SummonerItemFrameWidget(
                urlImage: '$URL_ITENSIMAGE${store.me.first.item3}.png'),
          const SizedBox(width: 1.5),
          if (haveItem(item4))
            SummonerItemFrameWidget(
                urlImage: '$URL_ITENSIMAGE${store.me.first.item4}.png'),
          const SizedBox(width: 1.5),
          if (haveItem(item5))
            SummonerItemFrameWidget(
                urlImage: '$URL_ITENSIMAGE${store.me.first.item5}.png'),
        ],
      );
    });
  }
}

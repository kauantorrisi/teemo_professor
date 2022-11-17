import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

final SummonerPageStore store = Modular.get();

class SummonerItemFrameWidget extends StatelessWidget {
  const SummonerItemFrameWidget({super.key, required this.urlImage});

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1), color: TPColor.black),
        height: 30,
        child: Image.network(urlImage,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('lib/assets/images/error.image.png')),
      ),
    );
  }
}

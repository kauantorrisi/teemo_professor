import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/champion.model.dart';
import 'package:teemo_professor/modules/championsList/store/champions_list.store.dart';

class ChampionDetailsView extends StatelessWidget {
  const ChampionDetailsView({super.key, required this.champion});

  final ChampionModel champion;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(champion.name ?? 'N/A'),
      ),
      body: Column(
        children: [
          Container(
            color: TPColor.grey,
            width: double.infinity,
            height: screenSize.height * 0.28,
            child: Image.network(
              '$URL_IMGSPLASHART${champion.id}_0.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            champion.title ?? 'N/A',
            style: TPTexts.t3(fontFamily: 'TeemoFont2'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(champion.lore ?? 'N/A'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(champion.partype ?? 'N/A'),
          ),
        ],
      ),
    );
  }

  Widget skinsList(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        itemCount: champion.skins?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(champion.skins?[index].name ?? ''),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}

final ChampionsListStore store = Modular.get();

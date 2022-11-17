import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/champions/champions_store.dart';
import 'package:teemo_professor/libraries/common/constants.dart';

final ChampionsStore store = Modular.get();

class ResearchedChampionsListWidget extends StatelessWidget {
  const ResearchedChampionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Expanded(
        child: ListView.builder(
          itemCount: store.researchedChampions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text('${store.researchedChampions[index].name}'),
                  subtitle: Text('${store.researchedChampions[index].title}'),
                  leading: Image.network(
                      '$URL_IMGSQUARE${store.researchedChampions[index].id}.png'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () async {
                    await store.getChampion(
                        id: store.researchedChampions[index].id.toString());

                    Modular.to.pushNamed(
                      '/champions-module/champion-details',
                      arguments: store.champion,
                    );
                  },
                ),
                const Divider(),
              ],
            );
          },
        ),
      );
    });
  }
}

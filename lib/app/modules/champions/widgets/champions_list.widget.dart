import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/champions/champions_store.dart';

import 'package:teemo_professor/libraries/common/constants.dart';

final ChampionsStore store = Modular.get();

class ChampionsListWidget extends StatelessWidget {
  const ChampionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: store.champions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text('${store.champions[index].name}'),
                subtitle: Text('${store.champions[index].title}'),
                leading: Image.network(
                  '$URL_IMGSQUARE${store.champions[index].id}.png',
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('lib/assets/images/error.image.png'),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () async {
                  await store.getChampion(
                      id: store.champions[index].id.toString());
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
  }
}

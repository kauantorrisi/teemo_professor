import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/drawer.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/floating_action_button.dart';
import 'package:teemo_professor/libraries/common/widgets/textform_fields.widget.dart';
import 'package:teemo_professor/modules/championsList/store/champions_list.store.dart';

class ChampionsListView extends StatefulWidget {
  const ChampionsListView({super.key});

  @override
  State<ChampionsListView> createState() => _ChampionsListViewState();
}

class _ChampionsListViewState extends State<ChampionsListView> {
  final ChampionsListStore store = Modular.get();

  @override
  void initState() {
    store.fetchChampionsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: Observer(builder: (_) {
          return Column(
            children: [
              if (store.isSearching)
                TextFormFieldWidget(
                  controller: store.searchController,
                  text: 'Pesquise um campeão',
                  onChanged: (value) => store.searchChampion(value),
                ),
              if (store.isSearching) researchedChampionsList else championsList,
            ],
          );
        }),
        drawer: const DrawerWidget(),
        floatingActionButton: FloatingActionButtonWidget(
            icon: Icons.search,
            onPressed: () {
              store.toggleIsSearching();
              store.loadingChampionsListWhenSearching();
            }),
      ),
    );
  }

  Widget get championsList {
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
                    '$URL_IMGSQUARE${store.champions[index].id}.png'),
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

  Widget get researchedChampionsList {
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
  }
}

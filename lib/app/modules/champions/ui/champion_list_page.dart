import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/champions/champions_store.dart';
import 'package:teemo_professor/app/modules/champions/widgets/champions_list.widget.dart';
import 'package:teemo_professor/app/modules/champions/widgets/researched_champions_list.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/loading_widget.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/drawer.widget.dart';
import 'package:teemo_professor/app/modules/champions/widgets/floating_action_button.dart';
import 'package:teemo_professor/libraries/common/widgets/text_formField.widget.dart';

class ChampionsListPage extends StatefulWidget {
  const ChampionsListPage({super.key});

  @override
  State<ChampionsListPage> createState() => _ChampionsListViewState();
}

class _ChampionsListViewState extends State<ChampionsListPage> {
  final ChampionsStore store = Modular.get();

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
          return store.isLoading
              ? const LoadingWidget()
              : Column(
                  children: [
                    if (store.isSearching)
                      TextFormFieldWidget(
                        controller: store.searchController,
                        text: 'Pesquise um campeão',
                        onChanged: (value) => store.searchChampion(value),
                      ),
                    if (store.isSearching)
                      const ResearchedChampionsListWidget()
                    else
                      const ChampionsListWidget()
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
}

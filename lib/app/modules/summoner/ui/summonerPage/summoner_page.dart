import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/card_summoner_info.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/list_card_summoner_last_matchs.widget.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/drawer.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/loading_widget.dart';
import 'package:teemo_professor/libraries/common/widgets/textform_fields.widget.dart';

class SummonerPage extends StatelessWidget {
  SummonerPage({super.key});

  final SummonerPageStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        builder: (BuildContext context, Widget? child) {
          return Observer(builder: (context) {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () => store.onSearch(),
                child: Scaffold(
                  appBar: const AppBarWidget(),
                  drawer: const DrawerWidget(),
                  body: store.isLoading == true &&
                          store.searchController.text.trim().isNotEmpty
                      ? const LoadingWidget()
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormFieldWidget(
                                text: 'Pesquise um invocador (BR)',
                                controller: store.searchController,
                                onFieldSubmitted: (_) async {
                                  await store.onSearch();
                                },
                              ),
                              if (store.searchController.text
                                      .trim()
                                      .isNotEmpty &&
                                  store.isError == false &&
                                  store.summonerByName?.name != null)
                                Column(
                                  children: [
                                    const CardSummonerInfoWidget(),
                                    SizedBox(height: screenSize.height * 0.015),
                                    if (store.summonerByName != null)
                                      Text(
                                        'Últimas partidas:',
                                        style: TPTexts.h6(color: TPColor.black),
                                      ),
                                    if (store.summonerByName != null)
                                      ListCardMatchHistoryWidget(),
                                  ],
                                ),
                            ],
                          ),
                        ),
                ),
              ),
            );
          });
        });
  }
}

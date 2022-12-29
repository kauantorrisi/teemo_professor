import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/scoreboard/scoreboard_store.dart';
import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/drawer.widget.dart';
import 'package:teemo_professor/libraries/common/widgets/loading_widget.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({Key? key}) : super(key: key);
  @override
  ScoreboardPageState createState() => ScoreboardPageState();
}

class ScoreboardPageState extends State<ScoreboardPage> {
  final ScoreboardStore store = Modular.get();

  @override
  void initState() {
    store.getRankedChallengerSoloQInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          actions: [
            PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Ferro"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Bronze"),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Prata"),
                  ),
                  const PopupMenuItem<int>(
                    value: 3,
                    child: Text("Ouro"),
                  ),
                  const PopupMenuItem<int>(
                    value: 4,
                    child: Text("Platina"),
                  ),
                  const PopupMenuItem<int>(
                    value: 5,
                    child: Text("Diamante"),
                  ),
                  const PopupMenuItem<int>(
                    value: 6,
                    child: Text("Mestre"),
                  ),
                  const PopupMenuItem<int>(
                    value: 7,
                    child: Text("Grão-mestre"),
                  ),
                  const PopupMenuItem<int>(
                    value: 8,
                    child: Text("Desafiante"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 1) {}
                if (value == 2) {}
                if (value == 3) {}
                if (value == 4) {}
                if (value == 5) {}
                if (value == 6) {}
                if (value == 7) {}
                if (value == 8) {
                  rankedChallengerSoloQInfoList;
                }
              },
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Observer(
          builder: (context) {
            return store.isLoading == true ||
                    store.rankedChallengerSoloQInfo == null
                ? const LoadingWidget()
                : rankedChallengerSoloQInfoList;
          },
        ),
      ),
    );
  }

  Widget get rankedChallengerSoloQInfoList {
    return Column(
      children: [
        if (store.rankedChallengerSoloQInfo?.tier == 'CHALLENGER')
          Text('Desafiante', style: TPTexts.h8()),
        Text(
          '${store.rankedChallengerSoloQInfo?.queue}'
              .replaceAll(RegExp(r'_'), ' '),
          style: TPTexts.t7(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: store.rankedChallengerSoloQInfo?.entries?.length,
            itemBuilder: (context, index) {
              int wins =
                  store.rankedChallengerSoloQInfo!.entries![index]!.wins!;
              int losses =
                  store.rankedChallengerSoloQInfo!.entries![index]!.losses!;
              int totalMatchsPlayed = wins + losses;

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${store.rankedChallengerSoloQInfo?.entries?[index]?.summonerName}',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pontos: ${store.rankedChallengerSoloQInfo?.entries?[index]?.leaguePoints}',
                        ),
                        Text(
                          'Partidas jogadas: $totalMatchsPlayed',
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vitórias: ${store.rankedChallengerSoloQInfo?.entries?[index]?.wins}',
                        ),
                        Text(
                          'Derrotas: ${store.rankedChallengerSoloQInfo?.entries?[index]?.losses}',
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: TPColor.purple, thickness: 1.5),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

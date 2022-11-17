import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/button.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/match_info_row.widget.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/info.model.dart';
import 'package:teemo_professor/libraries/common/models/team.model.dart';

final SummonerPageStore store = Modular.get();

class MatchDetailsDialogWidget extends StatelessWidget {
  const MatchDetailsDialogWidget({super.key, required this.info});

  final InfoModel info;

  @override
  Widget build(BuildContext context) {
    final TeamModel winningTeam =
        info.teams!.where((team) => team.win == true).first;

    final TeamModel losingTeam =
        info.teams!.where((team) => team.win == false).first;

    return Observer(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Detalhes da partida',
              style: TPTexts.h3(),
            ),
            WinTeamObjectivesRow(winningTeam),
            const MatchInfoRowWidget(),
            LosingTeamObjectivesRow(losingTeam),
            const MatchInfoRowWidget(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ButtonWidget(
                  onTap: () => Modular.to.pop(),
                  borderRadius: 24,
                  width: 100,
                  heigth: 30,
                  color: TPColor.purple,
                  child: const Text('Voltar')),
            ),
          ],
        ),
      );
    });
  }

  Widget WinTeamObjectivesRow(TeamModel winTeam) {
    return Container(
      color: Colors.blue,
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
            child: Image.asset(
              'lib/assets/images/baron-icon.png',
              color: Colors.blue,
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${winTeam.objectives?.baron?.kills}'),
          const SizedBox(width: 5),
          SizedBox(
            height: 24,
            child: Image.asset(
              'lib/assets/images/dragon-icon.png',
              color: Colors.blue.withOpacity(0.4),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${winTeam.objectives?.dragon?.kills}'),
          const SizedBox(width: 5),
          SizedBox(
            height: 24,
            child: Image.asset(
              'lib/assets/images/rift-herald-icon.png',
              color: Colors.blue.withOpacity(0.4),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${winTeam.objectives?.riftHerald?.kills}'),
          const SizedBox(width: 5),
          SizedBox(
            height: 24,
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/90/90403.png',
              color: Colors.blue.withOpacity(0.4),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${winTeam.objectives?.tower?.kills}'),
          const SizedBox(width: 20),
          if (winTeam.win == true)
            Text('Vitória',
                style: TPTexts.t6(isBold: true, color: Colors.blue[100]))
        ],
      ),
    );
  }

  Widget LosingTeamObjectivesRow(TeamModel loseTeam) {
    return Container(
      color: Colors.red,
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
            child: Image.asset(
              'lib/assets/images/baron-icon.png',
              color: Colors.red,
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${loseTeam.objectives?.baron?.kills}'),
          const SizedBox(width: 5),
          SizedBox(
            height: 24,
            child: Image.asset(
              'lib/assets/images/dragon-icon.png',
              color: Colors.red.withOpacity(0.4),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${loseTeam.objectives?.dragon?.kills}'),
          const SizedBox(width: 5),
          SizedBox(
            height: 24,
            child: Image.asset(
              'lib/assets/images/rift-herald-icon.png',
              color: Colors.red.withOpacity(0.4),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${loseTeam.objectives?.riftHerald?.kills}'),
          const SizedBox(width: 5),
          SizedBox(
            height: 24,
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/90/90403.png',
              color: Colors.red.withOpacity(0.4),
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 5),
          Text('${loseTeam.objectives?.tower?.kills}'),
          const SizedBox(width: 20),
          if (loseTeam.win == false)
            Text('Derrota',
                style: TPTexts.t6(isBold: true, color: Colors.red[100]))
        ],
      ),
    );
  }

  Widget loseSummonersTeamList() {
    return Container();
  }
}

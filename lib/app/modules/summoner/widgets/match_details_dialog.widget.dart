// ignore_for_file: curly_braces_in_flow_control_structures, must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/button.widget.dart';
import 'package:teemo_professor/app/modules/summoner/widgets/summoners_card.widget.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/info.model.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';
import 'package:teemo_professor/libraries/common/models/team.model.dart';

final SummonerPageStore store = Modular.get();

class MatchDetailsDialogWidget extends StatelessWidget {
  MatchDetailsDialogWidget({super.key, required this.info}) {
    setTeams();
    setParticipantsTeams();
  }

  final InfoModel info;

  late TeamModel winTeam;

  late TeamModel loseTeam;

  List<ParticipantModel> winParticipantsTeam = [];

  List<ParticipantModel> loseParticipantsTeam = [];

  void setTeams() {
    info.teams!.forEach((team) {
      if (team.win == true)
        winTeam = team;
      else
        loseTeam = team;
    });
  }

  void setParticipantsTeams() {
    info.participants!.forEach((participant) {
      if (participant!.win == true)
        winParticipantsTeam.add(participant);
      else
        loseParticipantsTeam.add(participant);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Detalhes da partida', style: TPTexts.h3()),
          teamObjectivesRow(winTeam),
          summonersTeamList(winParticipantsTeam),
          teamObjectivesRow(loseTeam),
          summonersTeamList(loseParticipantsTeam),
          backButton(),
        ],
      ),
    );
  }

  Widget summonersTeamList(List<ParticipantModel> participants) {
    return SizedBox(
      height: 520,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: participants.length,
        itemBuilder: (context, index) {
          return SummonersCardWidget(summoner: participants[index]);
        },
      ),
    );
  }

  Widget teamObjectivesRow(TeamModel team) {
    return Container(
      color: team.win == true ? TPColor.blue : TPColor.red,
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          objectiveIcon(
              img: 'lib/assets/images/baron-icon.png', isWin: team.win),
          const SizedBox(width: 5),
          Text('${team.objectives?.baron?.kills}'),
          const SizedBox(width: 5),
          objectiveIcon(
              img: 'lib/assets/images/dragon-icon.png', isWin: team.win),
          const SizedBox(width: 5),
          Text('${team.objectives?.dragon?.kills}'),
          const SizedBox(width: 5),
          objectiveIcon(
              img: 'lib/assets/images/rift-herald-icon.png', isWin: team.win),
          const SizedBox(width: 5),
          Text('${team.objectives?.riftHerald?.kills}'),
          const SizedBox(width: 5),
          objectiveIcon(
            img: 'https://cdn-icons-png.flaticon.com/512/90/90403.png',
            isWin: team.win,
            isNetwork: true,
          ),
          const SizedBox(width: 5),
          Text('${team.objectives?.tower?.kills}'),
          const SizedBox(width: 20),
          Text(
            team.win == true ? 'Vitória' : 'Derrota',
            style: TPTexts.t6(
              isBold: true,
              color: team.win == true ? TPColor.lightBlue : TPColor.lightRed,
            ),
          ),
        ],
      ),
    );
  }

  Widget objectiveIcon({required String img, bool? isWin, bool? isNetwork}) {
    return SizedBox(
      height: 24,
      child: isNetwork == true
          ? Image.network(
              img,
              color: isWin == true ? TPColor.blue : TPColor.red,
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            )
          : Image.asset(
              img,
              color: isWin == true ? TPColor.blue : TPColor.red,
              colorBlendMode: BlendMode.color,
              fit: BoxFit.contain,
            ),
    );
  }

  Widget backButton() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ButtonWidget(
        onTap: () => Modular.to.pop(),
        borderRadius: 24,
        width: 100,
        heigth: 30,
        color: TPColor.purple,
        child: const Text('Voltar'),
      ),
    );
  }
}

// ignore_for_file: curly_braces_in_flow_control_structures, must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teemo_professor/app/modules/home/widgets/card_summoner_match_details.widget.dart';

import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/info.model.dart';
import 'package:teemo_professor/libraries/common/models/participant.model.dart';
import 'package:teemo_professor/libraries/common/models/team.model.dart';
import 'package:teemo_professor/libraries/common/widgets/button.widget.dart';

class MatchDetailsDialogWidget extends StatelessWidget {
  MatchDetailsDialogWidget({super.key, required this.info}) {
    setTeamsObjectives();
    setParticipantsTeams();
  }

  final InfoModel info;

  late TeamModel winTeam = TeamModel();

  late TeamModel loseTeam = TeamModel();

  List<ParticipantModel> winParticipantsTeam = [];

  List<ParticipantModel> loseParticipantsTeam = [];

  void setTeamsObjectives() {
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
          Row(
            children: [
              const Spacer(flex: 2),
              Text('Detalhes da partida', style: TPTexts.h3()),
              const Spacer(),
              IconButton(
                onPressed: () => Modular.to.pop(),
                icon: const Icon(
                  Icons.close,
                  color: TPColor.red,
                ),
              ),
            ],
          ),
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
      height: 760.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: participants.length,
        itemBuilder: (context, index) {
          return CardSummonerMatchDetails(summoner: participants[index]);
        },
      ),
    );
  }

  Widget teamObjectivesRow(TeamModel team) {
    return Container(
      color: team.win == true ? TPColor.blue : TPColor.red,
      height: 36.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 6),
          objectiveIcon(
              img: 'lib/assets/images/baron-icon.png', isWin: team.win),
          const Spacer(),
          Text('${team.objectives?.baron?.kills}'),
          const Spacer(),
          objectiveIcon(
              img: 'lib/assets/images/dragon-icon.png', isWin: team.win),
          const Spacer(),
          Text('${team.objectives?.dragon?.kills}'),
          const Spacer(),
          objectiveIcon(
              img: 'lib/assets/images/rift-herald-icon.png', isWin: team.win),
          const Spacer(),
          Text('${team.objectives?.riftHerald?.kills}'),
          const Spacer(),
          objectiveIcon(
            img: 'https://cdn-icons-png.flaticon.com/512/90/90403.png',
            isWin: team.win,
            isNetwork: true,
          ),
          const Spacer(),
          Text('${team.objectives?.tower?.kills}'),
          const Spacer(flex: 4),
          Text(
            team.win == true ? 'Vitória' : 'Derrota',
            style: TPTexts.t6(
              isBold: true,
              color: team.win == true ? TPColor.blue : TPColor.lightRed,
            ),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }

  Widget objectiveIcon({required String img, bool? isWin, bool? isNetwork}) {
    return SizedBox(
      height: 24.h,
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
        width: double.infinity,
        heigth: 50.h,
        color: TPColor.darkBlue,
        child: Text('Okay', style: TPTexts.h8()),
      ),
    );
  }
}

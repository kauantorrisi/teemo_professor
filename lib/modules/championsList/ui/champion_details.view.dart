import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/champion.model.dart';

class ChampionDetailsView extends StatelessWidget {
  const ChampionDetailsView({super.key, required this.champion});

  final ChampionModel champion;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${champion.name}',
            style: TPTexts.h6(color: TPColor.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                '${champion.title}',
                style: TPTexts.h6(),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Lore: ${champion.lore}'),
              ),
              Text('Partype: ${champion.partype}',
                  style: TPTexts.t5(color: TPColor.blue)),
              Text(
                'Tags: ${champion.tags}',
                style: TPTexts.t5(color: TPColor.blue),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text('Skins:', style: TPTexts.h7(color: TPColor.purple)),
              SizedBox(height: screenSize.height * 0.01),
              skinsList(context),
              SizedBox(height: screenSize.height * 0.005),
              Text('Arraste para o lado ➡️', style: TPTexts.t8(isBold: true)),
              SizedBox(height: screenSize.height * 0.02),
              Text('Habilidades:', style: TPTexts.h7(color: TPColor.purple)),
              SizedBox(height: screenSize.height * 0.02),
              spellsList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget skinsList(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: TPColor.black, width: 2),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: champion.skins?.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  height: screenSize.height * 0.4,
                  width: screenSize.width * 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.01),
                    child: Column(
                      children: [
                        ListTile(
                          title: champion.skins?[index].name == 'default'
                              ? Text('Padrão', style: TPTexts.h8())
                              : Text('${champion.skins?[index].name}',
                                  style: TPTexts.h8()),
                        ),
                        Image.network(
                            'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.id}_${champion.skins?[index].num}.jpg'),
                        SizedBox(height: screenSize.height * 0.01),
                        champion.skins?[index].chromas == true
                            ? Text('Possui chromas', style: TPTexts.t6())
                            : Text('Não tem chromas', style: TPTexts.t6()),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget spellsList(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.7,
      width: screenSize.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: TPColor.black, width: 2),
      ),
      child: ListView.builder(
        itemCount: champion.spells?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text('${champion.spells?[index].name}',
                    style: TPTexts.h8()),
                leading: Image.network(
                    'http://ddragon.leagueoflegends.com/cdn/12.20.1/img/spell/${champion.spells?[index].id}.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('${champion.spells?[index].description}'),
                    SizedBox(height: screenSize.height * 0.01),
                    Text('Custo por nível:', style: TPTexts.t5()),
                    SizedBox(height: screenSize.height * 0.01),
                    Text('${champion.spells?[index].cost}'),
                    SizedBox(height: screenSize.height * 0.02),
                    Text('Cooldown por nível:', style: TPTexts.t5()),
                    SizedBox(height: screenSize.height * 0.01),
                    Text('${champion.spells?[index].cooldown}'),
                    SizedBox(height: screenSize.height * 0.02),
                    Text('Range da habilidade:', style: TPTexts.t5()),
                    SizedBox(height: screenSize.height * 0.01),
                    Text('${champion.spells?[index].range?.first}'),
                  ],
                ),
              ),
              const Divider(color: TPColor.black, thickness: 1.5),
            ],
          );
        },
      ),
    );
  }
}

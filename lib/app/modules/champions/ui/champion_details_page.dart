import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/constants.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/models/champion.model.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';

class ChampionDetailsPage extends StatelessWidget {
  const ChampionDetailsPage({super.key, required this.champion});

  final ChampionModel champion;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: TPColor.black,
                width: 340,
                height: 190,
                child: Image.network(
                  '$URL_IMGSPLASHART${champion.id}_0.jpg',
                  fit: BoxFit.contain,
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
                'Tags: ${champion.tags}'
                    .replaceAll('[', '')
                    .replaceAll(']', ''),
                style: TPTexts.t5(color: TPColor.blue),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text('Skins:', style: TPTexts.h7(color: TPColor.blue)),
              SizedBox(height: screenSize.height * 0.01),
              skinsList(),
              SizedBox(height: screenSize.height * 0.02),
              Text('Passiva:', style: TPTexts.h7(color: TPColor.blue)),
              SizedBox(height: screenSize.height * 0.01),
              Container(
                padding: EdgeInsets.all(screenSize.height * 0.02),
                margin: EdgeInsets.all(screenSize.height * 0.01),
                decoration: BoxDecoration(
                  border: Border.all(color: TPColor.purple, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        'http://ddragon.leagueoflegends.com/cdn/12.21.1/img/passive/${champion.id}_P.png',
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox()),
                    SizedBox(width: screenSize.width * 0.03),
                    Text('${champion.passive?.name}', style: TPTexts.h8()),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                          '${champion.passive?.description.replaceAll('<br>', '\n').replaceAll('physicalDamage', '').replaceAll("font", '').replaceAll('color', '').replaceAll('#', '').replaceAll("'", '').replaceAll("9b0f5f", '').replaceAll("FF9900", '').replaceAll('=', '').replaceAll("cccc00", '').replaceAll("FFF673", '').replaceAll('magicDamage', '').replaceAll('<', '').replaceAll('>', '').replaceAll('/', '').replaceAll('fe5x50', '').replaceAll(' 8484fb', '').replaceAll('fe5c50', '')}',
                          style: TPTexts.t5()),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text('Habilidades:', style: TPTexts.h7(color: TPColor.blue)),
              SizedBox(height: screenSize.height * 0.02),
              SizedBox(
                width: screenSize.width * 0.9,
                height: screenSize.height * 0.9,
                child: spellsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget skinsList() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: champion.skins?.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  height: 275,
                  width: 323,
                  decoration: BoxDecoration(
                    border: Border.all(color: TPColor.purple, width: 2),
                  ),
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
                      const SizedBox(height: 10),
                      champion.skins?[index].chromas == true
                          ? Text('Possui chromas', style: TPTexts.t6())
                          : Text('Não tem chromas', style: TPTexts.t6()),
                    ],
                  ),
                ),
                const SizedBox(width: 20)
              ],
            );
          }),
    );
  }

  Widget spellsList() {
    return SizedBox(
      child: ListView.builder(
        itemCount: champion.spells?.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: TPColor.purple, width: 2),
            ),
            child: Column(
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
                      const SizedBox(height: 10),
                      Text('Custo por nível:', style: TPTexts.t5()),
                      const SizedBox(height: 10),
                      Text(
                        '${champion.spells?[index].cost}'
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                      ),
                      const SizedBox(height: 20),
                      Text('Cooldown por nível:', style: TPTexts.t5()),
                      const SizedBox(height: 10),
                      Text(
                        '${champion.spells?[index].cooldown}'
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                      ),
                      const SizedBox(height: 20),
                      Text('Range por nível:', style: TPTexts.t5()),
                      const SizedBox(height: 10),
                      Text(
                        '${champion.spells?[index].range}'
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

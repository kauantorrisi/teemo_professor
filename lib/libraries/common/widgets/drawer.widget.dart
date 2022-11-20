import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/list_tile.widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: TPColor.white,
      width: 250,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.04,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Olá,\nInvocador', style: TPTexts.t1()),
            const Divider(color: TPColor.darkBlue),
            ListTileWidget(
                label: 'Pesquisar invocador',
                icon: Icons.search_rounded,
                onTap: () {
                  Modular.to.navigate(Modular.initialRoute);
                  Modular.to.pop();
                }),
            const SizedBox(height: 5),
            ListTileWidget(
                label: 'Campeões',
                icon: Icons.theater_comedy,
                onTap: () {
                  Modular.to.navigate('/champions-module/');
                  Modular.to.pop();
                }),
            const SizedBox(height: 5),
            ListTileWidget(
                label: 'Itens',
                icon: Icons.settings,
                onTap: () {
                  Modular.to.navigate('/itens-module/');
                }),
            const SizedBox(height: 5),
            ListTileWidget(
              label: 'Top Ranked',
              icon: Icons.scoreboard_rounded,
              onTap: () {
                Modular.to.navigate('/scoreboard-module/');
              },
            )
          ],
        ),
      ),
    );
  }
}

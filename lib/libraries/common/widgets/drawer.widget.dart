import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/libraries/common/widgets/divider.widget.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/list_tile.widget.dart';
import 'package:teemo_professor/modules/championsList/store/champions_list.store.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final ChampionsListStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.04,
        ),
        child: Observer(builder: (context) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Olá,', style: TPTexts.t1()),
                Text('Usuário!', style: TPTexts.h1()),
                const DividerWidget(),
                ListTileWidget(
                    label: 'Início',
                    icon: Icons.house_rounded,
                    selected: false,
                    onTap: () {
                      Modular.to.pushNamed('/');
                    }),
                ListTileWidget(
                    label: 'Configurações',
                    icon: Icons.settings,
                    selected: false,
                    onTap: () {
                      Modular.to.pushNamed('/config');
                    }),
              ]);
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/app/widgets/divider.widget.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/app/widgets/list_tile.widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: TPColor.white,
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
              ]);
        }),
      ),
    );
  }
}

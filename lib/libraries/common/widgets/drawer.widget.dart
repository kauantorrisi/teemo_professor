import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';
import 'package:teemo_professor/libraries/common/widgets/list_tile.widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: TPColor.white,
        width: 250.w,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Olá,\nInvocador', style: TPTexts.t1()),
              const Divider(color: TPColor.darkBlue),
              ListTileWidget(
                  label: 'Inicio',
                  icon: FontAwesomeIcons.house,
                  onTap: () {
                    Modular.to.navigate(Modular.initialRoute);
                    Modular.to.pop();
                  }),
              SizedBox(height: 5.h),
              ListTileWidget(
                  label: 'Campeões',
                  icon: FontAwesomeIcons.users,
                  onTap: () {
                    Modular.to.navigate('/champions-module/');
                    Modular.to.pop();
                  }),
              SizedBox(height: 5.h),
              ListTileWidget(
                  label: 'Itens',
                  icon: FontAwesomeIcons.gear,
                  onTap: () {
                    Modular.to.navigate('/itens-module/');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

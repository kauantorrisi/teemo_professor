import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/champions/champions_module.dart';
import 'package:teemo_professor/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/champions-module/', module: ChampionsModule()),
  ];
}

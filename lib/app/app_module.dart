import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/champions/champions_module.dart';
import 'package:teemo_professor/app/modules/itens/itens_module.dart';
import 'package:teemo_professor/app/modules/scoreboard/scoreboard_module.dart';
import 'package:teemo_professor/app/modules/summoner/summoner_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SummonerModule()),
    ModuleRoute('/champions-module/', module: ChampionsModule()),
    ModuleRoute('/itens-module/', module: ItensModule()),
    ModuleRoute('/scoreboard-module/', module: ScoreboardModule()),
  ];
}

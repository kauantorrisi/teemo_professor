import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/championsList/champions_module.dart';
import 'package:teemo_professor/app/modules/itensList/itensList_module.dart';
import 'package:teemo_professor/app/modules/leagueInfo/leagueInfo_module.dart';
import 'package:teemo_professor/app/modules/summoner/summoner_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SummonerModule()),
    ModuleRoute('/champions-module/', module: ChampionsModule()),
    ModuleRoute('/itens-module/', module: ItensListModule()),
    ModuleRoute('/league-info-module/', module: LeagueInfoModule()),
  ];
}

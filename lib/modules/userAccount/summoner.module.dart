import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/modules/championsList/champions.module.dart';
import 'package:teemo_professor/modules/userAccount/service/summoner.service.dart';
import 'package:teemo_professor/modules/userAccount/store/summoner.store.dart';
import 'package:teemo_professor/modules/userAccount/ui/summoner.view.dart';

class SummonerModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<SummonerService>((i) => SummonerService()),
  ];

  static List<Bind> stores = [
    Bind.lazySingleton<SummonerStore>((i) => SummonerStore()),
  ];

  @override
  List<Bind> get binds => services + stores;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => SummonerView()),
        ModuleRoute('/champions-module/', module: ChampionsModule()),
      ];
}

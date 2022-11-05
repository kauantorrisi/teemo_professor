import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/summoner/service/summoner_service.dart';
import 'package:teemo_professor/app/modules/summoner/summoner_store.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summoner_page.dart';

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
            child: (context, args) => SummonerPage()),
      ];
}

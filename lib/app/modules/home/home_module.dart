import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/home/service/home_service.dart';
import 'package:teemo_professor/app/modules/home/ui/home_page.dart';
import 'package:teemo_professor/app/modules/home/home_page_store.dart';
import 'package:teemo_professor/app/modules/home/ui/summoner_page.dart';

class HomeModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<HomeService>((i) => HomeService()),
  ];

  static List<Bind> stores = [
    Bind.lazySingleton<HomePageStore>((i) => HomePageStore()),
  ];

  @override
  List<Bind> get binds => services + stores;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
        ChildRoute(
          '/summoner-page',
          child: (context, args) => SummonerPage(),
        ),
      ];
}

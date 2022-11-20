import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/home/ui/homePage/service/home_service.dart';
import 'package:teemo_professor/app/modules/home/ui/homePage/home_page.dart';
import 'package:teemo_professor/app/modules/home/ui/homePage/home_page_store.dart';
import 'package:teemo_professor/app/modules/home/ui/summonerTappedPage/summoner_tapped_info_page.dart';
import 'package:teemo_professor/app/modules/home/ui/summonerTappedPage/summoner_tapped_page_store.dart';

class HomeModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<HomeService>((i) => HomeService()),
  ];

  static List<Bind> stores = [
    Bind.lazySingleton<SummonerTappedPageStore>(
        (i) => SummonerTappedPageStore()),
    Bind.lazySingleton<HomePageStore>((i) => HomePageStore()),
  ];

  @override
  List<Bind> get binds => services + stores;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const HomePage()),
        ChildRoute(
          '/summoner-tapped-info',
          child: (context, args) => const SummonerTappedInfoPage(),
        )
      ];
}

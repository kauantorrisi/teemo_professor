import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/summoner/service/summoner_service.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summonerTappedPage/summoner_tapped_info_page.dart';
import 'package:teemo_professor/app/modules/summoner/ui/summonerTappedPage/summoner_tapped_page_store.dart';

class SummonerModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<SummonerService>((i) => SummonerService()),
  ];

  static List<Bind> stores = [
    Bind.lazySingleton<SummonerTappedPageStore>(
        (i) => SummonerTappedPageStore()),
    Bind.lazySingleton<SummonerPageStore>((i) => SummonerPageStore()),
  ];

  @override
  List<Bind> get binds => services + stores;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => SummonerPage()),
        ChildRoute(
          '/summoner-tapped-info',
          child: (context, args) => const SummonerTappedInfoPage(),
        )
      ];
}

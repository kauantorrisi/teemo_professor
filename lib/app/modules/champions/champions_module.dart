import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/champions/champions_store.dart';
import 'package:teemo_professor/app/modules/champions/service/champion_service.dart';
import 'package:teemo_professor/app/modules/champions/ui/champion_details_page.dart';
import 'package:teemo_professor/app/modules/champions/ui/champion_list_page.dart';

class ChampionsModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<ChampionsService>((i) => ChampionsService()),
  ];

  static List<Bind> stores = [
    Bind.lazySingleton<ChampionsStore>((i) => ChampionsStore()),
  ];

  @override
  List<Bind> get binds => services + stores;

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const ChampionsListPage()),
        ChildRoute(
          '/champion-details',
          child: (context, args) => ChampionDetailsPage(
            champion: args.data,
          ),
        ),
      ];
}

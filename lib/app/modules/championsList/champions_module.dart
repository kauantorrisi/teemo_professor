import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/championsList/service/championsList_service.dart';
import 'package:teemo_professor/app/modules/championsList/ui/championDetails_page.dart';
import 'package:teemo_professor/app/modules/championsList/championsList_store.dart';
import 'package:teemo_professor/app/modules/championsList/ui/championsList_page.dart';

class ChampionsModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton<ChampionsListService>((i) => ChampionsListService()),
  ];

  static List<Bind> stores = [
    Bind.lazySingleton<ChampionsListStore>((i) => ChampionsListStore()),
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

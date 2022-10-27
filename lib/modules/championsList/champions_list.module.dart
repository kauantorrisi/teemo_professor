import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/modules/championsList/service/champions_list.service.dart';
import 'package:teemo_professor/modules/championsList/ui/champion_details.view.dart';
import 'package:teemo_professor/modules/championsList/store/champions_list.store.dart';
import 'package:teemo_professor/modules/championsList/ui/champions_list.view.dart';

class ChampionsListModule extends Module {
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
            child: (context, args) => const ChampionsListView()),
        ChildRoute(
          '/champion-details',
          child: (context, args) => ChampionDetailsView(
            champion: args.data,
          ),
        ),
      ];
}

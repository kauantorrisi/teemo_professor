import 'package:teemo_professor/app/modules/scoreboard/service/scoreboard_service.dart';
import 'package:teemo_professor/app/modules/scoreboard/ui/scoreboard_page.dart';
import 'package:teemo_professor/app/modules/scoreboard/scoreboard_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScoreboardModule extends Module {
  static List<Bind> services = [
    Bind.lazySingleton(
      (i) => ScoreboardService(),
    )
  ];

  static List<Bind> stores = [
    Bind.lazySingleton((i) => ScoreboardStore()),
  ];

  @override
  final List<Bind> binds = services + stores;

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const ScoreboardPage()),
  ];
}

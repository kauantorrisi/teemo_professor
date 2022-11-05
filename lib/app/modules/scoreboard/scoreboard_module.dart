import 'package:teemo_professor/app/modules/scoreboard/ui/scoreboard_page.dart';
import 'package:teemo_professor/app/modules/scoreboard/scoreboard_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScoreboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ScoreboardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const ScoreboardPage()),
  ];
}

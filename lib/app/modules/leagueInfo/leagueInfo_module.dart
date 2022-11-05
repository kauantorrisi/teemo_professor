import 'package:teemo_professor/app/modules/leagueInfo/ui/leagueInfo_page.dart';
import 'package:teemo_professor/app/modules/leagueInfo/leagueInfo_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LeagueInfoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LeagueInfoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LeagueInfoPage()),
  ];
}

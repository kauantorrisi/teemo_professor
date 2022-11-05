import 'package:teemo_professor/app/modules/itensList/ui/itensList_page.dart';
import 'package:teemo_professor/app/modules/itensList/itensList_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItensListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ItensListStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ItensListPage()),
  ];
}

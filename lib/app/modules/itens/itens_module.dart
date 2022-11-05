import 'package:teemo_professor/app/modules/itens/ui/itens_page.dart';
import 'package:teemo_professor/app/modules/itens/itens_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItensModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ItensStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ItensPage()),
  ];
}

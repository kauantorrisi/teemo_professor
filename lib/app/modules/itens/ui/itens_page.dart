import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/itens/itens_store.dart';
import 'package:flutter/material.dart';

class ItensPage extends StatefulWidget {
  final String title;
  const ItensPage({Key? key, this.title = 'ItensPage'}) : super(key: key);
  @override
  ItensPageState createState() => ItensPageState();
}

class ItensPageState extends State<ItensPage> {
  final ItensStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}

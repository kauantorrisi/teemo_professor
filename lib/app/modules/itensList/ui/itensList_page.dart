import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/itensList/itensList_store.dart';
import 'package:flutter/material.dart';

class ItensListPage extends StatefulWidget {
  final String title;
  const ItensListPage({Key? key, this.title = 'ItensListPage'}) : super(key: key);
  @override
  ItensListPageState createState() => ItensListPageState();
}
class ItensListPageState extends State<ItensListPage> {
  final ItensListStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/scoreboard/scoreboard_store.dart';
import 'package:flutter/material.dart';

class ScoreboardPage extends StatefulWidget {
  final String title;
  const ScoreboardPage({Key? key, this.title = 'ScoreboardPage'})
      : super(key: key);
  @override
  ScoreboardPageState createState() => ScoreboardPageState();
}

class ScoreboardPageState extends State<ScoreboardPage> {
  final ScoreboardStore store = Modular.get();

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

import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/app/modules/leagueInfo/leagueInfo_store.dart';
import 'package:flutter/material.dart';

class LeagueInfoPage extends StatefulWidget {
  final String title;
  const LeagueInfoPage({Key? key, this.title = 'LeagueInfoPage'}) : super(key: key);
  @override
  LeagueInfoPageState createState() => LeagueInfoPageState();
}
class LeagueInfoPageState extends State<LeagueInfoPage> {
  final LeagueInfoStore store = Modular.get();

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
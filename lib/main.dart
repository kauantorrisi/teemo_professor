import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teemo_professor/modules/userAccount/summoner.module.dart';

void main() {
  runApp(ModularApp(module: SummonerModule(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Teemo Professor',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        fontFamily: 'TeemoFont1',
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/widgets/app_bar.widget.dart';

class SummonerPage extends StatelessWidget {
  const SummonerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Text('SummonerPage'),
      ),
    );
  }
}

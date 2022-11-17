import 'package:flutter/material.dart';

import 'package:teemo_professor/libraries/common/design/texts.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Colocando cogumelos..', style: TPTexts.h6()),
        Center(child: Image.asset('lib/assets/images/teemo_loading.gif')),
      ],
    );
  }
}

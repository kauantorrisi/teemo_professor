import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: TPColor.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.2,
              horizontal: screenSize.width * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Houve um erro...', style: TPTexts.h1()),
              SizedBox(height: screenSize.height * 0.15),
              Image.network(
                  'https://thumbs.gfycat.com/ElectricDiligentDouglasfirbarkbeetle-max-1mb.gif'),
              SizedBox(height: screenSize.height * 0.15),
              Text('Já estamos tralhando nisso!', style: TPTexts.t4()),
            ],
          ),
        ),
      ),
    );
  }
}

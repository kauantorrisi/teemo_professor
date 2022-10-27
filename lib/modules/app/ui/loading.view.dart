import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

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
              Text('Professor Teemo', style: TPTexts.h1()),
              SizedBox(height: screenSize.height * 0.05),
              Image.network(
                  'https://i.pinimg.com/originals/c2/b7/2c/c2b72cfbbbc93891c51b5c615c10b356.gif'),
              SizedBox(height: screenSize.height * 0.02),
              Text('Preparando cogumelos...', style: TPTexts.t4()),
              SizedBox(height: screenSize.height * 0.03),
              const CircularProgressIndicator(
                backgroundColor: TPColor.white,
                color: TPColor.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

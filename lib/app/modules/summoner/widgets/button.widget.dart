import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:teemo_professor/app/modules/summoner/ui/summonerPage/summoner_page_store.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

final SummonerPageStore store = Modular.get();

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
    this.width,
    this.heigth,
    required this.borderRadius,
  });

  final void Function()? onTap;
  final Widget child;
  final Color? color;
  final double? width;
  final double? heigth;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: TPColor.purple,
          hoverColor: TPColor.purple.withOpacity(0.3),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius)),
            height: heigth,
            width: width,
            child: Center(child: child),
          ),
        ),
      ],
    );
  }
}

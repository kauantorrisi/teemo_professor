import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';
import 'package:teemo_professor/libraries/common/design/texts.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({super.key, this.onPressed, this.actions});

  final void Function()? onPressed;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Professor Teemo', style: TPTexts.t1(color: TPColor.white)),
      centerTitle: true,
      backgroundColor: TPColor.darkBlue,
      actions: actions,
    );
  }
}

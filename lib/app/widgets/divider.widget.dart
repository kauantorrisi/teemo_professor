import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: TPColor.grey,
      thickness: 1,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class SummonerItemFrameWidget extends StatelessWidget {
  const SummonerItemFrameWidget(
      {super.key, required this.urlImage, this.height});

  final String urlImage;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1), color: TPColor.black),
        height: height ?? 30.h,
        child: Image.network(
          urlImage,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[400],
            width: 30.w,
            height: 30.h,
          ),
        ),
      ),
    );
  }
}

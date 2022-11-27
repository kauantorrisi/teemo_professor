import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:teemo_professor/libraries/common/design/colors.dart';

class SummonerItemFrameWidget extends StatelessWidget {
  const SummonerItemFrameWidget({
    required this.urlImg,
    super.key,
    this.height,
    this.width,
    this.win,
  });

  final String urlImg;
  final double? height;
  final double? width;
  final bool? win;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.w),
      child: CachedNetworkImage(
        width: width ?? 35.w,
        height: height ?? 35.w,
        imageUrl: urlImg,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            border: win == null
                ? Border.all(color: TPColor.black)
                : win == true
                    ? Border.all(color: TPColor.darkBlue)
                    : Border.all(color: TPColor.red),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: TPColor.lightGrey,
            borderRadius: BorderRadius.circular(8.r),
            border: win == null
                ? Border.all(color: TPColor.black)
                : win == true
                    ? Border.all(color: TPColor.darkBlue)
                    : Border.all(color: TPColor.red),
          ),
          width: width ?? 35.w,
          height: height ?? 35.h,
        ),
      ),
    );
  }
}

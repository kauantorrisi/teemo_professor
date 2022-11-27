import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class SummonerItemFrameWidget extends StatelessWidget {
  const SummonerItemFrameWidget({
    required this.urlImg,
    super.key,
    this.height,
    this.width,
  });

  final String urlImg;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.w),
      child: CachedNetworkImage(
        width: width ?? 38.w,
        height: height ?? 38.w,
        imageUrl: urlImg,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            border: Border.all(color: TPColor.black),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: TPColor.lightGrey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          width: width ?? 38.w,
          height: height ?? 38.h,
        ),
      ),
    );
  }
}

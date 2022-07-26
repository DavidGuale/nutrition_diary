import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icons.dart';
import 'svg_asset.dart';

class MealCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final double? borderRadius;
  final Widget? icon;
  final Function()? onTap;
  const MealCard(
      {Key? key,
      this.title,
      this.subtitle,
      this.gradientStartColor,
      this.gradientEndColor,
      this.height,
      this.width,
      this.vectorBottom,
      this.vectorTop,
      this.borderRadius,
      this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthButton = size.width / 2 - 30;
    final heightButton = size.width / 1.8;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap ?? () {},
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              gradientStartColor ?? const Color(0xff441DFC),
              gradientEndColor ?? const Color(0xff4E81EB),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: heightButton,
                width: widthButton,
                child: Stack(
                  children: [
                    SizedBox(
                      height: heightButton,
                      width: widthButton,
                      child: const SvgAsset(
                          assetName: AssetName.vectorSmallBottom),
                    ),
                    SizedBox(
                      child: SvgAsset(
                          height: heightButton,
                          width: widthButton,
                          fit: BoxFit.fitHeight,
                          assetName: AssetName.vectorSmallTop),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: heightButton,
              width: widthButton,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        icon ??
                            const SvgAsset(
                              assetName: AssetName.headphone,
                              height: 26,
                              width: 26,
                            ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

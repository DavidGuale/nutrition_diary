import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_diary/app/ui/theme/app_colors.dart';

class NutrimentInfoCard extends StatelessWidget {
  const NutrimentInfoCard({
    Key? key,
    this.svgSrc,
    this.title,
    this.goal,
    this.quantity,
    this.color,
  }) : super(key: key);

  // final CloudStorageInfo
  final String? svgSrc, title;
  final double? goal;
  final double? quantity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final widthCard = size.width * .93;
    // const heightCard = 120.0;

    //cuadricula
    final widthCard = size.width * .43;
    const heightCard = 240.0;
    return Container(
      width: widthCard,
      height: heightCard,
      padding: const EdgeInsets.all(AppColors.defaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.tertiary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppColors.defaultPadding * 0.4),
                margin: const EdgeInsets.only(right: AppColors.defaultPadding),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  svgSrc!,
                  color: color,
                ),
              ),
            ],
          ),
          Text(
            title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          ProgressLine(
            color: color,
            percentage:
                goal! > 0 ? quantity! * 100 ~/ goal! : quantity! * 100 ~/ 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                //trunk quantity
                quantity!.toStringAsFixed(2),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              ),
              Text(
                goal.toString(),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = AppColors.primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}

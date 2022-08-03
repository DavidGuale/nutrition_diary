import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../domain/responses/daily_register_model.dart';
import '../../../theme/app_colors.dart';

class CardProductItem extends StatelessWidget {
  const CardProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final DailyRegisterModel product;

  @override
  Widget build(BuildContext context) {
    final styleBodyText1 = Theme.of(context).textTheme.bodyText1!;
    final size = MediaQuery.of(context).size;
    final widthCard = size.width * .7;
    final heightCard = size.height * .15;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: widthCard,
      height: heightCard,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          // color: AppColors.primary.withOpacity(0.1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.primary, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.1),
              offset: const Offset(3, 3),
              blurRadius: 2,
              spreadRadius: 2.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: Colors.grey[300],
                  color: AppColors.whiteSoft.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: heightCard * .8,
                child: Image(
                  image: NetworkImage(product.productos!.isEmpty
                      ? 'https://www.picachoconfuturo.org/media/zoo/images/logo_taller_alimentos_94f706ccb447432cc620874951913837.jpg'
                      : (product.productos![0].imageUrl == ''
                          ? "https://www.picachoconfuturo.org/media/zoo/images/logo_taller_alimentos_94f706ccb447432cc620874951913837.jpg"
                          : product.productos![0].imageUrl!)),
                  // height: heightCard * .95,
                  width: heightCard * .85,
                  fit: BoxFit.fitWidth,
                  // color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name!,
                      style: styleBodyText1.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 10),
                        child: SvgPicture.asset(
                          'assets/icons/calories.svg',
                          color: Colors.black.withOpacity(.8),
                        ),
                      ),
                      Text(
                        // product.productos![0].id ?? "00000000",
                        product.productos!.isEmpty
                            ? '0.0'
                            : product.productos![0].nutriments!.energyKcal!
                                .toStringAsFixed(1),
                        style: styleBodyText1.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 10, left: 20),
                        child: SvgPicture.asset(
                          'assets/icons/carbohydrates.svg',
                          color: Colors.black.withOpacity(.8),
                        ),
                      ),
                      Text(
                        // product.productos![0].id ?? "00000000",
                        product.productos!.isEmpty
                            ? '0.0'
                            : product.productos![0].nutriments!.carbohydrates!
                                .toStringAsFixed(1),
                        style: styleBodyText1.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 10, left: 20),
                        child: SvgPicture.asset(
                          'assets/icons/proteins.svg',
                          color: Colors.black.withOpacity(.8),
                        ),
                      ),
                      Text(
                        // product.productos![0].id ?? "00000000",
                        product.productos!.isEmpty
                            ? '0.0'
                            : product.productos![0].nutriments!.proteins!
                                .toStringAsFixed(1),
                        style: styleBodyText1.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

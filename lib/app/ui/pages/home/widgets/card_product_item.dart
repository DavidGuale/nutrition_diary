import 'package:flutter/material.dart';

import '../../../../domain/responses/daily_register_model.dart';

class CardProductItem extends StatelessWidget {
  const CardProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final DailyRegisterModel product;

  @override
  Widget build(BuildContext context) {
    final styleBodyText1 = Theme.of(context).textTheme.bodyText1!;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(20, 0, 0, 0),
              offset: Offset(3, 3),
              blurRadius: 9,
              spreadRadius: 7.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Image(
                  image: NetworkImage(product.productos![0].imageUrl == ''
                      ? "https://www.picachoconfuturo.org/media/zoo/images/logo_taller_alimentos_94f706ccb447432cc620874951913837.jpg"
                      : product.productos![0].imageUrl!),
                  height: 40,
                  width: 40,
                ),
              ),
              // const SizedBox(
              //   width: 10,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(product.name!,
                      style: styleBodyText1.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.productos![0].id ?? "00000000",
                    style: styleBodyText1.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.blueGrey),
                  ),
                ],
              ),
              SizedBox(
                child: Text(
                  product.productos![0].nutriments!.energyKcal == null
                      ? '0.0'
                      : product.productos![0].nutriments!.energyKcal.toString(),
                  style: styleBodyText1.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

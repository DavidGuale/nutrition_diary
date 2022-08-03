import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import 'card_product_item.dart';

class CardProductsList extends StatelessWidget {
  const CardProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List products;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: CardProductItem(product: products[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
      );
    });
  }
}

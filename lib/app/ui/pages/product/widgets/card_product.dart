import 'package:flutter/material.dart';

import '../../../../domain/models/product_model.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

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
          SizedBox(
            child: Image(
              image:
                  NetworkImage(product.urlImagen ?? "assets/images/logo1.jpg"),
              // height: 140,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(product.nombre!,
              style: styleBodyText1.copyWith(
                  fontWeight: FontWeight.w700, fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          Text(product.codigoBarras!,
              style: styleBodyText1.copyWith(
                  fontWeight: FontWeight.w700, color: Colors.blueGrey)),
        ],
      ),
    );
  }
}

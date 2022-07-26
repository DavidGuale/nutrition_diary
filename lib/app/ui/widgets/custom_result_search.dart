import 'package:flutter/material.dart';

import '../../domain/models/product_model.dart';
import '../theme/app_colors.dart';

class CustomResultSearch extends StatelessWidget {
  const CustomResultSearch({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryExtraSoft,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Recipe Photo
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blueGrey,
              image: DecorationImage(
                  image: NetworkImage(product.urlImagen ??
                      "https://www.picachoconfuturo.org/media/zoo/images/logo_taller_alimentos_94f706ccb447432cc620874951913837.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          // Recipe Info
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe title
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      product.nombre!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontFamily: 'inter'),
                    ),
                  ),
                  // Recipe Calories and Time
                  Row(
                    children: [
                      const Icon(
                        Icons.fireplace_rounded,
                        size: 14,
                        color: Colors.black,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Text(
                          product.contenidoEnergetico!.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Text(
                          product.codigoBarras!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

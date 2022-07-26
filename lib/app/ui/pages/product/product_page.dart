import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../widgets/custom_button.dart';
import '../home/home_page.dart';
import 'controller/product_controller.dart';
import 'widgets/card_product.dart';

final productProvider = SimpleProvider(
  (ref) => ProductController(),
);

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final verticalSizeSpacing = size.width * 0.08;
    final heightButton = size.height * .07;
    final widthButton = size.width * .4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: verticalSizeSpacing,
            ),
            Consumer(
              builder: (_, ref, __) {
                final product =
                    ref.watch(productProvider.select((_) => _.product)).product;
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CardProduct(product: product),
                      SizedBox(
                        height: verticalSizeSpacing * 2,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: heightButton,
                              width: widthButton,
                              child: CustomButton(
                                onTap: () async {
                                  bool insert = await productProvider.read
                                      .insertDailyRegister();
                                  if (insert) {
                                    await homeProvider.read
                                        .getDailyRegistersByUser();
                                    Navigator.pop(context);
                                  } else {
                                    print('error al insertar');
                                  }
                                },
                                icon: Icons.check,
                                label: 'Agregar',
                              ),
                            ),
                            SizedBox(
                              height: heightButton,
                              width: widthButton,
                              child: CustomButton(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                icon: Icons.close,
                                label: 'Descartar',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

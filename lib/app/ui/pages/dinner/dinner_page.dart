import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/search_delegate.dart';
import '../home/home_page.dart';
import '../home/widgets/card_products_list.dart';
import 'controller/dinner_controller.dart';

final dinnerProvider = SimpleProvider((ref) => DinnerController());

class DinnerPage extends StatelessWidget {
  const DinnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightButton = size.height * .09;
    final widthButton = size.width * .5;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cena'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: widthButton,
                    height: heightButton,
                    child: CustomButton(
                      label: 'Buscar',
                      icon: Icons.search,
                      onTap: () {
                        dinnerProvider.read.init();
                        showSearch(
                          context: context,
                          delegate: ProductSearchDelegate(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
            ],
          ),
          Expanded(child: Consumer(builder: (_, ref, __) {
            final dinnerRegistered = ref
                .watch(homeProvider.select((_) => _.dinnerRegistered))
                .dinnerRegistered;
            return dinnerRegistered.isNotEmpty
                ? CardProductsList(products: dinnerRegistered)
                : const Center(child: Text('Aun no has registrado tu cena'));
          })),
        ],
      ),
    );
  }
}

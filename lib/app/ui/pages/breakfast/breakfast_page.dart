import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/search_delegate.dart';
import '../home/home_page.dart';
import '../home/widgets/card_products_list.dart';
import 'controller/breakfast_controller.dart';

final breakfastProvider = SimpleProvider((ref) => BreakfastController());

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightButton = size.height * .09;
    final widthButton = size.width * .45;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desayuno'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
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
                            breakfastProvider.read.init();
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
                    height: size.height * .05,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .05,
              ),
            ],
          ),
          Expanded(child: Consumer(builder: (_, ref, __) {
            final breakfastRegistered = ref
                .watch(homeProvider.select((_) => _.breakfastRegistered))
                .breakfastRegistered;
            return breakfastRegistered.isNotEmpty
                ? CardProductsList(products: breakfastRegistered)
                : const Center(
                    child: Text('Aun no has registrado tu desayuno'),
                  );
          })),
        ],
      ),
    );
  }
}

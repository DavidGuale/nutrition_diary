import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/search_delegate.dart';
import '../home/home_page.dart';
import '../home/widgets/card_products_list.dart';
import 'controller/lunch_controller.dart';

final lunchProvider = SimpleProvider((ref) => LunchController());

class LunchPage extends StatelessWidget {
  const LunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightButton = size.height * .09;
    final widthButton = size.width * .5;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Almuerzo',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.white,
        elevation: 1.5,
        foregroundColor: Colors.black,
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
                  // SizedBox(
                  //   width: widthButton,
                  //   height: heightButton,
                  //   child: CustomButton(
                  //     label: 'Buscar',
                  //     icon: Icons.search,
                  //     onTap: () {
                  //       lunchProvider.read.init();
                  //       showSearch(
                  //         context: context,
                  //         delegate: ProductSearchDelegate(),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
            ],
          ),
          Expanded(child: Consumer(builder: (_, ref, __) {
            final lunchRegistered = ref
                .watch(homeProvider.select((_) => _.lunchRegistered))
                .lunchRegistered;
            return lunchRegistered.isNotEmpty
                ? CardProductsList(products: lunchRegistered)
                : const Center(
                    child: Text('Aun no has registrado tu almuerzo'));
          })),
        ],
      ),
    );
  }
}

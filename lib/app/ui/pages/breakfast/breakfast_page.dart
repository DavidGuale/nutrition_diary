import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../home/home_page.dart';
import '../home/widgets/card_products_list.dart';
import 'controller/breakfast_controller.dart';

final breakfastProvider = SimpleProvider((ref) => BreakfastController());

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desayuno',
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
          SizedBox(
            height: size.height * .02,
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

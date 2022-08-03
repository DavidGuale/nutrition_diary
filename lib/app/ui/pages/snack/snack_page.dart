import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../home/home_page.dart';
import '../home/widgets/card_products_list.dart';
import 'controller/snack_controller.dart';

final snackProvider = SimpleProvider((ref) => SnackController());

class SnackPage extends StatelessWidget {
  const SnackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Snack',
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
            height: size.height * .03,
          ),
          Expanded(child: Consumer(builder: (_, ref, __) {
            final snackRegistered = ref
                .watch(homeProvider.select((_) => _.snackRegistered))
                .snackRegistered;
            return snackRegistered.isNotEmpty
                ? CardProductsList(products: snackRegistered)
                : const Center(
                    child: Text('Aun no has registrado tus snacks'),
                  );
          })),
        ],
      ),
    );
  }
}

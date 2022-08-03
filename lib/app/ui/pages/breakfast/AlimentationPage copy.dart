import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../../data/resources/remote/AlimetsProvider.dart';
import '../../../data/resources/remote/sockets-mio.dart';
import '../../../domain/responses/daily_register_model.dart';
import '../home/home_page.dart';
import '../home/widgets/card_products_list.dart';

class AlimentationPage extends StatelessWidget {
  const AlimentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSockets.activate(context);
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
        elevation: 2.5,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * .05,
          ),
          Expanded(
            child: Consumer(
              builder: (_, ref, __) {
                final breakfastRegistered = ref
                    .watch(homeProvider.select((_) => _.breakfastRegistered))
                    .breakfastRegistered;
                return breakfastRegistered.isNotEmpty
                    ? CardProductsList(products: breakfastRegistered)
                    : const Center(
                        child: Text('Aun no has registrado tu desayuno'),
                      );
              },
            ),
          ),
        ],
      ),
      //       CustomSockets.getAlimentsProvider().getAliments(), size),
    );
  }

  List<Widget> cards(List<DailyRegisterModel> aliments, Size size) {
    print('Realizando cards');
    List<Widget> cards = [];
    for (var aliment in aliments) {
      var imageUrl =
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png";
      if (aliment.productos!.isNotEmpty) {
        if (aliment.productos![0].imageUrl != null) {
          imageUrl = aliment.productos![0].imageUrl!;
        }
      }
      cards.add(
        CardProductItem(product: aliment),
      );
    }
    return cards;
  }
}

class CardProductItem extends StatelessWidget {
  const CardProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final DailyRegisterModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue,
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
                child: FadeInImage(
                  width: size.width * 0.3,
                  height: size.height * 0.15,
                  placeholder: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif?20151024034921%22"),
                  image: NetworkImage(product.productos![0].imageUrl!),
                ),
              ),
              Text(product.name!),
              SizedBox(
                width: size.width * 0.1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

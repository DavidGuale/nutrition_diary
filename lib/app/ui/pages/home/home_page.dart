import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../routes/routes.dart';
import 'controller/home_controller.dart';
import 'widgets/meal_card.dart';
import 'widgets/icons.dart';
import 'widgets/svg_asset.dart';

final homeProvider = SimpleProvider((ref) => HomeController());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro Diario',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.white,
        elevation: 2.5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              // const CaloriesIndicator(),
              const SizedBox(height: 25),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                children: [
                  MealCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.breakfast);
                    },
                    title: "Desayuno",
                    gradientStartColor: const Color(0xff13DEA0),
                    gradientEndColor: const Color(0xff06B782),
                    icon: const SvgAsset(
                      assetName: AssetName.plus,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  MealCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.lunch);
                    },
                    title: "Almuerzo",
                    gradientStartColor: const Color(0xffFC67A7),
                    gradientEndColor: const Color(0xffF6815B),
                    icon: const SvgAsset(
                      assetName: AssetName.plus,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  MealCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.dinner);
                    },
                    title: "Cena",
                    gradientStartColor: const Color(0xffFFD541),
                    gradientEndColor: const Color(0xffF0B31A),
                    icon: const SvgAsset(
                      assetName: AssetName.plus,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  MealCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.snack);
                    },
                    title: "Snack",
                    icon: const SvgAsset(
                      assetName: AssetName.plus,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../routes/routes.dart';
import '../../theme/app_colors.dart';
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
                    gradientStartColor: AppColors.primary,
                    gradientEndColor: AppColors.primary,
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
                    gradientStartColor: AppColors.secondary,
                    gradientEndColor: AppColors.secondary,
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
                    gradientStartColor: AppColors.tertiary,
                    gradientEndColor: AppColors.tertiary,
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
                    gradientStartColor: AppColors.quaternary,
                    gradientEndColor: AppColors.quaternary,
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

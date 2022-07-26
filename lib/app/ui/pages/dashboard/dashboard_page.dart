import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../theme/app_colors.dart';
import '../home/home_page.dart';
import '../home/widgets/icons.dart';
import 'widgets/nutriment_info_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.whiteSoft,
          child: Column(
            children: [
              AppBar(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 25,
                  children: [
                    Consumer(builder: (_, ref, __) {
                      final caloriesConsumed = ref
                          .watch(homeProvider.select((_) => _.caloriesConsumed))
                          .caloriesConsumed;
                      return NutrimentInfoCard(
                        title: "Calorias",
                        svgSrc: "assets/icons/calories.svg",
                        color: const Color(0xffFC67A7),
                        percentage: 5,
                        numOfFiles: caloriesConsumed,
                        totalStorage: "1.9GB",
                      );
                    }),
                    Consumer(builder: (_, ref, __) {
                      final carbohidratesConsumed = ref
                          .watch(homeProvider
                              .select((_) => _.carbohidratesConsumed))
                          .carbohidratesConsumed;
                      return NutrimentInfoCard(
                        title: "Carbohidratos",
                        svgSrc: "assets/icons/carbohydrates.svg",
                        color: const Color(0xFFFFA113),
                        percentage: 3,
                        numOfFiles: carbohidratesConsumed,
                        totalStorage: "1.9GB",
                      );
                    }),
                    Consumer(builder: (_, ref, __) {
                      final proteinsConsumed = ref
                          .watch(homeProvider.select((_) => _.proteinsConsumed))
                          .proteinsConsumed;
                      return NutrimentInfoCard(
                        title: "Proteinas",
                        svgSrc: "assets/icons/proteins.svg",
                        color: const Color(0xFFA4CDFF),
                        percentage: 2,
                        numOfFiles: proteinsConsumed,
                        totalStorage: "1.9GB",
                      );
                    }),
                    Consumer(builder: (_, ref, __) {
                      final fatConsumed = ref
                          .watch(homeProvider.select((_) => _.fatConsumed))
                          .fatConsumed;
                      return NutrimentInfoCard(
                        title: "Grasa",
                        svgSrc: "assets/icons/fat.svg",
                        color: const Color(0xFF2697FF),
                        percentage: 10,
                        numOfFiles: fatConsumed,
                        totalStorage: "1.9GB",
                      );
                    }),
                  ],
                ),
                // GridView.builder(
                //   physics: const NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: demoMyFiles.length,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 15,
                //     mainAxisSpacing: 15,
                //     childAspectRatio: 1,
                //   ),
                //   itemBuilder: (context, index) =>
                //       FileInfoCard(info: demoMyFiles[index]),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

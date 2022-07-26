import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../../theme/app_colors.dart';
import '../home_page.dart';

class CaloriesIndicator extends StatelessWidget {
  const CaloriesIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 16, 95, 73),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(builder: (_, ref, __) {
              final caloriesGoal = ref
                  .watch(homeProvider.select((_) => _.caloriesGoal))
                  .caloriesGoal;
              return Container(
                width: size.width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$caloriesGoal',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.quaternary),
                    ),
                    const SizedBox(height: 7),
                    const Text('Meta',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.quaternary,
                        )),
                  ],
                ),
              );
            }),
            Consumer(builder: (_, ref, __) {
              final caloriesConsumed = ref
                  .watch(homeProvider.select((_) => _.caloriesConsumed))
                  .caloriesConsumed;
              return Container(
                width: size.width * .35,
                height: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 16, 95, 73),
                  borderRadius: BorderRadius.circular(100),
                  border: const Border(
                    top: BorderSide(
                        color: Color.fromARGB(255, 71, 175, 121), width: 2),
                    left: BorderSide(
                        color: Color.fromARGB(255, 71, 175, 121), width: 2),
                    right: BorderSide(
                        color: Color.fromARGB(255, 71, 175, 121), width: 2),
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 71, 175, 121), width: 2),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$caloriesConsumed',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.quaternary,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text('Calorias',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.quaternary,
                        )),
                    const Text(' Consumidas',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.quaternary,
                        )),
                  ],
                ),
              );
            }),
            Consumer(builder: (_, ref, __) {
              final caloriesRemaining = ref
                  .watch(homeProvider.select((_) => _.caloriesRemaining))
                  .caloriesRemaining;
              return Container(
                width: size.width * .25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$caloriesRemaining',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.quaternary),
                    ),
                    const SizedBox(height: 6),
                    const Text('Restantes',
                        style: TextStyle(
                            fontSize: 15, color: AppColors.quaternary)),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

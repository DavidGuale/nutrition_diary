import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/resources/remote/socket.dart';
import '../../routes/routes.dart';
import '../../theme/app_colors.dart';
import '../home/home_page.dart';
import 'widgets/nutriment_info_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSockets.activate(context);
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (_, ref, __) {
          final user = ref.watch(homeProvider.select((_) => _.user)).user;
          return Text(
            'Hola, ${user.firstName}',
            style: const TextStyle(
              color: Colors.black,
            ),
          );
        }),
        shadowColor: Colors.white,
        elevation: 2.5,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            //insert svg as icon
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: AppColors.primary,
            ),
            padding: const EdgeInsets.only(right: 16),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pushNamed(
              Routes.profile,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.10,
            child: const Text(
              'Tu progreso de hoy!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    spacing: 15,
                    runSpacing: 25,
                    children: [
                      Consumer(builder: (_, ref, __) {
                        final caloriesConsumed = ref
                            .watch(
                                homeProvider.select((_) => _.caloriesConsumed))
                            .caloriesConsumed;
                        final caloriesGoal = ref
                            .watch(homeProvider.select((_) => _.caloriesGoal))
                            .caloriesGoal;

                        return NutrimentInfoCard(
                          title: "Calorias",
                          svgSrc: "assets/icons/calories.svg",
                          color: const Color(0xffFC67A7),
                          quantity: caloriesConsumed,
                          goal: caloriesGoal,
                        );
                      }),
                      Consumer(builder: (_, ref, __) {
                        final carbohidratesConsumed = ref
                            .watch(homeProvider
                                .select((_) => _.carbohidratesConsumed))
                            .carbohidratesConsumed;
                        final carbohidratesGoal = ref
                            .watch(
                                homeProvider.select((_) => _.carbohidratesGoal))
                            .carbohidratesGoal;
                        return NutrimentInfoCard(
                          title: "Carbohidratos",
                          svgSrc: "assets/icons/carbohydrates.svg",
                          color: const Color(0xFFFFA113),
                          quantity: carbohidratesConsumed,
                          goal: carbohidratesGoal,
                        );
                      }),
                      Consumer(builder: (_, ref, __) {
                        final proteinsConsumed = ref
                            .watch(
                                homeProvider.select((_) => _.proteinsConsumed))
                            .proteinsConsumed;
                        final proteinsGoal = ref
                            .watch(homeProvider.select((_) => _.proteinsGoal))
                            .proteinsGoal;
                        return NutrimentInfoCard(
                          title: "Proteinas",
                          svgSrc: "assets/icons/proteins.svg",
                          color: const Color(0xFFA4CDFF),
                          quantity: proteinsConsumed,
                          goal: proteinsGoal,
                        );
                      }),
                      Consumer(builder: (_, ref, __) {
                        final fatConsumed = ref
                            .watch(homeProvider.select((_) => _.fatConsumed))
                            .fatConsumed;
                        final fatGoal = ref
                            .watch(homeProvider.select((_) => _.fatGoal))
                            .fatGoal;
                        return NutrimentInfoCard(
                          title: "Grasa",
                          svgSrc: "assets/icons/fat.svg",
                          color: const Color(0xFF2697FF),
                          quantity: fatConsumed,
                          goal: fatGoal,
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

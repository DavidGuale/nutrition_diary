import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:nutrition_diary/app/ui/theme/app_colors.dart';
import 'package:nutrition_diary/app/ui/widgets/custom_button.dart';

import '../../routes/routes.dart';
import '../../widgets/custom_success_dialog.dart';
import '../home/home_page.dart';
import 'widgets/custom_text_input.dart';
import 'widgets/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text('Mi Perfil',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.dashboard);
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: const DecorationImage(
                          image: AssetImage('assets/images/user.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer(builder: (_, ref, __) {
                  final user =
                      ref.watch(homeProvider.select((_) => _.user)).user;
                  return UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Nombre',
                    value: user.firstName! + ' ' + user.lastName!,
                  );
                }),
                Consumer(builder: (_, ref, __) {
                  final user =
                      ref.watch(homeProvider.select((_) => _.user)).user;
                  return UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Sexo',
                    value: user.sex,
                  );
                }),
                Consumer(builder: (_, ref, __) {
                  final user =
                      ref.watch(homeProvider.select((_) => _.user)).user;
                  return UserInfoTile(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Edad',
                    value: user.age,
                  );
                }),
                const SizedBox(height: 16),

                const Center(
                  child: Text(
                    'Objetivos Diarios',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Consumer(builder: (_, ref, __) {
                  final caloriesGoal = ref
                      .watch(homeProvider.select((_) => _.caloriesGoal))
                      .caloriesGoal;
                  return CustomTextInput(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Calorias',
                    value: caloriesGoal.toString(),
                    controller: homeProvider.read.caloriesGoalController,
                  );
                }),
                Consumer(builder: (_, ref, __) {
                  final carbohidratesGoal = ref
                      .watch(homeProvider.select((_) => _.carbohidratesGoal))
                      .carbohidratesGoal;
                  return CustomTextInput(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Carbohidratos',
                    value: carbohidratesGoal.toString(),
                    controller: homeProvider.read.carbohidratesGoalController,
                  );
                }),
                Consumer(builder: (_, ref, __) {
                  final proteinsGoal = ref
                      .watch(homeProvider.select((_) => _.proteinsGoal))
                      .proteinsGoal;
                  return CustomTextInput(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Proteinas',
                    value: proteinsGoal.toString(),
                    controller: homeProvider.read.proteinsGoalController,
                  );
                }),
                Consumer(builder: (_, ref, __) {
                  final fatGoal =
                      ref.watch(homeProvider.select((_) => _.fatGoal)).fatGoal;
                  return CustomTextInput(
                    margin: const EdgeInsets.only(bottom: 16),
                    label: 'Grasas',
                    value: fatGoal.toString(),
                    controller: homeProvider.read.fatGoalController,
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                //save Button
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    label: 'Guardar',
                    onTap: () {
                      homeProvider.read.saveEditNutriments();
                      //show custom dialog
                      showDialog(
                        context: context,
                        builder: (_) => CustomSuccessDialog(
                          description: 'Datos guardados correctamente',
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.dashboard);
                          },
                        ),
                      );
                    },
                    icon: Icons.save,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

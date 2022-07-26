import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'app/ui/routes/app_routes.dart';
import 'app/ui/routes/routes.dart';
import 'app/ui/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition Diary',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: routes,
      navigatorObservers: [
        router.observer,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
      ),
    );
  }
}

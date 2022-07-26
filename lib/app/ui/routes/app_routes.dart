import 'package:flutter/widgets.dart';
import 'package:nutrition_diary/app/ui/routes/routes.dart';

import '../pages/breakfast/breakfast_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/dinner/dinner_page.dart';
import '../pages/home/home_page.dart';
import '../pages/lunch/lunch_page.dart';
import '../pages/main_menu/main_menu_page.dart';
import '../pages/snack/snack_page.dart';
import '../pages/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.splash: (_) => const SplashPage(),
  Routes.mainMenu: (_) => const MainMenuPage(),
  Routes.home: (_) => const HomePage(),
  Routes.breakfast: (_) => const BreakfastPage(),
  Routes.lunch: (_) => const LunchPage(),
  Routes.dinner: (_) => const DinnerPage(),
  Routes.snack: (_) => const SnackPage(),
  Routes.dashboard: (_) => const DashboardPage(),
};

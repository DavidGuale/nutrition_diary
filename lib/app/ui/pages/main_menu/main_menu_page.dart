import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import '../../theme/app_colors.dart';
import '../dashboard/dashboard_page.dart';
import '../home/home_page.dart';
import 'controller/main_menu_controller.dart';

final mainMenuProvider = SimpleProvider(
  (ref) => MainMenuController(),
);

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final selectedIndex = ref
          .watch(mainMenuProvider.select((_) => _.selectedIndex))
          .selectedIndex;
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Registros',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          onTap: mainMenuProvider.read.onItemTapped,
        ),
      );
    });
  }
}

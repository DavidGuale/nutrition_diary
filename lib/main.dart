import 'package:flutter/material.dart';
import 'package:nutrition_diary/dependency_injector.dart';
import 'package:nutrition_diary/my_app.dart';

import 'app/data/resources/remote/socket.dart';
// import 'app/data/resources/remote/sockets.dart';

void main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CustomSockets.init();

  // await DataBase.instance.comprobarBase();
  injectDependencies();
  runApp(const MyApp());
}

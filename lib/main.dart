import 'package:flutter/material.dart';
import 'package:nutrition_diary/dependency_injector.dart';
import 'package:nutrition_diary/my_app.dart';

void main() async {
  // HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // await DataBase.instance.comprobarBase();
  injectDependencies();
  runApp(const MyApp());
}

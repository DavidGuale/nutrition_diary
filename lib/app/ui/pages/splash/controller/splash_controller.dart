import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../routes/routes.dart';

class SplashController extends SimpleNotifier {
  final _storage = Get.i.find<FlutterSecureStorage>();

  SplashController() {
    init();
  }

  //var's
  bool _navigate = false;
  String _routeName = "";
  //get's
  bool get navigate => _navigate;
  String get routeName => _routeName;
  //set's

  set navigate(bool newNavigate) {
    _navigate = newNavigate;
    // notify(['navigate']);
    notify();
  }

  set routeName(String newRouteName) {
    _routeName = newRouteName;
    // notify(['navigate']);
    notify();
  }

  //methods
  Future<void> init() async {
    String? token = await _storage.read(key: 'token');
    if (token != null && token.isNotEmpty) {
      // Get.i.find<Dio>().options.baseUrl = "/api/";
      _routeName = Routes.mainMenu;
    } else {
      //TODO: change to onboarding
      _routeName = Routes.mainMenu;
    }
    await Future.delayed(const Duration(milliseconds: 1200));
    _navigate = true;
    // notify(["navigate", "routeName"]);
    notify();
  }
}

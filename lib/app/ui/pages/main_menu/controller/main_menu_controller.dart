import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainMenuController extends SimpleNotifier {
  final _storage = Get.i.find<FlutterSecureStorage>();

  MainMenuController() {
    init();
  }
  //variables

  String? _userId;
  int _selectedIndex = 0;

  //Gets
  String? get userId => _userId;
  int get selectedIndex => _selectedIndex;

  //set's
  set selectedIndex(int value) {
    _selectedIndex = value;
    notify();
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
  }

  Future<void> init() async {
    // notify(["version", "lastImgSync", "lastSyncAll", "server", "userId"]);
    notify();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
  }
}

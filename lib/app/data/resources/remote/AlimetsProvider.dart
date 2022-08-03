import 'package:flutter/cupertino.dart';

import '../../../domain/responses/daily_register_model.dart';

class AlimentsProvider extends ChangeNotifier {
  List<DailyRegisterModel> _aliments = [];

  set aliments(DailyRegisterModel aliment) {
    print('Existen cambios en el alimento:' + _aliments.length.toString());
    _aliments.add(aliment);
    print('Insertando alimento');
    print(aliment.toJson());
    notifyListeners();
  }

  //get aliments
  List<DailyRegisterModel> getAliments() {
    return [..._aliments];
  }
}

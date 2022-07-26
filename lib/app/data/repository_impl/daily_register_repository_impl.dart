import '../../domain/models/daily_register_model.dart';
import '../../domain/repository/daily_register_repository.dart';
import '../resources/remote/daily_register_api.dart';

class DailyRegisterRepositoryImpl extends DailyRegisterRepository {
  final DailyRegisterAPI _api;
  DailyRegisterRepositoryImpl(this._api);
  @override
  Future<Map<String, dynamic>> getDailyRegistersByUser(int id) =>
      _api.getDailyRegistersByUser(id);

  @override
  Future<Map<String, dynamic>> insertDailyRegister(
          {required Registro dailyRegister}) =>
      _api.insertDailyRegister(dailyRegister);
}

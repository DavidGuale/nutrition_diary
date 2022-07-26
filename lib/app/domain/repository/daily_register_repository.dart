import '../models/daily_register_model.dart';

abstract class DailyRegisterRepository {
  Future<Map<String, dynamic>> getDailyRegistersByUser(int id);

  Future<Map<String, dynamic>> insertDailyRegister(
      {required Registro dailyRegister});

  // Future<List<Registro>> getBalancesLocal();

  // Future<List<Registro>> getBalanceById(int id);

  // Future<int> insertBalance(Registro balance);

  // Future<int> deleteBalance();
}

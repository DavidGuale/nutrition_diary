import '../models/user_parameters_model.dart';

abstract class UserRepository {
  Future<Map<String, dynamic>> insertUserParameters(
      {required int userId, required UserParameters userParameters});
}

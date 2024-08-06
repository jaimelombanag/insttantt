import 'package:insttantt_test/features/register/data/data_source/local/register_user.db.dart';
import 'package:insttantt_test/features/register/domain/repositories/register_user_repository.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  @override
  Future<User> registerUser(User user) async {
    return RegisterUserDB().registerUserDB(user);
  }
}

import 'package:insttantt_test/features/login/data/data_source/local/login_user.db.dart';
import 'package:insttantt_test/features/login/domain/repositories/login_user_repository.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class LoginUserRepositoryImpl implements LoginUserRepository {
  @override
  Future<User?> loginUser(String email, String password) {
    return LoginUserDB().loginUserDB(email, password);
  }
}

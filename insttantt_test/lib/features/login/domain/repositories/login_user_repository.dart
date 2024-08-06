import 'package:insttantt_test/global/core/domain/models/user.dart';

abstract class LoginUserRepository {
  Future<User?> loginUser(String email, String password);
}

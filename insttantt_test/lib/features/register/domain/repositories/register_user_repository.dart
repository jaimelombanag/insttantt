import 'package:insttantt_test/global/core/domain/models/user.dart';

abstract class RegisterUserRepository {
  Future<User> registerUser(User user);
}

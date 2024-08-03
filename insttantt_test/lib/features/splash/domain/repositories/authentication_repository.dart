import 'package:insttantt_test/global/core/domain/models/user.dart';

abstract class AuthenticationRepository {
  Future<User> get user;
  Future<void> signOut();
}

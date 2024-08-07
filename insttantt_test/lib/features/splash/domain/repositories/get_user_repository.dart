import 'package:insttantt_test/global/core/domain/models/user.dart';

abstract class GetUserRepository {
  Future<User> getUserDataBase();
}

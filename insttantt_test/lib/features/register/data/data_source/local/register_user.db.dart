import 'package:insttantt_test/global/core/data/data_source/local/user/user_data_base.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class RegisterUserDB {
  Future<User> registerUserDB(User user) async {
    try {
      var userSave = await UserDatabase.instance.createUser(user);
      return userSave;
    } catch (e) {
      return const User(name: '', email: '', password: '');
    }
  }
}

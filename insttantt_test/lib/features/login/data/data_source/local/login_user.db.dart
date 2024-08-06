import 'package:insttantt_test/global/core/data/data_source/local/user/user_data_base.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class LoginUserDB {
  Future<User?> loginUserDB(String email, String password) async {
    try {
      var userSave = await UserDatabase.instance.getUser(email, password);
      return userSave;
    } catch (e) {
      return null;
    }
  }
}

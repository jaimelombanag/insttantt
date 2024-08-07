import 'package:insttantt_test/global/core/data/data_source/local/user/user_data_base.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class GetUserDB {
  Future<User> getUserDB() async {
    List<User> user = await UserDatabase.instance.readAllUser();
    if (user.isNotEmpty) {
      return user.first;
    }
    return const User(name: '', email: '', password: '');
  }
}

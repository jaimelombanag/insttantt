import 'package:insttantt_test/global/core/data/data_source/local/user/user_data_base.dart';

class SessionCloseDB {
  Future<bool> sessionCloseDB() async {
    try {
      var close = await UserDatabase.instance.deleteAllUser();
      return true;
    } catch (e) {
      return false;
    }
  }
}

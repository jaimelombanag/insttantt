import 'package:insttantt_test/global/core/data/data_source/local/user/user_data_base.dart';

class SessionCloseDB {
  Future<int> sessionCloseDB() async {
    try {
      return await UserDatabase.instance.deleteAllUser();
    } catch (e) {
      return 0;
    }
  }
}

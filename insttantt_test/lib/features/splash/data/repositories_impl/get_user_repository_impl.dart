import 'package:insttantt_test/features/splash/data/data_source/local/get_user_db.dart';
import 'package:insttantt_test/features/splash/domain/repositories/get_user_repository.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  @override
  Future<User> getUserDataBase() {
    return GetUserDB().getUserDB();
  }
}

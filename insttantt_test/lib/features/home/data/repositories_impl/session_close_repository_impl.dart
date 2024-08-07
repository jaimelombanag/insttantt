import 'package:insttantt_test/features/home/data/data_source/local/session_close.db.dart';
import 'package:insttantt_test/features/home/domain/repositories/session_close_repository.dart';

class SessionCloseRepositoryImpl implements SessionCloseRepository {
  @override
  Future<int> sessionCloseContct() {
    return SessionCloseDB().sessionCloseDB();
  }
}

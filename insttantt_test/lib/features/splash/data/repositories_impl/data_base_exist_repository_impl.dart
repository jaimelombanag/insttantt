import 'package:insttantt_test/features/splash/data/data_source/local/data_base_exist.dart';
import 'package:insttantt_test/features/splash/domain/repositories/data_base_exist_repository.dart';

class DataBaseExistRepositoryImpl implements DataBaseExistRepository {
  @override
  Future<bool> existDataBase(String dbName) {
    return DataBaseExist().existDataBase(dbName);
  }
}

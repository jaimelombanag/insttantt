import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/features/splash/data/repositories_impl/data_base_exist_repository_impl.dart';
import 'package:insttantt_test/features/splash/domain/repositories/data_base_exist_repository.dart';

void injectDependencies() {
  Get.i.lazyPut<DataBaseExistRepository>(
    () => DataBaseExistRepositoryImpl(),
  );
}

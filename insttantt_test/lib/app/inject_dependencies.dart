import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/features/login/data/repositories_impl/login_user_repository_impl.dart';
import 'package:insttantt_test/features/login/domain/repositories/login_user_repository.dart';
import 'package:insttantt_test/features/register/data/repositories_impl/register_user_repository_impl.dart';
import 'package:insttantt_test/features/register/domain/repositories/register_user_repository.dart';
import 'package:insttantt_test/features/splash/data/repositories_impl/data_base_exist_repository_impl.dart';
import 'package:insttantt_test/features/splash/domain/repositories/data_base_exist_repository.dart';

void injectDependencies() {
  Get.i.lazyPut<DataBaseExistRepository>(
    () => DataBaseExistRepositoryImpl(),
  );

  Get.i.lazyPut<RegisterUserRepository>(
    () => RegisterUserRepositoryImpl(),
  );

  Get.i.lazyPut<LoginUserRepository>(
    () => LoginUserRepositoryImpl(),
  );
}

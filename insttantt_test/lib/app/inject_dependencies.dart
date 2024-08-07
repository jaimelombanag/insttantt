import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/features/home/data/repositories_impl/get_all_contact_repository_impl.dart';
import 'package:insttantt_test/features/home/data/repositories_impl/save_contact_repository_impl.dart';
import 'package:insttantt_test/features/home/data/repositories_impl/session_close_repository_impl.dart';
import 'package:insttantt_test/features/home/domain/repositories/get_all_contact_repository.dart';
import 'package:insttantt_test/features/home/domain/repositories/save_contact_repository.dart';
import 'package:insttantt_test/features/home/domain/repositories/session_close_repository.dart';
import 'package:insttantt_test/features/login/data/repositories_impl/login_user_repository_impl.dart';
import 'package:insttantt_test/features/login/domain/repositories/login_user_repository.dart';
import 'package:insttantt_test/features/register/data/repositories_impl/register_user_repository_impl.dart';
import 'package:insttantt_test/features/register/domain/repositories/register_user_repository.dart';
import 'package:insttantt_test/features/splash/data/repositories_impl/data_base_exist_repository_impl.dart';
import 'package:insttantt_test/features/splash/data/repositories_impl/get_user_repository_impl.dart';
import 'package:insttantt_test/features/splash/domain/repositories/data_base_exist_repository.dart';
import 'package:insttantt_test/features/splash/domain/repositories/get_user_repository.dart';

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

  Get.i.lazyPut<SessionCloseRepository>(
    () => SessionCloseRepositoryImpl(),
  );
  Get.i.lazyPut<SaveContactRepository>(
    () => SaveContactRepositoryImpl(),
  );
  Get.i.lazyPut<GetAllContactRepository>(
    () => GetAllContactRepositoryImpl(),
  );

  Get.i.lazyPut<GetUserRepository>(
    () => GetUserRepositoryImpl(),
  );
}

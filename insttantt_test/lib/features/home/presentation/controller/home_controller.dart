import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/register/domain/repositories/register_user_repository.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class HomeController extends SimpleNotifier {
  final _registerUser = Get.i.find<RegisterUserRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  HomeController() {}

  void goLogin() {
    _routeName = Routes.LOGIN;
    notify();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

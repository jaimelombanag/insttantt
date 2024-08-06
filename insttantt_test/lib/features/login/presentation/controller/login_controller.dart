import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/login/domain/repositories/login_user_repository.dart';

class LoginController extends SimpleNotifier {
  final _loginUser = Get.i.find<LoginUserRepository>();
  String? _routeName;
  String? get routeName => _routeName;

  Future<void> LoginUser(String email, String password) async {
    var userSave = await _loginUser.loginUser(email, password);
    if (userSave != null) {
    } else {}
  }

  void goRegister() {
    _routeName = Routes.REGISTER;
    notify();
  }
}

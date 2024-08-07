import 'package:flutter_meedu/meedu.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/login/domain/repositories/login_user_repository.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';

class LoginController extends SimpleNotifier {
  final _loginUser = Get.i.find<LoginUserRepository>();
  String? _routeName;
  String? get routeName => _routeName;

  User? _user;
  User? get user => _user;

  // ignore: non_constant_identifier_names
  Future<void> LoginUser(String email, String password) async {
    var userSave = await _loginUser.loginUser(email, password);
    if (userSave != null) {
      _user = userSave;
      _routeName = Routes.HOME;
      notify();
    } else {
      Fluttertoast.showToast(
          msg: "¡Usuario no esta registrado!",
          toastLength: Toast.LENGTH_SHORT, // O Toast.LENGTH_LONG
          gravity:
              ToastGravity.BOTTOM, // O ToastGravity.CENTER, ToastGravity.TOP
          timeInSecForIosWeb: 1, // Duración en segundos para iOS/Web
          backgroundColor: ThemeColor.black,
          textColor: ThemeColor.white,
          fontSize: 16.0);
    }
  }

  void goRegister() {
    _routeName = Routes.REGISTER;
    notify();
  }
}

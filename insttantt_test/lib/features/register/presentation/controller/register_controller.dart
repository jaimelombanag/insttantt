import 'package:flutter_meedu/meedu.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/register/domain/repositories/register_user_repository.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';

class RegisterController extends SimpleNotifier {
  final _registerUser = Get.i.find<RegisterUserRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  Future<void> registerUser(User user) async {
    var userSave = await _registerUser.registerUser(user);
    if (userSave.name.isNotEmpty) {
      Fluttertoast.showToast(
          msg: "¡Usuario registrado exitosamente!",
          toastLength: Toast.LENGTH_SHORT, // O Toast.LENGTH_LONG
          gravity:
              ToastGravity.BOTTOM, // O ToastGravity.CENTER, ToastGravity.TOP
          timeInSecForIosWeb: 1, // Duración en segundos para iOS/Web
          backgroundColor: ThemeColor.black,
          textColor: ThemeColor.white,
          fontSize: 16.0);
      _routeName = Routes.LOGIN;
      notify();
    } else {
      Fluttertoast.showToast(
          msg: "¡No fue posible registrar usuario.!",
          toastLength: Toast.LENGTH_SHORT, // O Toast.LENGTH_LONG
          gravity:
              ToastGravity.BOTTOM, // O ToastGravity.CENTER, ToastGravity.TOP
          timeInSecForIosWeb: 1, // Duración en segundos para iOS/Web
          backgroundColor: ThemeColor.black,
          textColor: ThemeColor.white,
          fontSize: 16.0);
    }
  }

  void goLogin() {
    _routeName = Routes.LOGIN;
    notify();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

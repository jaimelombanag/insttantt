import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/splash/domain/repositories/get_user_repository.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';

class SplashController extends SimpleNotifier {
  final _getUser = Get.i.find<GetUserRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  User? _user;
  User? get user => _user;

  SplashController() {
    _init();
  }

  void _init() async {
    Future.delayed(const Duration(milliseconds: 4000), () async {
      // final isuser =
      //     await _existDataBase.existDataBase(ComunNamesConst.nameDBuser);
      final userBd = await _getUser.getUserDataBase();
      if (userBd.name.isNotEmpty) {
        _user = userBd;
        _routeName = Routes.HOME;
      } else {
        _routeName = Routes.LOGIN;
      }
      notify();
    });
  }
}

import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/app/routes/routes.dart';

class SplashController extends SimpleNotifier {
  //final _authRepository = Get.i.find<AuthenticationRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController() {
    _init();
  }

  void _init() async {
    Future.delayed(const Duration(milliseconds: 4000), () async {
      // final user = await _authRepository.user;
      // _routeName = user != null ? Routes.HOME : Routes.LOGIN;
      _routeName = Routes.LOGIN;
      // //_routeName = user != null ? Routes.CTRINVENTARIO : Routes.LOGIN;
      notify();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

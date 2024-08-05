import 'package:flutter_meedu/meedu.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/splash/domain/repositories/data_base_exist_repository.dart';
import 'package:insttantt_test/global/constants/comun_names.dart';

class SplashController extends SimpleNotifier {
  final _existDataBase = Get.i.find<DataBaseExistRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController() {
    _init();
  }

  void _init() async {
    Future.delayed(const Duration(milliseconds: 4000), () async {
      final isuser =
          await _existDataBase.existDataBase(ComunNamesConst.nameDBuser);
      if (isuser) {
        _routeName = Routes.HOME;
      } else {
        _routeName = Routes.LOGIN;
      }
      notify();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

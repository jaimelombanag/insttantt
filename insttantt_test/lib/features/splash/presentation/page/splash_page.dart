import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:insttantt_test/features/splash/presentation/controller/splash_controller.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';

final splashProvider = SimpleProvider((_) => SplashController(),
    autoDispose: true //Si se deja false no destrulle el controller
    );

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (_, controller) {
        final routeName = controller.routeName;
        if (routeName != null) {
          router.pushReplacementNamed(routeName, arguments: controller.user);
        }
      },
      builder: (_, __) {
        return Scaffold(
          //backgroundColor: ThemeColor.secundaryApp,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ThemeColor.primaryApp,
                ThemeColor.primaryApp,
                ThemeColor.primaryApp,
                ThemeColor.primaryApp,
                ThemeColor.secundaryApp,
                ThemeColor.secundaryApp,
                ThemeColor.secundaryApp,
                ThemeColor.white,
              ],
            )),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitWidth,
                height: 200,
                width: 200,
              ),
            ),
          ),
        );
      },
    );
  }
}

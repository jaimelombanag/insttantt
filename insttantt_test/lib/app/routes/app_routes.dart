import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/login/presentation/view/login_page.dart';
import 'package:insttantt_test/features/splash/presentation/page/splash_page.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      // Routes.HOME: (_) => const HomePage(),
      // Routes.REGISTER: (_) => const AddItem(),
      // Routes.CONTACTS: (_) => const HistoryInventaryPage(),
    };

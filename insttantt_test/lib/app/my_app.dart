import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:insttantt_test/app/routes/app_routes.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/global/constants/comun_names.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ComunNamesConst.nameApp,
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      theme: ThemeData(primarySwatch: Colors.green),
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
    );
  }
}

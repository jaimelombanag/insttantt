import 'package:flutter/material.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape3.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape4.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape5.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape6.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/tools/gradients.dart';

import '../widgets/build_form_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreen3State createState() => _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginPage> {
  GlobalKey key = GlobalKey();
  double buttonOffset = 40.0;
  double textOffset = 60.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      getSizeOfCard();
    });
  }

  void getSizeOfCard() {
    final keyContext = key.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      setState(() {
        buttonOffset = (box.size.height / 2) - 30;
        textOffset = box.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomLoginShapeClipper4(),
                child: Container(
                  height: heightOfScreen,
                  decoration:
                      const BoxDecoration(color: ThemeColor.secundaryApp),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomLoginShapeClipper5(),
                child: Container(
                  height: heightOfScreen,
                  decoration: const BoxDecoration(
                    gradient: Gradients.curvesGradient1,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomLoginShapeClipper6(),
                child: Container(
                  height: heightOfScreen,
                  decoration: const BoxDecoration(
                    color: ThemeColor.secundaryApp,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: CustomLoginShapeClipper3(),
                child: Container(
                  height: heightOfScreen,
                  decoration: const BoxDecoration(
                    gradient: Gradients.curvesGradient2,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Container(
                            height: heightOfScreen * 0.25,
                          ),
                          const Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: heightOfScreen * 0.05),
                          buildForm(context: context, key: key),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: ThemeColor.secundaryApp,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

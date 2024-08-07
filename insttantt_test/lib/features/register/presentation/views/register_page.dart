import 'package:flutter/material.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape3.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape4.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape5.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape6.dart';
import 'package:insttantt_test/features/register/presentation/widgets/build_form_register.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/tools/gradients.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      // Permiso ya concedido, puedes continuar con la funcionalidad de cámara
    } else if (status.isDenied) {
      // Permiso denegado, puedes solicitarlo
      await Permission.camera.request();
    } else if (status.isPermanentlyDenied) {
      // El permiso ha sido denegado de manera permanente, muestra una advertencia o instrucciones
      openAppSettings();
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
                  decoration: const BoxDecoration(color: ThemeColor.primaryApp),
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
                    color: ThemeColor.primaryApp,
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
            Stack(
              children: <Widget>[
                Positioned(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Container(
                              height: heightOfScreen * 0.20,
                            ),
                            const Text(
                              'Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ThemeColor.primaryApp,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: const FormRegister(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

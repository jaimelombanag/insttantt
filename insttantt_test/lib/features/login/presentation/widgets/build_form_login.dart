import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:insttantt_test/features/login/presentation/controller/login_controller.dart';
import 'package:insttantt_test/global/constants/comun_names.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/utils/validate_forms.dart';
import 'package:flutter_meedu/router.dart' as router;

final loginProvider = SimpleProvider((_) => LoginController(),
    autoDispose: true //Si se deja false no destrulle el controller
    );

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  //final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(
        left: 0,
        top: 8,
        bottom: 8,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                maxLength: ComunNamesConst.maxCharacterEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    FeatherIcons.user,
                    color: ThemeColor.secundaryApp,
                    size: 20,
                  ),
                  labelText: 'Ingresa tu email',
                  labelStyle: TextStyle(
                    color: ThemeColor
                        .secundaryApp, // Cambia el color del label aquí
                  ),
                ),
                validator: validateEmail,
              ),
              TextFormField(
                controller: passwordController,
                maxLength: ComunNamesConst.maxCharacterPassword,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    FeatherIcons.lock,
                    color: ThemeColor.secundaryApp,
                    size: 20,
                  ),
                  labelText: 'Ingrese su contraseña',
                  labelStyle: TextStyle(
                    color: ThemeColor
                        .secundaryApp, // Cambia el color del label aquí
                  ),
                ),
                obscureText: true,
                validator: validatePassword,
              ),
              ProviderListener<LoginController>(
                provider: loginProvider,
                onChange: (_, controller) {
                  final routeName = controller.routeName;
                  if (routeName != null) {
                    router.pushReplacementNamed(routeName,
                        arguments: controller.user);
                  }
                },
                builder: (_, controller) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.LoginUser(
                                emailController.text, passwordController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              ThemeColor.primaryApp),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          overlayColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          shadowColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          elevation: WidgetStateProperty.all<double>(0.1),
                        ),
                        child: const Text(
                          'Ingresar',
                          style: TextStyle(
                              color: ThemeColor.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

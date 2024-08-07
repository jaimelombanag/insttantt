import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:insttantt_test/features/register/presentation/controller/register_controller.dart';
import 'package:insttantt_test/global/constants/comun_names.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/utils/validate_forms.dart';
import 'package:flutter_meedu/router.dart' as router;

final registerProvider = SimpleProvider((_) => RegisterController(),
    autoDispose: true //Si se deja false no destrulle el controller
    );

class FormRegister extends StatelessWidget {
  const FormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirPasswordController =
        TextEditingController();
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
                controller: nameController,
                maxLength: ComunNamesConst.maxCharacterName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    FeatherIcons.user,
                    color: ThemeColor.secundaryApp,
                    size: 20,
                  ),
                  labelText: 'Ingresa tu Nombre',
                  labelStyle: TextStyle(
                    color: ThemeColor
                        .secundaryApp, // Cambia el color del label aquí
                  ),
                ),
                validator: validateName,
              ),
              TextFormField(
                controller: emailController,
                maxLength: ComunNamesConst.maxCharacterEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    FeatherIcons.atSign,
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
              TextFormField(
                controller: confirPasswordController,
                maxLength: ComunNamesConst.maxCharacterPassword,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    FeatherIcons.lock,
                    color: ThemeColor.secundaryApp,
                    size: 20,
                  ),
                  labelText: 'Repita su contraseña',
                  labelStyle: TextStyle(
                    color: ThemeColor
                        .secundaryApp, // Cambia el color del label aquí
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor confirma tu contraseña';
                  }
                  if (value != passwordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              ProviderListener<RegisterController>(
                provider: registerProvider,
                onChange: (_, controller) {
                  final routeName = controller.routeName;
                  if (routeName != null) {
                    router.pushReplacementNamed(routeName);
                  }
                },
                builder: (_, controller) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint('--Name: ${nameController.text}');
                            debugPrint('--Email: ${emailController.text}');
                            debugPrint('--Pass: ${passwordController.text}');
                            User user = User(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            controller.registerUser(user);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
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
                          'Registrar',
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
              ProviderListener<RegisterController>(
                provider: registerProvider,
                onChange: (_, controller) {
                  final routeName = controller.routeName;
                  if (routeName != null) {
                    router.pushReplacementNamed(routeName);
                  }
                },
                builder: (_, controller) {
                  return SizedBox(
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        controller.goLogin();
                      },
                      child: const Text(
                        'Ingreso',
                        style: TextStyle(
                          color: ThemeColor.primaryApp,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          decorationColor: ThemeColor
                              .primaryApp, // Cambia el color del subrayado aquí
                          decorationThickness: 2.0, // Grosor del subrayado
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

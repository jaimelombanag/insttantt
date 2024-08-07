import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';
import 'package:insttantt_test/features/home/presentation/controller/home_controller.dart';
import 'package:insttantt_test/global/constants/comun_names.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/utils/validate_forms.dart';

final homeProvider = SimpleProvider((_) => HomeController(),
    autoDispose: true //Si se deja false no destrulle el controller
    );

// ignore: non_constant_identifier_names
void DialogAddContact(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController identificationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Ingrese Contacto'),
        content: SizedBox(
          height: 280,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  maxLength: ComunNamesConst.maxCharacterEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      FeatherIcons.user,
                      color: ThemeColor.secundaryApp,
                      size: 20,
                    ),
                    labelText: 'Nombre',
                    labelStyle: TextStyle(
                      color: ThemeColor
                          .secundaryApp, // Cambia el color del label aquí
                    ),
                  ),
                  validator: validateNameContact,
                ),
                TextFormField(
                  controller: identificationController,
                  maxLength: ComunNamesConst.maxCharacterIdentification,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      FeatherIcons.lock,
                      color: ThemeColor.secundaryApp,
                      size: 20,
                    ),
                    labelText: 'Identificación',
                    labelStyle: TextStyle(
                      color: ThemeColor
                          .secundaryApp, // Cambia el color del label aquí
                    ),
                  ),
                  obscureText: true,
                  validator: validateIdentification,
                ),
                ProviderListener<HomeController>(
                  provider: homeProvider,
                  onChange: (_, controller) {},
                  builder: (_, controller) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              int identificacion =
                                  int.parse(identificationController.text);
                              Contact contact = Contact(
                                  name: nameController.text,
                                  identification: identificacion);
                              controller.addContacts(contact);
                              Navigator.of(context).pop();
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
                            'Guardar',
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
    },
  );
}

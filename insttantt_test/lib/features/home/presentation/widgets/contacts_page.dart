import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';
import 'package:insttantt_test/features/home/presentation/controller/home_controller.dart';
import 'package:insttantt_test/features/home/presentation/widgets/item_contact.dart';
import 'package:insttantt_test/global/constants/comun_names.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/utils/validate_forms.dart';

final homeProvider = SimpleProvider((_) => HomeController(), autoDispose: true);

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController identificationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<Contact> contacts = List.empty();
  List<Contact> _filteredItems = List.empty();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _showInputDialog(BuildContext context) {
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
                    obscureText: false,
                    validator: validateIdentification,
                    keyboardType: TextInputType.number,
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

  void _filterItems(String query) {
    if (query.length < 3) {
      setState(() {
        _filteredItems = contacts;
      });
    } else {
      setState(() {
        _filteredItems = contacts
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Contactos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showInputDialog(context);
            },
          ),
        ],
      ),
      backgroundColor: ThemeColor.secundaryApp,
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40, top: 10),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Buscar...',
              labelText: 'Buscar',
              labelStyle: const TextStyle(
                color: ThemeColor.black,
                fontWeight: FontWeight.bold,
              ),
              hintStyle: const TextStyle(
                color: ThemeColor.gray,
                fontStyle: FontStyle.italic,
              ),
              prefixIcon: const Icon(Icons.search, color: ThemeColor.black),
              filled: true,
              fillColor: ThemeColor.black.withOpacity(0.1),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: ThemeColor.black),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: ThemeColor.black, width: 2.0),
              ),
            ),
            onChanged: _filterItems,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40, top: 70),
          child: ProviderListener<HomeController>(
            provider: homeProvider,
            onChange: (_, controller) {
              contacts = controller.contacts!;
              _filteredItems = contacts;
              setState(() {});
            },
            builder: (_, controller) {
              if (controller.contacts == null) {
                return Container();
              } else {
                return ListView.builder(
                  itemCount:
                      _filteredItems.length, // Número de elementos en la lista
                  itemBuilder: (context, index) {
                    return ItemContact(contacts: _filteredItems, index: index);
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

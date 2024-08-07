// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insttantt_test/features/home/presentation/controller/home_controller.dart';
import 'package:insttantt_test/global/constants/comun_names.dart';
import 'package:insttantt_test/global/core/domain/models/user.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:shared_preferences/shared_preferences.dart';

final homeProvider = SimpleProvider((_) => HomeController(), autoDispose: true);

// ignore: must_be_immutable
class AcountPage extends StatefulWidget {
  User user;
  // ignore: use_super_parameters
  AcountPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<AcountPage> createState() => _AcountPageState();
}

class _AcountPageState extends State<AcountPage> {
  XFile? _image; // XFile is used to handle image files
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
    _saveImagePath(image!.path);
  }

  Future<void> _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(ComunNamesConst.keyPathImage, path);
  }

  Future<void> _loadImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final imagePath = prefs.getString(ComunNamesConst.keyPathImage);

      if (imagePath != null) {
        setState(() {
          _image = XFile(imagePath);
        });
      }
    } catch (e) {
      debugPrint('-----Error al Cargar imagen: $e');
    }
  }

  void _showPictureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecciona!!!'),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Buscar en galeria'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tomar foto de Camara'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = widget.user.name.split(' ');
    String initials = nameParts.first[0];
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 25, left: 25, right: 25, bottom: 10),
              decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeColor.white.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 25, right: 20, left: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ProviderListener<HomeController>(
                        provider: homeProvider,
                        onChange: (_, controller) {
                          final routeName = controller.routeName;
                          if (routeName != null) {
                            router.pushReplacementNamed(routeName);
                          }
                        },
                        builder: (_, controller) {
                          return TextButton(
                            onPressed: () {
                              controller.sessionClose();
                            },
                            child: const Text(
                              'Cerrar Sesion',
                              style: TextStyle(
                                color: ThemeColor.primaryApp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: ThemeColor
                                    .primaryApp, // Cambia el color del subrayado aquí
                                decorationThickness: 2.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _image == null
                                ? Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 80, // Tamaño del avatar
                                        backgroundColor: Colors
                                            .blue, // Color de fondo del avatar
                                        child: Text(
                                          initials.toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 50),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () =>
                                              _showPictureDialog(context),
                                          child: const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.red,
                                            child: Icon(Icons.camera_alt,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 80,
                                        backgroundColor: Colors.grey.shade200,
                                        backgroundImage: _image != null
                                            ? FileImage(File(_image!.path))
                                            : null,
                                        child: _image == null
                                            ? Icon(Icons.person,
                                                size: 60,
                                                color: Colors.grey.shade700)
                                            : null,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () =>
                                              _showPictureDialog(context),
                                          child: const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.red,
                                            child: Icon(Icons.camera_alt,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: (size.width - 40) * 0.6,
                          child: Column(
                            children: [
                              Text(
                                widget.user.name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.primaryApp),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Software Developer",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: ThemeColor.black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          children: [
                            Text(
                              "\$8900",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeColor.primaryApp),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Income",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: ThemeColor.black),
                            ),
                          ],
                        ),
                        Container(
                          width: 0.5,
                          height: 40,
                          color: ThemeColor.black.withOpacity(0.3),
                        ),
                        const Column(
                          children: [
                            Text(
                              "\$5500",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeColor.primaryApp),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Expenses",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: ThemeColor.black),
                            ),
                          ],
                        ),
                        Container(
                          width: 0.5,
                          height: 40,
                          color: ThemeColor.black.withOpacity(0.3),
                        ),
                        const Column(
                          children: [
                            Text(
                              "\$890",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeColor.primaryApp),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Loan",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: ThemeColor.black),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 25,
                            right: 25,
                          ),
                          decoration: BoxDecoration(
                              color: ThemeColor.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ThemeColor.secundaryApp.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: ThemeColor.secundaryApp,
                                    borderRadius: BorderRadius.circular(15),
                                    // shape: BoxShape.circle
                                  ),
                                  child: const Center(
                                      child: Icon(Icons.arrow_upward_rounded)),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: (size.width - 90) * 0.7,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Sent",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: ThemeColor.secundaryApp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Sending Payment to Clients",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: ThemeColor.black
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                  ),
                                ),
                                const Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$150",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColor.black),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            left: 25,
                            right: 25,
                          ),
                          decoration: BoxDecoration(
                              color: ThemeColor.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ThemeColor.primaryApp.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: ThemeColor.secundaryApp,
                                    borderRadius: BorderRadius.circular(15),
                                    // shape: BoxShape.circle
                                  ),
                                  child: const Center(
                                      child:
                                          Icon(Icons.arrow_downward_rounded)),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: (size.width - 90) * 0.7,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Receive",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: ThemeColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Receiving Payment from company",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: ThemeColor.black
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                  ),
                                ),
                                const Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$250",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColor.black),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            left: 25,
                            right: 25,
                          ),
                          decoration: BoxDecoration(
                              color: ThemeColor.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ThemeColor.secundaryApp.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: ThemeColor.secundaryApp,
                                    borderRadius: BorderRadius.circular(15),
                                    // shape: BoxShape.circle
                                  ),
                                  child: const Center(
                                      child: Icon(CupertinoIcons.money_dollar)),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: (size.width - 90) * 0.7,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Loan",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: ThemeColor.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Loan for the Car",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: ThemeColor.black
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                  ),
                                ),
                                const Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$400",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColor.black),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

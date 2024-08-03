import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insttantt_test/global/borders.dart';
import 'package:insttantt_test/global/custom_text_form.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/tools/gradients.dart';

Widget buildForm({required BuildContext context, required Key key}) {
  var widthOfScreen = MediaQuery.of(context).size.width;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String pattern = r'\w+@\w+\.\w+';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  return SizedBox(
    width: widthOfScreen,
    key: key,
    child: Stack(
      children: <Widget>[
        SizedBox(
          width: widthOfScreen * 0.85,
          child: Card(
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
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: <Widget>[
                  CustomTextFormField(
                    hasPrefixIcon: true,
                    prefixIcon: const Icon(
                      FeatherIcons.user,
                      color: ThemeColor.secundaryApp,
                      size: 20,
                    ),
                    hintText: 'user',
                    contentPadding: const EdgeInsets.only(top: 16),
                    enabledBorder: Borders.noBorder,
                    border: Borders.noBorder,
                    focusedBorder: Borders.noBorder,
                    validator: _validateEmail,
                  ),
                  CustomTextFormField(
                    hasPrefixIcon: true,
                    prefixIcon: const Icon(
                      FeatherIcons.lock,
                      color: ThemeColor.secundaryApp,
                      size: 20,
                    ),
                    hintText: "password",
                    obscured: true,
                    contentPadding: const EdgeInsets.only(top: 16),
                    validator: _validateName,
                  ),
                  // TextFormField(
                  //   controller: _nameController,
                  //   decoration: InputDecoration(
                  //     border: Borders.noBorder,

                  //     labelText: 'Name',
                  //     prefixIcon: const Icon(
                  //       FeatherIcons.lock,
                  //       color: ThemeColor.secundaryApp,
                  //       size: 20,
                  //     ),
                  //   ),
                  //   validator: _validateName,
                  // ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: widthOfScreen * 0.75,
          top: 110,
          child: SizedBox(
            height: 60,
            width: 60,
            child: TextButton(
              onPressed: () {},
              child: Ink(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: Gradients.buttonGradient,
                ),
                child: const Icon(
                  FeatherIcons.arrowRight,
                  size: 30,
                  color: ThemeColor.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

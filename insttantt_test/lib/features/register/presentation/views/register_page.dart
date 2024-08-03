import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape3.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape4.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape5.dart';
import 'package:insttantt_test/features/login/presentation/utils/custom_login_shape6.dart';
import 'package:insttantt_test/global/borders.dart';
import 'package:insttantt_test/global/custom_text_form.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';
import 'package:insttantt_test/global/tools/gradients.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey cardKey = GlobalKey();
  double buttonOffset = 40.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      getSizeOfCard();
    });
  }

  void getSizeOfCard() {
    final keyContext = cardKey.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      setState(() {
        buttonOffset = (box.size.height / 2) - 30;
      });
    }
  }

//  void getSizeOfCard() {
//    final keyContext = key.currentContext;
//    if (keyContext != null) {
//      print("hello");
//      final box = keyContext.findRenderObject() as RenderBox;
//      setState(() {
//        height = (box.size.height / 2) - 30;
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
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
                  decoration: BoxDecoration(color: ThemeColor.primaryApp),
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
                  decoration: BoxDecoration(
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
                  decoration: BoxDecoration(
                    color: ThemeColor.white,
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
                  decoration: BoxDecoration(
                    gradient: Gradients.curvesGradient2,
                  ),
                ),
              ),
            ),
            Positioned(
              top: heightOfScreen * 0.1,
              right: 0,
              child: Container(
                height: 60,
                width: 120,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Algo',
                  ),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            children: <Widget>[
                              Container(
                                height: heightOfScreen * 0.25,
                              ),
                              Text(
                                'Register',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: heightOfScreen * 0.05),
                              _buildForm(context: context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm({required BuildContext context}) {
    var widthOfScreen = MediaQuery.of(context).size.width;

    return Container(
      width: widthOfScreen,
      child: Stack(
        children: <Widget>[
          Container(
            width: widthOfScreen * 0.85,
            child: Card(
              key: cardKey,
              elevation: 4,
              margin: const EdgeInsets.only(
                left: 0,
                top: 8,
                bottom: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(300.0),
                  bottomRight: Radius.circular(300.0),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: <Widget>[
                    CustomTextFormField(
                      hasPrefixIcon: true,
                      prefixIcon: Icon(
                        FeatherIcons.user,
                        color: ThemeColor.primaryAppTransparen,
                        size: 0,
                      ),
                      hintText: 'User Name',
                      contentPadding: EdgeInsets.only(top: 16),
                      enabledBorder: Borders.noBorder,
                      border: Borders.noBorder,
                      focusedBorder: Borders.noBorder,
                    ),
                    Divider(color: ThemeColor.primaryApp, height: 16),
                    CustomTextFormField(
                      hasPrefixIcon: true,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: ThemeColor.secundaryApp,
                        size: 20,
                      ),
                      hintText: 'StringConst.PASSWORD',
                      obscured: true,
                      contentPadding: EdgeInsets.only(top: 16),
                      enabledBorder: Borders.noBorder,
                      border: Borders.noBorder,
                      focusedBorder: Borders.noBorder,
                    ),
                    Divider(color: ThemeColor.primaryApp, height: 16),
                    CustomTextFormField(
                      hasPrefixIcon: true,
                      prefixIcon: Icon(
                        FeatherIcons.mail,
                        color: ThemeColor.secundaryApp,
                        size: 20,
                      ),
                      hintText: 'Email',
                      contentPadding: EdgeInsets.only(top: 16),
                      enabledBorder: Borders.noBorder,
                      border: Borders.noBorder,
                      focusedBorder: Borders.noBorder,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: widthOfScreen * 0.75,
            top: buttonOffset,
            child: Container(
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
                  child: Icon(
                    FeatherIcons.check,
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
}

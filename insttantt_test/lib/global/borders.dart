import 'package:flutter/material.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';

class Borders {
  static const BorderSide defaultPrimaryBorder =
      BorderSide(width: 0, style: BorderStyle.none);

  static const UnderlineInputBorder primaryInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ThemeColor.secundaryApp,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ThemeColor.secundaryApp,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ThemeColor.secundaryApp,
      width: 2,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder disabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ThemeColor.secundaryApp,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const OutlineInputBorder outlineEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: ThemeColor.secundaryApp,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const OutlineInputBorder outlineFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: ThemeColor.secundaryApp,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: ThemeColor.secundaryApp,
      width: 1,
      style: BorderStyle.solid,
    ),
  );

  static const UnderlineInputBorder noBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  );

  static customBorder({
    Color color = ThemeColor.secundaryApp,
    double width = 1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return BorderSide(
      color: color,
      width: width,
      style: style,
    );
  }

  static customOutlineInputBorder({
    double borderRadius = 12,
    Color color = ThemeColor.secundaryApp,
    double width = 1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }

  static customUnderlineInputBorder({
    Color color = ThemeColor.secundaryApp,
    double width = 1,
    BorderStyle style = BorderStyle.solid,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
        style: style,
      ),
    );
  }
}

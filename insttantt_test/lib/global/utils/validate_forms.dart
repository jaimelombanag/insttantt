import 'package:insttantt_test/global/constants/comun_names.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return ComunNamesConst.validateName;
  }
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegex.hasMatch(value)) {
    return 'El nombre no debe contener números ni caracteres especiales';
  }
  if (value.length < 5) {
    return ComunNamesConst.validateName;
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return ComunNamesConst.validateEmail;
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(value)) {
    return ComunNamesConst.validateEmailMsg;
  }
  if (value.length < 7) {
    return ComunNamesConst.validateEmailMsg;
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return ComunNamesConst.validatePassword;
  }
  final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$');
  if (!passwordRegex.hasMatch(value)) {
    return 'Debe incluir una mayúscula, una minúscula, un número y un carácter especial';
  }
  if (value.length < 11) {
    return 'La contraseña debe contener al menos 10 caracteres';
  }
  return null;
}

String? validateNameContact(String? value) {
  if (value == null || value.isEmpty) {
    return ComunNamesConst.validateName;
  }
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegex.hasMatch(value)) {
    return 'El nombre no debe contener números ni caracteres especiales';
  }
  if (value.length < 2) {
    return 'El nombre debe contener mas de 2 caracteres';
  }
  return null;
}

String? validateIdentification(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (!RegExp(r'^\d+$').hasMatch(value)) {
    return 'Please enter only numbers';
  }
  if (value.length < 7) {
    return 'La identificación debe contener mas de 6 caracteres';
  }
  return null;
}

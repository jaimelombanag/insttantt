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

String? validateConfirmPassword(String? value) {
  // if (value == null || value.isEmpty) {
  //   return 'Por favor confirma tu contraseña';
  // }
  // if (value != _passwordController.text) {
  //   return 'Las contraseñas no coinciden';
  // }
  // return null;
}

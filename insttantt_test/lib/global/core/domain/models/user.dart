import 'package:flutter/foundation.dart' show immutable;
import 'package:insttantt_test/global/constants/data_base_name.dart';

const String userTable = 'user';

class UserFields {
  static final List<String> values = [
    id,
    name,
    email,
    password,
  ];

  // Column names for user tables
  static const id = 'id';
  static const name = 'name';
  static const email = 'email';
  static const password = 'password';
}

@immutable
class User {
  final int? id;
  final String name;
  final String email;
  final String? password;

  const User({
    this.id,
    required this.name,
    required this.email,
    this.password,
  });

  User copy({
    int? id,
    String? name,
    String? email,
    String? password,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataBaseNames.name: name,
      DataBaseNames.email: email,
      DataBaseNames.password: password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map[DataBaseNames.name] ?? '',
      email: map[DataBaseNames.email] ?? '',
      password: map[DataBaseNames.password] ?? '',
    );
  }
}

import 'package:flutter/foundation.dart' show immutable;
import 'package:insttantt_test/global/constants/data_base_name.dart';

const String contactTable = 'contact';

class ContactList {
  List<Contact>? data;

  ContactList(this.data);

  ContactList.fromJson(List<dynamic> json) {
    data = json.map((contactJson) => Contact.fromMap(contactJson)).toList();
  }
}

class ContactFields {
  static final List<String> values = [
    id,
    name,
    identification,
  ];

  // Column names for user tables
  static const id = 'id';
  static const name = 'name';
  static const identification = 'identification';
}

@immutable
class Contact {
  final int? id;
  final String name;
  final int identification;

  const Contact({
    this.id,
    required this.name,
    required this.identification,
  });

  Contact copy({
    int? id,
    String? name,
    int? identification,
  }) =>
      Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        identification: identification ?? this.identification,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DataBaseNames.name: name,
      DataBaseNames.identification: identification,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map[DataBaseNames.name] ?? '',
      identification: map[DataBaseNames.identification] ?? 0,
    );
  }
}

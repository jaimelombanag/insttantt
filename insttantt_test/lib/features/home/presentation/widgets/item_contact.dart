import 'package:flutter/material.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';

class ItemContact extends StatelessWidget {
  const ItemContact({
    super.key,
    required this.contacts,
    required this.index,
  });

  final int index;
  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Card(
        child: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contacts[index].name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.black,
                    fontSize: 20),
              ),
              Text(
                '${contacts[index].identification}',
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: ThemeColor.black,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

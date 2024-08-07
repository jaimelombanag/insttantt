import 'package:insttantt_test/features/home/domain/models/contact.dart';

abstract class SaveContactRepository {
  Future<Contact> saveContct(Contact contact);
}

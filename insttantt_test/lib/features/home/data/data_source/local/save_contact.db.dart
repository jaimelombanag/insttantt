import 'package:insttantt_test/features/home/data/data_source/contact_data_base.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';

class SaveContactDB {
  Future<Contact> saveContactDB(Contact contact) async {
    try {
      var contactSave = await ContactDatabase.instance.createContact(contact);
      return contactSave;
    } catch (e) {
      return const Contact(identification: 0, name: '');
    }
  }
}

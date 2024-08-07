import 'package:insttantt_test/features/home/data/data_source/contact_data_base.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';

class GetAllContactDB {
  Future<List<Contact>> getAllContactDB() async {
    try {
      var contactList = await ContactDatabase.instance.readAllContact();
      return contactList;
    } catch (e) {
      return List.empty();
    }
  }
}

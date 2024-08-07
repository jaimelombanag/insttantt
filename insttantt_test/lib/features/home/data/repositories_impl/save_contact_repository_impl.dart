import 'package:insttantt_test/features/home/data/data_source/local/save_contact.db.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';
import 'package:insttantt_test/features/home/domain/repositories/save_contact_repository.dart';

class SaveContactRepositoryImpl implements SaveContactRepository {
  @override
  Future<Contact> saveContct(Contact contact) {
    return SaveContactDB().saveContactDB(contact);
  }
}

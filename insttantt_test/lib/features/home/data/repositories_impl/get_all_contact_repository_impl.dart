import 'package:insttantt_test/features/home/data/data_source/local/get_all_contact.db.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';
import 'package:insttantt_test/features/home/domain/repositories/get_all_contact_repository.dart';

class GetAllContactRepositoryImpl implements GetAllContactRepository {
  @override
  Future<List<Contact>> getAllContct() {
    return GetAllContactDB().getAllContactDB();
  }
}

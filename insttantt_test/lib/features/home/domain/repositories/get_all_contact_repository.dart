import 'package:insttantt_test/features/home/domain/models/contact.dart';

abstract class GetAllContactRepository {
  Future<List<Contact>> getAllContct();
}

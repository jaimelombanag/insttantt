import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseExist {
  Future<bool> existDataBase(String dbName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = join(directory.path, dbName);
      return await File(path).exists();
    } catch (e) {
      return false;
    }
  }
}

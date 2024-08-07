import 'package:flutter_meedu/meedu.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insttantt_test/app/routes/routes.dart';
import 'package:insttantt_test/features/home/domain/models/contact.dart';
import 'package:insttantt_test/features/home/domain/repositories/get_all_contact_repository.dart';
import 'package:insttantt_test/features/home/domain/repositories/save_contact_repository.dart';
import 'package:insttantt_test/features/home/domain/repositories/session_close_repository.dart';
import 'package:insttantt_test/global/themes/app_themes_colors.dart';

class HomeController extends SimpleNotifier {
  final _getAllContact = Get.i.find<GetAllContactRepository>();
  final _addContact = Get.i.find<SaveContactRepository>();
  final _sessionClose = Get.i.find<SessionCloseRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  List<Contact>? _contacts;
  List<Contact>? get contacts => _contacts;

  HomeController() {
    _getContacts();
  }

  void _getContacts() async {
    _contacts = await _getAllContact.getAllContct();
    notify();
  }

  void addContacts(Contact contac) async {
    var contactSave = await _addContact.saveContct(contac);
    if (contactSave.name.isEmpty) {
      Fluttertoast.showToast(
          msg: "¡No fue posible guardar el contacto!",
          toastLength: Toast.LENGTH_SHORT, // O Toast.LENGTH_LONG
          gravity:
              ToastGravity.BOTTOM, // O ToastGravity.CENTER, ToastGravity.TOP
          timeInSecForIosWeb: 1, // Duración en segundos para iOS/Web
          backgroundColor: ThemeColor.black,
          textColor: ThemeColor.white,
          fontSize: 16.0);
    } else {
      _getContacts();
    }
    notify();
  }

  void sessionClose() async {
    var close = await _sessionClose.sessionCloseContct();
    if (close == 1) {
      _routeName = Routes.LOGIN;
      notify();
    } else {
      Fluttertoast.showToast(
          msg: "¡No fue posible cerrar sesión.!",
          toastLength: Toast.LENGTH_SHORT, // O Toast.LENGTH_LONG
          gravity:
              ToastGravity.BOTTOM, // O ToastGravity.CENTER, ToastGravity.TOP
          timeInSecForIosWeb: 1, // Duración en segundos para iOS/Web
          backgroundColor: ThemeColor.black,
          textColor: ThemeColor.white,
          fontSize: 16.0);
    }
  }
}

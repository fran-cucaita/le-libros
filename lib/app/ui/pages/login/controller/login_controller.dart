import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  String _email = "";
  String _password = "";
  final GlobalKey<FormState> formKey = GlobalKey();

  void onEmailChange(String text) {
    _email = text;

    void onPasswordChange(String text) {
      _password = text;
    }
  }
}

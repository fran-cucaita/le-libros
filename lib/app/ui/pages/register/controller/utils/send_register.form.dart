import 'package:flutter/material.dart';
import 'package:le_libros/app/domain/inputs/sign_up.dart';
import 'package:le_libros/app/ui/pages/register/register_page.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:le_libros/app/ui/routes/routes.dart';
import 'package:le_libros/widgets/dialogs/dialogs.dart';
import 'package:le_libros/widgets/dialogs/progress_dialog.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "email already in use";
          break;
        case SignUpError.weakPassword:
          content = "weak password";
          break;
        case SignUpError.unknow:
        default:
          content = "unknow";
          break;
      }
      Dialogs.alert(context, title: "ERROR", content: content);
    } else {
      router.pushNamedAndRemoveUntil(Routes.Home);
    }
  } else {
    Dialogs.alert(
      context,
      title: "Error",
      content: "Invalid fields",
    );
  }
}

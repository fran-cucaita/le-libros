import 'package:flutter/material.dart';
import 'package:le_libros/app/ui/pages/register/register_page.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:le_libros/app/ui/routes/routes.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    final response = await controller.submit();
    if (response.error != null) {
    } else {
      router.pushNamedAndRemoveUntil(Routes.Home);
    }
  } else {}
}

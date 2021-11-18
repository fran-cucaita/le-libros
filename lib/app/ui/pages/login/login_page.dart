import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:le_libros/app/ui/routes/routes.dart';
import 'package:le_libros/app/utils/email_validator.dart';
import 'package:le_libros/widgets/input_textfiel.dart';
import 'package:flutter_meedu/meedu.dart';

import 'controller/login_controller.dart';

final LoginProvider = SimpleProvider(
  (_) => LoginController(),
);

class LoginPage extends StatelessWidget {
  static const String ROUTE = '/login';
  LoginPage({Key? key}) : super(key: key);

  final _controller = LoginProvider.read;

  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
        provider: LoginProvider,
        builder: (_, controller) {
          return Scaffold(
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InputTextField(
                          label: "Email",
                          onChanged: controller.onEmailChange,
                          inputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (isValidEmail(text!)) {
                              return null;
                            }
                            return "invalid email";
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InputTextField(
                          label: "Password",
                          onChanged: controller.onPasswordChange,
                          isPassword: true,
                          validator: (text) {
                            if (text!.trim().length >= 6) {
                              return null;
                            }
                            return 'invalid password';
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () => router.pushNamed(Routes.Register),
                          child: Text('Sign Up'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.formKey.currentState!.validate();
                          },
                          child: Text('Sign In'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/ui/pages/register/controller/register_controller.dart';
import 'package:le_libros/app/ui/pages/register/controller/register_state.dart';
import 'package:le_libros/app/ui/pages/register/controller/utils/send_register.form.dart';
import 'package:le_libros/app/utils/email_validator.dart';
import 'package:le_libros/app/utils/name_validation.dart';
import 'package:le_libros/widgets/input_textfiel.dart';

import 'package:flutter_meedu/meedu.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
            appBar: AppBar(),
            body: Center(
                child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputTextField(
                        label: "Name",
                        onChanged: controller.OnNameChanged,
                        validator: (text) {
                          if (text == null) return null;
                          return isValidName(text) ? null : "Invalid name ";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextField(
                        label: "Last Name",
                        onChanged: controller.OnLastNameChanged,
                        validator: (text) {
                          if (text == null) return null;
                          return isValidName(text) ? null : "Invalid last name";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextField(
                        label: "Email",
                        inputType: TextInputType.emailAddress,
                        onChanged: controller.OnEmailChanged,
                        validator: (text) {
                          if (text == null) return null;
                          return isValidEmail(text) ? null : "Invalid email";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextField(
                        label: "Password",
                        onChanged: controller.OnPasswordChanged,
                        isPassword: true,
                        validator: (text) {
                          if (text == null) return null;
                          if (text.trim().length >= 6) {
                            return null;
                          }
                          return "invalid password";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer(builder: (_, watch, __) {
                        // revisar el watch para mirar cuando cambia password
                        //watch(registerProvider.select((state) => state.password),);
                        return InputTextField(
                            label: "Verify Password",
                            onChanged: controller.OnVPasswordChanged,
                            isPassword: true,
                            validator: (text) {
                              if (text == null) return null;
                              if (controller.state.password != text) {
                                return "la contraseña no conicide";
                              }
                              if (text.trim().length >= 6) {
                                return null;
                              }
                              return "invalid password";
                            });
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () => sendRegisterForm(context),
                        child: Text("register"),
                      ),
                    ],
                  ),
                ),
              ),
            )));
      },
    );
  }
}

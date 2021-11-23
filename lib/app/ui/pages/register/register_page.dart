import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/do_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_email_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_lastname_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_name_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_password_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_v_password_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/register_bloc.dart';
import 'package:le_libros/app/ui/pages/register/bloc/states/register_state.dart';
import 'package:le_libros/app/utils/email_validator.dart';
import 'package:le_libros/app/utils/name_validation.dart';
import 'package:le_libros/widgets/input_textfiel.dart';

final GlobalKey<FormState> formKey = GlobalKey();

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          padding: EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputTextField(
                    label: "Name",
                    onChanged: (name) =>
                        BlocProvider.of<RegisterBloc>(context)
                            .add(OnNameChangeRegisterEvent(name)),
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
                    onChanged: (lastname) =>
                        BlocProvider.of<RegisterBloc>(context)
                            .add(OnLastNameChangeRegisterEvent(lastname)),
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
                    onChanged: (email) =>
                        BlocProvider.of<RegisterBloc>(context)
                            .add(OnEmailChangeRegisterEvent(email)),
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
                    onChanged: (password) =>
                        BlocProvider.of<RegisterBloc>(context)
                            .add(OnPasswordChangeRegisterEvent(password)),
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
                  BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (_, state) {
                    // revisar el watch para mirar cuando cambia password
                    //watch(registerProvider.select((state) => state.password),);
                    return InputTextField(
                        label: "Verify Password",
                        onChanged: (vPassword) =>
                            BlocProvider.of<RegisterBloc>(context)
                                .add(OnVPasswordChangeRegisterEvent(vPassword)),
                        isPassword: true,
                        validator: (text) {
                          if (text == null) return null;
                          if (state.password != text) {
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
                    onPressed: () => BlocProvider.of<RegisterBloc>(context)
                        .add(DoRegisterEvent(context)),
                    child: Text("register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

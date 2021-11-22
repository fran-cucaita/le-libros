import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/do_register_event.dart';
import 'package:le_libros/app/ui/pages/register/controller/register_controller.dart';
import 'package:le_libros/app/ui/pages/register/controller/register_state.dart';
import 'package:le_libros/app/ui/pages/register/controller/utils/send_register.form.dart';
import 'package:le_libros/app/utils/email_validator.dart';
import 'package:le_libros/app/utils/name_validation.dart';
import 'package:le_libros/widgets/input_textfiel.dart';

import 'package:flutter_meedu/meedu.dart';

import 'bloc/register_bloc.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);
//final bloc =RegisterBloc(..add(DoRegisterEvent()));

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //aca va el Bloc
    // return BlocListener<RegisterBloc,RegisterState>(
    //   bloc: bloc,
    //   listener: (_,state));
return MultiBlocProvider(
      providers: [
        BlocProvider(create: (state) {
          return Get.i.find<RegisterBloc>()..add(DoRegisterEvent());
        })
      ],
      child:   
    // return ProviderListener<RegisterController>(
    //   provider: registerProvider,
    //   builder: (_, state) {
    //     return 
        Scaffold(
            appBar: AppBar(),
            body: Container(
                child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Form(
                  key: state.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InputTextField(
                          label: "Name",
                          onChanged: state.OnNameChanged,
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
                          onChanged: state.OnLastNameChanged,
                          validator: (text) {
                            if (text == null) return null;
                            return isValidName(text)
                                ? null
                                : "Invalid last name";
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          label: "Email",
                          inputType: TextInputType.emailAddress,
                          onChanged: state.OnEmailChanged,
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
                          onChanged: state.OnPasswordChanged,
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
                              onChanged: state.OnVPasswordChanged,
                              isPassword: true,
                              validator: (text) {
                                if (text == null) return null;
                                if (state.state.password != text) {
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
              ),
            )));
      },
    );
  }
}

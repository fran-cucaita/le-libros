import 'package:flutter/material.dart';
import 'package:le_libros/widgets/input_textfiel.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                InputTextField(
                  label: "Name",
                  onChanged: (text) {},
                ),
                SizedBox(
                  height: 20,
                ),
                InputTextField(
                  label: "Last Name",
                  onChanged: (text) {},
                ),
                SizedBox(
                  height: 20,
                ),
                InputTextField(
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                  onChanged: (text) {},
                  validator: (text) {
                    print('text $text');
                    if (text == null) return null;
                    if (text.contains("@")) {
                      return null;
                    }
                    return "Invalid email";
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InputTextField(
                  label: "Password",
                  onChanged: (text) {},
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                InputTextField(
                  label: "Verify Password",
                  onChanged: (text) {},
                  isPassword: true,
                ),
              ],
            ),
          ),
        )));
  }
}

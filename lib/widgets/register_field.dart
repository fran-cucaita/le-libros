import 'package:flutter/material.dart';

class RegisterField extends StatelessWidget {
  final String text;

  const RegisterField({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
      ),
      onChanged: (text) {},
    );
  }
}

import 'package:flutter/material.dart';

class ButtonCategory extends StatelessWidget {
  final String title;
  final String image;

  const ButtonCategory({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Image.network(
          image,
          width: 30,
          height: 30,
        ),
        label: Text(title,
            style: TextStyle(
              color: Colors.black,
            )),
        onPressed: () {
          // Respond to button press
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white60,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ));
  }
}

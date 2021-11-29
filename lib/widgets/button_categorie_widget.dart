import 'package:flutter/material.dart';
import 'package:le_libros/app/ui/pages/categories/category_page.dart';

class ButtonCategory extends StatelessWidget {
  final String title;
  final String image;
  final String code;

  const ButtonCategory({
    Key? key,
    required this.title,
    required this.image,
    required this.code,
  }) : super(key: key);

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
          Navigator.pushNamed(context, CategoryPage.ROUTE + '/' + code);
          // Respond to button press
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white60,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ));
  }
}

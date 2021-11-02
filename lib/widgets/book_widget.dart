import 'package:flutter/material.dart';
import 'package:le_libros/pages/desc.dart';

class BookWidget extends StatelessWidget {
  final String icon;
  final String name;

  const BookWidget({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Image.network(icon),
          iconSize: 150,
          onPressed: () {
            Navigator.pushNamed(context, Desc.ROUTE);
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }
}

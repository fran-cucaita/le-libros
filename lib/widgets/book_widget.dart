import 'package:flutter/material.dart';
import 'package:le_libros/app/ui/pages/desc.dart';

class BookWidget extends StatelessWidget {
  final String icon;
  final String name;
  final String code;

  const BookWidget({
    Key? key,
    required this.icon,
    required this.name,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Image.network(icon),
          iconSize: 150,
          onPressed: () {
            Navigator.pushNamed(context, Desc.ROUTE + '/' + code);
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

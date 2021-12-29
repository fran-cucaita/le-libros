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
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey[600]),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, CategoryPage.ROUTE + '/' + code);
        print(code);
      },
      child: Row(
        children: [
          Image.network(
            image,
            scale: 2,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            title,
            overflow: TextOverflow.visible,
            maxLines: 1,
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}

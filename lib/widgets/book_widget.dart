import 'package:flutter/material.dart';
import 'package:le_libros/app/ui/pages/details/details_page.dart';

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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.ROUTE + '/' + code);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              icon,
              height: MediaQuery.of(context).size.height * .2,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 130,
            child: Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}

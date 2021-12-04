import 'package:flutter/material.dart';

class BookDetailWidget extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String description;
  final String epubLink;
  final String mobiLink;

  const BookDetailWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.epubLink,
    required this.mobiLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * .7,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      image,
                      scale: 2.3,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    width: MediaQuery.of(context).size.width * .9,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      "by $author",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Language',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'SPA',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Whats it about?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1.4,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[600]),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        topLeft: Radius.circular(18)),
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.book),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  Text("Read Book"),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[600]),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(18),
                        topRight: Radius.circular(18)),
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.audiotrack_rounded),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  Text("Play Book"),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:le_libros/pages/desc.dart';

class Home extends StatelessWidget {
  static const String ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              width: 1000,
              height: 90,
              child: TextField(
                style: TextStyle(),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.find_in_page, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: 'Title, authors, or topics'),
                onChanged: (value) {},
              ),
            ),
            Container(
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Motivation1"),
                    style: ButtonStyle(),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation2")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation3")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation1")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation2")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation3")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation3")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation1")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation2")),
                  ElevatedButton(onPressed: () {}, child: Text("Motivation3")),
                ],
              ),
            ),
            Container(
              width: 1000,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Books",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Image.asset("assets/images/libro1.jpg"),
                              iconSize: 150,
                              onPressed: () {
                                Navigator.pushNamed(context, Desc.ROUTE);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "El nombre 1",
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
                        Column(
                          children: [
                            IconButton(
                              icon: Image.asset("assets/images/libro2.jpg"),
                              iconSize: 150,
                              onPressed: () {
                                Navigator.pushNamed(context, Desc.ROUTE);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "El nombre 2",
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
                        Column(
                          children: [
                            IconButton(
                              icon: Image.asset("assets/images/libro3.jpg"),
                              iconSize: 150,
                              onPressed: () {
                                Navigator.pushNamed(context, Desc.ROUTE);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "El nombre 3",
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

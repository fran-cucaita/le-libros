import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Trending Books",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.yellow,
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
              Text(
                "See All",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.pink,
                ),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/libro1.jpg",
                    width: 100,
                  ),
                  Text(
                    "tercer Texto",
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/libro2.jpg",
                      width: 100,
                    ),
                    Text(
                      "tercer Texto",
                      style: const TextStyle(
                        backgroundColor: Colors.black,
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                    Text(
                      "tercer Texto",
                      style: const TextStyle(
                        backgroundColor: Colors.black,
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}

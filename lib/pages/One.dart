import 'package:flutter/material.dart';

class One extends StatelessWidget {
  static final String ROUTE = "/one";

  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One"),
      ),
      body: Text(
        "primera pagina",
        style: TextStyle(fontSize: 30, color: Colors.red),
      ),
    );
  }
}

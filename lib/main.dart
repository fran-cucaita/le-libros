import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:le_libros/category_bloc.dart';
import 'package:le_libros/events/category_event.dart';
import 'package:le_libros/helpers/http_helper.dart';
import 'package:le_libros/pages/desc.dart';
import 'package:le_libros/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void myrequest() async {
    final res = await http.get(Uri.parse(HttpHelper.url));
    //'https://i6zfxk6hzb.execute-api.us-west-2.amazonaws.com/dev/books/recent-published'));
    //print(res.statusCode);

    final jsonData = json.decode(res.body);
    //print(jsonData);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    myrequest();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryBloc()..add(const LoadCategoryEvent()))
      ],
      child: MaterialApp(
        title: 'Le_libros',
        initialRoute: Home.ROUTE,
        routes: {
          Home.ROUTE: (_) => Home(),
          Desc.ROUTE: (_) => Desc(),
        },
      ),
    );
  }
}

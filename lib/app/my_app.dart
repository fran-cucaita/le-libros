import 'package:flutter/material.dart';
import 'package:le_libros/app/ui/routes/app_routes.dart';
import 'package:le_libros/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le_libros',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.Home,
      navigatorObservers: [
        router.observer,
      ],
      onGenerateRoute: onGenerateRoute,
    );
  }
}

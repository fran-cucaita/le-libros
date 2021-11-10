import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:le_libros/app/ui/pages/home.dart';
import 'package:le_libros/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.Home: (_) => Home(),
    };

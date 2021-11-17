import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:le_libros/app/ui/pages/home/home.dart';
import 'package:le_libros/app/ui/pages/login/login.dart';
import 'package:le_libros/app/ui/pages/register/register_page.dart';
import 'package:le_libros/app/ui/pages/splash/splash_page.dart';
import 'package:le_libros/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.Splash: (_) => SplashPage(),
      Routes.LogIn: (_) => const LoginPage(),
      Routes.Register: (_) => RegisterPage(),
      Routes.Home: (_) => Home(),
    };

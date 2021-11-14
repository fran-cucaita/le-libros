import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/ui/pages/splash/splash_controller.dart';
import 'package:flutter_meedu/router.dart' as router;

final splashProvider = SimpleProvider((_) => SplashController());

class SplashPage extends StatelessWidget {
  static const String ROUTE = '/splash';

  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
        provider: splashProvider,
        onChange: (_, controller) {
          final routeName = controller.routeName;
          if (routeName != null) {
            router.pushReplacementNamed(routeName);
          }
        },
        builder: (_, __) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}

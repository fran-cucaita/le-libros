import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/ui/pages/splash/splash_controller.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:le_libros/app/ui/routes/routes.dart';

final splashProvider = SimpleProvider((_) => SplashController());

class LoginPage extends StatelessWidget {
  static const String ROUTE = '/login';

  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
        provider: splashProvider,
        builder: (_, __) {
          return Scaffold(
            body: Center(
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => router.pushNamed(Routes.Register),
                        child: Text('Sign Up'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

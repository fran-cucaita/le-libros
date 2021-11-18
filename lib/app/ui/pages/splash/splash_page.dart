import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:le_libros/app/ui/pages/splash/bloc/events/load_splash_event.dart';
import 'package:le_libros/app/ui/pages/splash/bloc/splash_bloc.dart';
import 'package:le_libros/app/ui/pages/splash/bloc/states/splash_state.dart';
import 'package:le_libros/app/ui/pages/splash/splash_controller.dart';

final splashProvider = SimpleProvider((_) => SplashController());
final bloc = SplashBloc()..add(LoadSplashEvent());

class SplashPage extends StatelessWidget {
  static const String ROUTE = '/splash';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: bloc,
      listener: (_, state) {
        print('Aca estoy escuchando y el state tiene la ruta ${state.route}');
        // si el state no es nulo entonces pusheo la
        final routeName = state.route;
        if (routeName != null) {
          router.pushReplacementNamed(routeName);
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      ),
    );

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

import 'package:bloc/bloc.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:le_libros/app/domain/repositories/authentication_repository.dart';
import 'package:le_libros/app/ui/pages/splash/bloc/events/load_splash_event.dart';
import 'package:le_libros/app/ui/pages/splash/bloc/events/splash_event.dart';
import 'package:le_libros/app/ui/pages/splash/bloc/states/splash_state.dart';
import 'package:le_libros/app/ui/routes/routes.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<LoadSplashEvent>((event, emit) async {
      final isAuth = Get.i.find<AuthenticationRepository>();
      final user = await isAuth.user;
      if (user != null) {
        emit(const SplashState(route: Routes.Home));
      } else {
        emit(const SplashState(route: Routes.LogIn));
      }
    });
  }
}

import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/domain/repositories/authentication_repository.dart';
import 'package:le_libros/app/ui/routes/routes.dart';

class HomeController extends SimpleNotifier {
  final _authRepository = Get.i.find<AuthenticationRepository>();
  String? _routeName;
  String? get routeName => _routeName;

  HomeController() {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    _routeName = user != null ? Routes.Home : Routes.LogIn;
    notify();
  }
}

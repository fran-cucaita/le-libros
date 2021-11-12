import 'package:flutter_meedu/meedu.dart';

import 'package:le_libros/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:le_libros/app/domain/repositories/authentication_repository.dart';

void InjectDependencies() {
  Get.i.lazyyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(Fireba seAuth.instance),
  );
}

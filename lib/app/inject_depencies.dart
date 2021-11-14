import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

import 'package:le_libros/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:le_libros/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:le_libros/app/domain/repositories/authentication_repository.dart';
import 'package:le_libros/app/domain/repositories/signup_repository.dart';

void injectDependencies() {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );
}

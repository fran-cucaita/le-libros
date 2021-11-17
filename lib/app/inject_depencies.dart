import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

import 'package:le_libros/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:le_libros/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:le_libros/app/domain/repositories/authentication_repository.dart';
import 'package:le_libros/app/domain/repositories/signup_repository.dart';
import 'package:le_libros/category_bloc.dart';
import 'package:le_libros/helpers/http_helper.dart';

void injectDependencies() {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<HttpHelper>(() {
    return HttpHelper();
  });

  Get.i.lazyPut<CategoryBloc>(() {
    return CategoryBloc(Get.i.find<HttpHelper>());
  });
}

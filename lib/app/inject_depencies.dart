import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

import 'package:le_libros/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:le_libros/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:le_libros/app/domain/repositories/authentication_repository.dart';
import 'package:le_libros/app/domain/repositories/signup_repository.dart';
import 'package:le_libros/app/trending_books/trending_bloc.dart';
import 'package:le_libros/app/ui/pages/details/bloc/detail_bloc.dart';
import 'package:le_libros/app/ui/pages/register/bloc/register_bloc.dart';
import 'package:le_libros/categories/category_bloc.dart';
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
  Get.i.lazyPut<TrendingBloc>(() {
    return TrendingBloc(Get.i.find<HttpHelper>());
  });

  Get.i.lazyPut<RegisterBloc>(() => RegisterBloc());

  Get.i.factoryPut<DetailBloc, void>((_) {
    return DetailBloc(Get.i.find<HttpHelper>());
  });
}

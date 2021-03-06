import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/trending_books/events/trending_event.dart';
import 'package:le_libros/app/trending_books/trending_bloc.dart';
import 'package:le_libros/app/trending_books/trending_page.dart';
import 'package:le_libros/app/ui/pages/categories/bloc/category_book_bloc.dart';
import 'package:le_libros/app/ui/pages/categories/bloc/category_books_events.dart';
import 'package:le_libros/app/ui/pages/categories/category_page.dart';
import 'package:le_libros/app/ui/pages/details/bloc/detail_bloc.dart';
import 'package:le_libros/app/ui/pages/details/bloc/events/detail_event.dart';
import 'package:le_libros/app/ui/pages/details/details_page.dart';
import 'package:le_libros/app/ui/pages/home/home.dart';
import 'package:le_libros/app/ui/pages/login/login_page.dart';
import 'package:le_libros/app/ui/pages/register/bloc/register_bloc.dart';
import 'package:le_libros/app/ui/pages/register/register_page.dart';
import 'package:le_libros/app/ui/pages/splash/bloc/events/load_splash_event.dart';
import 'package:le_libros/app/ui/pages/splash/bloc/splash_bloc.dart';
import 'package:le_libros/app/ui/pages/splash/splash_page.dart';
import 'package:le_libros/app/ui/routes/routes.dart';
import 'package:le_libros/categories/category_bloc.dart';
import 'package:le_libros/categories/events/category_event.dart';

PageRoute onGenerateRoute(RouteSettings settings) {
  // Handle '/home'
  final name = settings.name;
  if (name == null) {
    throw StateError("Esto no puede null");
  }

  if (name == Routes.Home) {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider(
                  create: (_) => Get.i.find<CategoryBloc>()
                    ..add(const LoadCategoryEvent())),
              BlocProvider(
                  create: (_) => Get.i.find<TrendingBloc>()
                    ..add(const LoadTrendingEvent())),
            ], child: Home()));
  }

  var uri = Uri.parse(name);
  var pathSegments = uri.pathSegments;
  var firstSegment = "/" + pathSegments.first;

  if (firstSegment == Routes.Splash) {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider(create: (_) => SplashBloc()..add(LoadSplashEvent()))
            ], child: SplashPage()));
  } else if (firstSegment == Routes.LogIn) {
    return MaterialPageRoute(builder: (_) => LoginPage());
  } else if (firstSegment == Routes.Register) {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => Get.i.find<RegisterBloc>())
              ],
              child: RegisterPage(),
            ));
  } else if (firstSegment == Routes.Desc) {
    print(pathSegments);
    if (pathSegments.length < 2) {
      throw StateError(
          "los segmentos deberian tener al menos el nombre del libro");
    }
    final bookCode = pathSegments[1];

    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider(
                  create: (_) => Get.i.factoryFind<DetailBloc, void>()
                    ..add(LoadDetailsEvent(bookCode)))
            ], child: DetailPage()));
  } else if (firstSegment == Routes.Category) {
    print(pathSegments);
    if (pathSegments.length < 2) {
      throw StateError(
          "los segmentos deberian tener al menos el nombre de la categoria");
    }
    final categoryCode = pathSegments[1];

    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider(
                  create: (_) => Get.i.factoryFind<CategoryBookBloc, void>()
                    ..add(LoadCategoryBookEvent(categoryCode)))
            ], child: CategoryPage()));
  } else if (firstSegment == Routes.Trend) {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
              BlocProvider(
                  create: (_) => Get.i.find<TrendingBloc>()
                    ..add(const LoadTrendingEvent())),
            ], child: TrendiesPage()));
  }

  throw StateError("No encontre donde mandarte");
}

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:le_libros/events/category_event.dart';
import 'package:le_libros/helpers/http_helper.dart';
import 'package:le_libros/models/categories.dart';
import 'package:le_libros/states/categories_state.dart';
import 'package:http/http.dart' as http;

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const LoadingCategoryState()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());

      final urlCategory = await http.get(Uri.parse(HttpHelper.urlCategories));
      final strbody = urlCategory.body;
      final body = json.decode(strbody);
      final categories =
          (body as List).map((e) => Category.fromJson(e)).toList();
      if (categories.length > 0) {
        print('esta conectado');
        emit(LoadCategoryState(categories));
      } else {
        emit(const ErrorCategoryState());
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:le_libros/categories/states/categories_state.dart';
import 'package:le_libros/helpers/http_helper.dart';

import 'events/category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final HttpHelper httpHelper;
  CategoryBloc(this.httpHelper) : super(const LoadingCategoryState()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());

      final categories = await httpHelper.getCategories();
      emit(LoadCategoryState(categories));
    });
  }
}

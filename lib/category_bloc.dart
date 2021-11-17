import 'package:bloc/bloc.dart';
import 'package:le_libros/events/category_event.dart';
import 'package:le_libros/helpers/http_helper.dart';
import 'package:le_libros/states/categories_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final HttpHelper httpHelper;
  CategoryBloc(this.httpHelper) : super(const LoadingCategoryState()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());

      final categories = await httpHelper.getCategory();
      emit(LoadCategoryState(categories));
    });
  }
}

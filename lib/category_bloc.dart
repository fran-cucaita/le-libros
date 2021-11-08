
import 'package:bloc/bloc.dart';
import 'package:le_libros/events/category_event.dart';
import 'package:le_libros/helpers/http_helper.dart';
import 'package:le_libros/states/categories_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const LoadingCategoryState()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(const LoadingCategoryState());
      final httpHelper = HttpHelper();
      final categories = await httpHelper.getCategory();
      emit(LoadCategoryState(categories));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:le_libros/app/ui/pages/categories/bloc/category_books_states.dart';
import 'package:le_libros/helpers/http_helper.dart';

import 'category_books_events.dart';

class CategoryBookBloc extends Bloc<CategoryBookEvent, CategoryBookState> {
  final HttpHelper httpHelper;
  CategoryBookBloc(this.httpHelper) : super(LoadingCategoryBookState()) {
    on<LoadCategoryBookEvent>((event, emit) async {
      emit(const LoadingCategoryBookState());
      try {
        final categoryBooks =
            await httpHelper.getBookListByCategory(event.code);
        emit(LoadedCategoryBookState(categoryBooks: categoryBooks));
      } catch (err) {
        print(err);
        emit(const ErrorCategoryBookState());
      }
    });
  }
}

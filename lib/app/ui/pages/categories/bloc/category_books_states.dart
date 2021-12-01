import 'package:le_libros/app/domain/models/response.dart';

abstract class CategoryBookState {
  const CategoryBookState();
}

class LoadingCategoryBookState extends CategoryBookState {
  const LoadingCategoryBookState();
}

class ErrorCategoryBookState extends CategoryBookState {
  const ErrorCategoryBookState();
}

class LoadedCategoryBookState extends CategoryBookState {
  final Response categoryBooks;
  LoadedCategoryBookState({required this.categoryBooks});
}

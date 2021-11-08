import 'package:le_libros/models/categories.dart';

abstract class CategoryState {
  const CategoryState();
}

class LoadingCategoryState extends CategoryState {
  const LoadingCategoryState();
}

class ErrorCategoryState extends CategoryState {
  const ErrorCategoryState();
}

class LoadCategoryState extends CategoryState {
  final List<Category> categories;

  LoadCategoryState(this.categories);
}

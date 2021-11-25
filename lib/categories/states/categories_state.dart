import 'package:le_libros/app/domain/models/category.dart';

abstract class CategoryState {
  const CategoryState();
}

class LoadingCategoryState extends CategoryState {
  const LoadingCategoryState();
}

class ErrorCategoryState extends CategoryState {
  const ErrorCategoryState();
}

class LoadedCategoryState extends CategoryState {
  final List<Category> categories;

  LoadedCategoryState(this.categories);
}

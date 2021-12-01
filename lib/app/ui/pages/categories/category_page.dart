import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_book_bloc.dart';
import 'bloc/category_books_states.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  static const String ROUTE = '/category';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBookBloc, CategoryBookState>(builder: (
      context,
      state,
    ) {
      if (state is LoadingCategoryBookState) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is ErrorCategoryBookState) {
        return Text('Ups! Hubo un error');
      } else if (state is LoadedCategoryBookState) {
        final categoryBooks = state.categoryBooks;
        final books = categoryBooks.records;
        return Scaffold(
          body: Center(
            child: Text('hola esta es la page de categorias'),
          ),
        );
      }
      throw StateError('hubo un error');
    });
  }
}

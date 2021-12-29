import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_libros/widgets/book_widget.dart';

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
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'titulo de la categoria',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                itemCount: books.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BookWidget(
                    icon: books[index].image,
                    name: books[index].title,
                    code: books[index].code,
                  );
                }),
          ),
        );
      }
      throw StateError('hubo un error');
    });
  }
}

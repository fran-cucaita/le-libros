import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_libros/app/domain/models/book.dart';
import 'package:le_libros/app/trending_books/states/trending_state.dart';
import 'package:le_libros/app/trending_books/trending_bloc.dart';
import 'package:le_libros/widgets/book_widget.dart';

class TrendiesPage extends StatelessWidget {
  const TrendiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(builder: (
      context,
      state,
    ) {
      if (state is LoadingTrendingState) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is ErrorTrendingState) {
        return Text('Ups! Hubo un error');
      } else if (state is LoadedTrendingState) {
        final trendies = state.trendies;
        final books = trendies.records;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Trending Books',
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return BookWidget(
                      icon: books[index].image,
                      name: books[index].title,
                      code: books[index].code);
                }),
          ),
        );
      }
      throw StateError('hubo un error');
    });
  }
}

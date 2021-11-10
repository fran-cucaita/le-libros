import 'package:flutter/material.dart';
import 'package:le_libros/category_bloc.dart';
import 'package:le_libros/events/category_event.dart';
import 'package:le_libros/helpers/http_helper.dart';
import 'package:le_libros/models/categories.dart';
import 'package:le_libros/models/response.dart';
import 'package:le_libros/states/categories_state.dart';
import 'package:le_libros/widgets/book_widget.dart';
import 'package:le_libros/widgets/button_categorie_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  static const String ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              width: 1000,
              height: 90,
              child: TextField(
                style: TextStyle(),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.find_in_page, color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: 'Title, authors, or topics'),
                onChanged: (value) {},
              ),
            ),
            Container(
              width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              if (state is LoadingCategoryState) {
                return const CircularProgressIndicator();
              } else if (state is ErrorCategoryState) {
                return Text('Ups! Hubo un error');
              } else if (state is LoadCategoryState) {
                final categories = state.categories;
                return SizedBox(
                  height: 200,
                  child: GridView.builder(
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ButtonCategory(
                        title: categories[index].title,
                        image: categories[index].image,
                      );
                    },
                  ),
                );
              }
              throw StateError('hubo un error');
            }),
            Container(
              width: 1000,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Books",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
            ),
            FutureBuilder<Response>(
                future: HttpHelper().getRecentPublished(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  final response = snapshot.data!;
                  final books = response.records;
                  return SizedBox(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(4),
                          itemCount: books.length,
                          itemBuilder: (BuildContext context, int book) {
                            return BookWidget(
                                icon: books[book].image,
                                name: books[book].title);
                          }));
                }),
          ],
        ),
      )),
    );
  }
}

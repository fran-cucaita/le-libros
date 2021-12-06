import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/domain/repositories/authentication_repository.dart';
import 'package:le_libros/app/trending_books/states/trending_state.dart';
import 'package:le_libros/app/trending_books/trending_bloc.dart';
import 'package:le_libros/app/ui/routes/routes.dart';
import 'package:le_libros/categories/category_bloc.dart';
import 'package:le_libros/categories/states/categories_state.dart';
import 'package:le_libros/widgets/book_widget.dart';
import 'package:le_libros/widgets/button_categorie_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

class Home extends StatelessWidget {
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
            BlocBuilder<CategoryBloc, CategoryState>(builder: (
              context,
              state,
            ) {
              if (state is LoadingCategoryState) {
                return const CircularProgressIndicator();
              } else if (state is ErrorCategoryState) {
                return Text('Ups! Hubo un error');
              } else if (state is LoadedCategoryState) {
                final categories = state.categories;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .23,
                  child: GridView.builder(
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.25,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ButtonCategory(
                        title: categories[index].title,
                        image: categories[index].image,
                        code: categories[index].code,
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
                      const Text(
                        "Trending Books",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.Trend);
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            BlocBuilder<TrendingBloc, TrendingState>(builder: (
              context,
              state,
            ) {
              if (state is LoadingTrendingState) {
                return const CircularProgressIndicator();
              } else if (state is ErrorTrendingState) {
                return Text('Ups! Hubo un error');
              } else if (state is LoadedTrendingState) {
                final trendies = state.trendies;
                final books = trendies.records;
                return Container(
                  height: MediaQuery.of(context).size.height * .3,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return BookWidget(
                        name: books[index].title,
                        icon: books[index].image,
                        code: books[index].code,
                      );
                    },
                  ),
                );
              }
              throw StateError('hubo un error');
            }),
          ],
        ),
      )),
    );
  }
}
            // Container(
            //   padding: EdgeInsets.all(10),
            //   color: Colors.white,
            //   width: 1000,
            //   height: 90,
            //   child: TextField(
            //     style: TextStyle(),
            //     decoration: const InputDecoration(
            //         prefixIcon: Icon(Icons.find_in_page, color: Colors.black),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(15))),
            //         hintText: 'Title, authors, or topics'),
            //     onChanged: (value) {},
            //   ),
            // ),

            // ElevatedButton(
            //   onPressed: () async {
            //     await Get.i.find<AuthenticationRepository>().SignOut();
            //     router.pushNamedAndRemoveUntil(Routes.LogIn);
            //   },
            //   child: Text('Sign Out'),
            // ),
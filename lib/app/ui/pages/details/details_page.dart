import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_libros/app/ui/pages/details/bloc/detail_bloc.dart';

import 'bloc/states/detail_state.dart';

class DetailPage extends StatelessWidget {
  static const String ROUTE = '/desc';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(builder: (
      context,
      state,
    ) {
      if (state is LoadingDetailState) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is ErrorDetailState) {
        return Text('Ups! Hubo un error');
      } else if (state is LoadedDetailState) {
        final details = state.details;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Icon(Icons.favorite_border_sharp),
            backgroundColor: Colors.orange[300],
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.orange[300],
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/libro1.jpg",
                                  width: 150,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              'Estoy en desc con Titulo----',
                              // $bookCode',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Autor',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Rating',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '4,7',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Pages',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '240',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Language',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'ENG',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Audio',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02 hs',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('hola')),
                      ElevatedButton(onPressed: () {}, child: Text('hola')),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'Whats it about?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          'As a movie location scout, picture-perfect is the name of '
                          'the game. But her last project literally went up in flames, and '
                          'her career is on the verge of flaming out. Greer has been given '
                          'one more chance, if she can find the perfect undiscovered beach '
                          'hideaway for a big-budget movie. She zeroes in on a sleepy Florida'
                          'town called Cypress Key',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Who is for ?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          'As a movie location scout, picture-perfect is the name of '
                          'the game. But her last project literally went up in flames, and '
                          'her career is on the verge of flaming out. Greer has been given '
                          'one more chance, if she can find the perfect undiscovered beach '
                          'hideaway for a big-budget movie. She zeroes in on a sleepy Florida'
                          'town called Cypress Key',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
      throw StateError('hubo un error');
    });
  }
}

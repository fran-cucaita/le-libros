import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_libros/app/ui/pages/details/bloc/detail_bloc.dart';
import 'package:le_libros/widgets/book_detail_widget.dart';

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
          backgroundColor: Colors.brown[200],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BookDetailWidget(
                  image: details.image,
                  title: details.title,
                  author: details.author,
                  description: details.description,
                  epubLink: details.epubLink,
                  mobiLink: details.mobiLink,
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

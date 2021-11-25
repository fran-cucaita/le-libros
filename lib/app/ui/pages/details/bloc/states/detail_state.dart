import 'package:le_libros/models/book_datails.dart';

abstract class DetailState {
  const DetailState();
}

class LoadingDetailState extends DetailState {
  const LoadingDetailState();
}

class ErrorDetailState extends DetailState {
  const ErrorDetailState();
}

class LoadedDetailState extends DetailState {
  final BookDetails details;

  LoadedDetailState({required this.details});
}

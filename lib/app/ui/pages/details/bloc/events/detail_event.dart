import 'package:le_libros/app/domain/models/response.dart';

abstract class DetailEvent {
  const DetailEvent();
}

class LoadDetailsEvent extends DetailEvent {
  final String code;
  const LoadDetailsEvent(this.code);
}

import 'package:le_libros/models/metadata.dart';

import 'book.dart';
import 'metadata.dart';

class Response {
  final Metadata metadata;
  final List<Book> records;

  const Response({required this.metadata, required this.records});

  Response.fromJson(Map json)
      : metadata = Metadata.fromJson(json['metadata']),
        records = (json['records'] as List)
            .map((record) => Book.fromJson(record))
            .toList();
}

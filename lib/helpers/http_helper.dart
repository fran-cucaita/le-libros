import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:le_libros/models/response.dart';

class HttpHelper {
  //static final String key ='x-api-key=1nzDBp77Nt97AZEjumlV7CmsiYrLTbA9NcbrieU2';
  static final String url =
      'https://i6zfxk6hzb.execute-api.us-west-2.amazonaws.com/dev/books/recent-published';

  Future<Response> getRecentPublished() async {
    final response = await http.get(Uri.parse(url));
    final strbody = response.body;
    final body = json.decode(strbody);
    final r = Response.fromJson(body);
    return r;
  }
}

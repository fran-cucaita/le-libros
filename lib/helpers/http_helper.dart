import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:le_libros/models/categories.dart';
import 'package:le_libros/models/response.dart';

class HttpHelper {
  //static final String key ='x-api-key=1nzDBp77Nt97AZEjumlV7CmsiYrLTbA9NcbrieU2';
  static final String url =
      'https://i6zfxk6hzb.execute-api.us-west-2.amazonaws.com/dev/books/recent-published';

  static final String urlCategories =
      'https://i6zfxk6hzb.execute-api.us-west-2.amazonaws.com/dev/categories';

  Future<Response> getRecentPublished() async {
    final response = await http.get(Uri.parse(url));
    final strbody = response.body;
    final body = json.decode(strbody);
    final r = Response.fromJson(body);
    return r;
  }

  Future<List<Category>> getCategory() async {
    final urlCategory = await http.get(Uri.parse(urlCategories));
    final strbody = urlCategory.body;
    final body = json.decode(strbody);
    final categories = (body as List).map((e) => Category.fromJson(e)).toList();
    return categories;
  }
}

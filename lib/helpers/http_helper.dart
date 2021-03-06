import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:le_libros/app/domain/models/category.dart';
import 'package:le_libros/app/domain/models/response.dart';
import 'package:le_libros/models/book_datails.dart';
import 'package:path_provider/path_provider.dart';

class HttpHelper {
  //static final String key ='x-api-key=1nzDBp77Nt97AZEjumlV7CmsiYrLTbA9NcbrieU2';
  static final String url =
      'https://i6zfxk6hzb.execute-api.us-west-2.amazonaws.com/dev/books/recent-published';

  static final String urlCategories =
      'https://i6zfxk6hzb.execute-api.us-west-2.amazonaws.com/dev/categories';

  static final String urlDetails =
      'https://i6zfxk6hzb.execute-api.us-west-2.amazonaws.com/dev/books';

  Future<Response> getRecentPublished() async {
    final response = await http.get(Uri.parse(url));
    final strbody = response.body;
    final body = json.decode(strbody);
    final r = Response.fromJson(body);
    return r;
  }

  Future<List<Category>> getCategories() async {
    final urlCategory = await http.get(Uri.parse(urlCategories));
    final strbody = urlCategory.body;
    final body = json.decode(strbody);
    final categories = (body as List).map((e) => Category.fromJson(e)).toList();
    return categories;
  }

  Future<BookDetails> getBookDetails(String code) async {
    final urlDetail = await http.get(Uri.parse(urlDetails + "/" + code));
    final strbody = urlDetail.body;
    final body = json.decode(strbody);
    final detail = BookDetails.fromJson(body);
    return detail;
  }

  Future<Response> getBookListByCategory(String code) async {
    final urlCategoryBook =
        await http.get(Uri.parse(urlDetails + "?category=" + code));
    final strbody = urlCategoryBook.body;
    final body = json.decode(strbody);
    final response = Response.fromJson(body);
    return response;
  }

  Future<String> downloadLink(String link, String bookCode) async {
    String tmpDir = (await getTemporaryDirectory()).path;
    http.Client client = new http.Client();
    var res = await client.get(Uri.parse(link));
    var bytes = res.bodyBytes;
    File file = new File('$tmpDir/$bookCode');
    await file.writeAsBytes(bytes);
    return '$tmpDir/$bookCode';

    ///$filename';

    ///$filename'
  }
}

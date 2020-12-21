import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/models/author.dart';
import 'package:news_app/utilites/api_utilites.dart';

class AuthorAPI {
  Future<List<Author>> fetchAllAuthor() async {
    String allAuthorsApi = base_api + all_authors_api;
    var response = await http.get(allAuthorsApi);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      print(response.statusCode);
    }
  }
}

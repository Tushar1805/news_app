import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:news_app/Data/news_model.dart';

class ApiService extends ChangeNotifier{
  // NOTE: Make sure to use your own api key

  // Everything API_Head
  final apiHead =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=1d5424fca4b145e3848a4f50c6a3016d";

  // Lets call the api and fill the data
  Future<List<Article>> getArticles() async {
    try {
      Response res = await get(Uri.parse(apiHead));

      // Statuscode == 200
      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);

        List<dynamic> body = json['articles'];

        List<Article> articles =
            body.map((dynamic item) => Article.fromJson(item)).toList();
        return articles;
      }
    } catch (e) {
      throw ("ERROR: Fetching the articles");
    }
  }
}
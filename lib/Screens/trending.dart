import 'package:flutter/material.dart';
import 'package:news_app/Data/news_model.dart';

@override
Widget Trending(
    {BuildContext context,
    ScrollController scrollController,
    List<Article> articles,
    bool isMoreLoading}) {
  return ListView.builder(
      controller: scrollController,
      itemCount: isMoreLoading ? articles.length + 1 : articles.length,
      itemBuilder: (context, index) {
        if (index < articles.length) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              children: [Text(articles[index].author ?? ""),  SizedBox(height: 10,), Text(articles[index].content ?? "")
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

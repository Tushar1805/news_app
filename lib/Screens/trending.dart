import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:news_app/Data/news_model.dart';
import 'package:news_app/Service/api_service.dart';
import 'package:provider/provider.dart';

@override
Widget trending(
    {BuildContext context,
    ScrollController scrollController,
    List<Article> articles,
    bool isMoreLoading}) {
  return ListView.builder(
      controller: scrollController,
      itemCount: isMoreLoading ? articles.length + 1 : articles.length,
      itemBuilder: (context, index) {
        if (index < articles.length) {
          return FutureBuilder(
              future: context.watch<ApiService>().imageFor(articles[index]),
              builder: (context, snapshot) {
                if (snapshot.hasData == false || snapshot.data == null) {
                  return const SizedBox(
                    height: 230,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.memory((snapshot.data as Uint8List))
                                  .image,
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            child: Text(
                              articles[index].title ?? "",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(10, 4, 10, 8),
                            child: Text(
                              articles[index].source.name ?? "",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.redAccent.shade200),
                            )),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

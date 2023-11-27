import 'package:flutter/material.dart';
import 'package:news_app/Widgets/search_bar.dart';
import 'package:news_app/Widgets/tab_navigation.dart';
import 'package:news_app/Widgets/utlits.dart';

PreferredSize appBar(
    BuildContext context, TextEditingController searchController) {
  return PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              topBar(),
              SizedBox(
                height: 10,
              ),
              searchBar(context, searchController),
              SizedBox(
                height: 10,
              ),
              tabNav()
            ],
          ),
        ),
      ));
}

Widget topBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        Icons.menu,
        color: Colors.white,
      ),
      Text("News",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      Icon(
        Icons.more_horiz,
        color: Colors.white,
      )
    ],
  );
}

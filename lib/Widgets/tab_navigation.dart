import 'package:flutter/material.dart';
import 'package:news_app/Widgets/utlits.dart';

Widget tabNav() {
  return TabBar(
    unselectedLabelColor: Colors.grey.shade400,
    labelColor: Colors.redAccent.shade400,
    indicatorColor: Colors.redAccent.shade400,
    labelStyle: tabTextStyle(),
    tabs: [
      Tab(
        text: "Trending",
      ),
      Tab(text: "Top Headlines")
    ],
  );
}

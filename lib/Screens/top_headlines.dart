import 'package:flutter/material.dart';

class TopHeadlines extends StatefulWidget {
  const TopHeadlines({ Key key }) : super(key: key);

  @override
  State<TopHeadlines> createState() => _TopHeadlinesState();
}

class _TopHeadlinesState extends State<TopHeadlines> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Top Headlines"),),);
  }
}
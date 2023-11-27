import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:news_app/Data/news_model.dart';
import 'package:http/http.dart' as http;

BoxDecoration boxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
    gradient: LinearGradient(
        colors: [Colors.black, Colors.grey.shade700],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
  );
}

TextStyle tabTextStyle() {
  return TextStyle(
      fontFamily: "RobotoMono", fontSize: 18, fontWeight: FontWeight.bold);
}



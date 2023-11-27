import 'package:flutter/material.dart';

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
      fontFamily: "Raleway", fontSize: 18, fontWeight: FontWeight.bold);
}

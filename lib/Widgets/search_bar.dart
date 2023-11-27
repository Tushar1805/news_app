import 'package:flutter/material.dart';

Widget searchBar() {
  TextEditingController searchController = new TextEditingController();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        fit: FlexFit.tight,
        flex: 3,
        child: SizedBox(
          height: 35,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade400,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              prefixIcon: Icon(Icons.search),
              hintText: "Search News",
              contentPadding: EdgeInsets.all(0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 0.3,
                ),
              ),
            ),
            onChanged: (value) {},
          ),
        ),
      ),
      Flexible(
          flex: 1,
          child: TextButton(
              onPressed: () {
                searchController.clear();
              },
              child: Text(
                "Cancel",
                style:
                    TextStyle(color: Colors.redAccent.shade400, fontSize: 18),
              )))
    ],
  );
}

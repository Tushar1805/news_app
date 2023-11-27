import 'package:flutter/material.dart';
import 'package:news_app/Screens/top_headlines.dart';
import 'package:news_app/Screens/trending.dart';
import 'package:news_app/Widgets/app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Futura',
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // length
        child: Scaffold(
          appBar: appBar(context, searchController),
          body: TabBarView(children: [
            Trending(),
            TopHeadlines(),
          ]),
        ));
  }
}

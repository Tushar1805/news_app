import 'package:flutter/material.dart';
import 'package:news_app/Screens/top_headlines.dart';
import 'package:news_app/Screens/trending.dart';
import 'package:news_app/Service/api_service.dart';
import 'package:news_app/Widgets/app_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ApiService(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
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
  int page = 1;
  bool isMoreLoading = false;
  final scrollController = ScrollController();
  bool _dataLoaded = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    _loadData(page);
  }

  Future<void> _loadData(int page) async {
    await context.read<ApiService>().getArticles(page);
    setState(() {
      _dataLoaded = true;
    });
  }

  void _scrollListener() async {
    if (isMoreLoading || !_dataLoaded) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isMoreLoading = true;
      });
      page = page + 1;
      print("Page: $page");
      await _loadData(page);
      setState(() {
        isMoreLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // length
        child: Scaffold(
          appBar: appBar(context),
          body: TabBarView(children: [
            !_dataLoaded
                ? Center(child: CircularProgressIndicator())
                : Trending(
                    context: context,
                    scrollController: scrollController,
                    articles: context.watch<ApiService>().articles,
                    isMoreLoading: isMoreLoading),
            TopHeadlines(),
          ]),
        ));
  }
}

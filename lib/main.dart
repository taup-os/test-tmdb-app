import 'package:flutter/material.dart';
import 'package:movie_app_flutter/utils/text.dart';
import 'package:movie_app_flutter/widgets/news.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.pink),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = 'b3b5abc5b90e9a7a9eef90de5e433c37';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiM2I1YWJjNWI5MGU5YTdhOWVlZjkwZGU1ZTQzM2MzNyIsInN1YiI6IjYxZWMxZjc1ZWEzN2UwMDA5ZTgyMTU5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tOM8rDu8v75ZeLlCBC4hZtTDR7y8AuRtHgDeLFHik-c';
  List trendingmovies = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          // TV(tv: tv),
          TrendingMovies(
            trending: trendingmovies,
          ),
          // TopRatedMovies(
          //   toprated: topratedmovies,
          // ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http_request/pages/movie_list_nowplaying.dart';
import 'package:http_request/pages/movie_list_toprated.dart';
import 'package:http_request/pages/movie_list_upcoming.dart';
import 'pages/movie_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "The Movie DB",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Popular",
                ),
                Tab(
                  text: "Now Playing",
                ),
                Tab(text: "Top Rated"),
                Tab(text: "Upcoming"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MovieList(),
              MovieListNowPlaying(),
              MovieListTopRated(),
              MovieListUpcoming(),
            ],
          ),
        ),
      ),
    );
  }
}

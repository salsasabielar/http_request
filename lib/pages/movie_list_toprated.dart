import 'package:flutter/material.dart';
import 'package:http_request/pages/movie_detail_toprated.dart';
import 'package:http_request/service/http_service.dart';

class MovieListTopRated extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieListTopRated> {
  int moviesCount;
  List movies;
  HttpService service;
  var image;

  Future initialize() async {
    movies = [];
    movies = await service.getTopRatedMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image.network(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/' +
                      movies[position].posterPath),
              title: Text(
                movies[position].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Rating : ' + movies[position].voteAverage.toString(),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetailTopRated(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}

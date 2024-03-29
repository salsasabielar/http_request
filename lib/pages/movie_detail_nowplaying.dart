import 'package:flutter/material.dart';
import 'package:http_request/model/movie.dart';

class MovieDetailNowPlaying extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetailNowPlaying(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://image.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                child: Text(
                  movie.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Container(
                child: Text(
                  'Rating : ' + movie.voteAverage.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Text(
                  movie.overview,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(left: 16, right: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

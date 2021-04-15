import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_request/model/movie.dart';

class HttpService {
  final String apiKey = '5d7f4713f7afca5bbe780b02048526b3';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';
  final String baseUrl2 =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=';
  final String baseUrl3 =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=';
  final String baseUrl4 =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=';

  Future<List> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getNowPlayingMovies() async {
    final String uri = baseUrl2 + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getTopRatedMovies() async {
    final String uri = baseUrl3 + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }

  Future<List> getUpcomingMovies() async {
    final String uri = baseUrl4 + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}

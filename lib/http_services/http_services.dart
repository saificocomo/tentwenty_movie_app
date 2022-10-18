import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ten_twenty_movie_app/movie_details/model/movie_details_model.dart';

import '../watch/model/movies_model.dart';

var apiKey = "18936a1a8dce78e251d7cae95ea389c6";

class HttpService {
  final dio = Dio();

  static const BASE_URL = "https://api.themoviedb.org/3/movie/";

  Future<MoviesModel> getUpComingMovies() async {
    const url = "${BASE_URL}upcoming?api_key=18936a1a8dce78e251d7cae95ea389c6";
    MoviesModel movieObj;
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final data = response.data;
      movieObj = MoviesModel.fromJson(data);
      return movieObj;
    } else {
      throw response.statusCode.toString();
    }
  }

  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    print("this is id in url $movieId");
    var url = "$BASE_URL/$movieId?api_key=18936a1a8dce78e251d7cae95ea389c6";
    debugPrint("url in details $url");
    MovieDetailsModel movieDetail;

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;
      print("this is data $data");

      movieDetail = MovieDetailsModel.fromJson(data);
      debugPrint("movie obj ${movieDetail.title.toString()}");
      return movieDetail;
    } else {
      throw response.statusCode.toString();
    }
  }
}

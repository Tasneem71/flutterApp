
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'Movie.dart';

class FetchMovieList extends ChangeNotifier{
  List<MovieResult> _movie= [];

  get movies => _movie;

   // FetchMovieList(List<MovieResult> movie){
   //  this.movie = movie;
   // }

  Future<List<MovieResult>>getMovies(String movieListType) async{
     _movie = [];
    print("Start Fetch Movies");
    var response = await Dio()
        .get('https://api.themoviedb.org/3/movie/'+movieListType,
        queryParameters: {'api_key': 'f55fbda0cb73b855629e676e54ab6d8e'});
    for(var item in response.data['results']){
      print(MovieResult.fromJson(item));
      MovieResult result = MovieResult.fromJson(item);
      print("Movie Name ${result.originalTitle}");
      _movie.add(result);
    }
    notifyListeners();
    return movies;
  }
}
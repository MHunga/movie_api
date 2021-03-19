import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_api/model/response_cast.dart';
import 'package:movie_api/model/response_movie.dart';
import 'package:movie_api/resource/api_service/base_url.dart';

class ResponseApi {
  final popularMovieEndPoint =
      "movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN";
  final castEndpoint =
      "credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN";

//get list popular movie
  Future<List<Movie>> getListPopularMovie() async {
    List<Movie> listMovie = [];
    final response =
        await http.get(BaseUrl().baseUrlApi + popularMovieEndPoint);
    final data = jsonDecode(response.body);
    data["results"].forEach((v) {
      listMovie.add(new Movie.fromJson(v));
    });
    return listMovie;
  }

// get list cast of movie
  Future<List<Cast>> getListCast(int idMovie) async {
    List<Cast> listCast = [];
    final response =
        await http.get(BaseUrl().baseUrlApi + "movie/$idMovie/" + castEndpoint);
    final data = jsonDecode(response.body);
    data["cast"].forEach((v) {
      listCast.add(new Cast.fromJson(v));
    });
    return listCast;
  }
}

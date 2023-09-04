// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';


import '../core/api_constant.dart';
import '../models/movie_model.dart';
import '../models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class ApiClient {
  final HttpClient _client;

  ApiClient(this._client);

  Future<List<MovieModel>> fetchMovies(String url) async {
    final uri = Uri.parse('$url?api_key=${ApiConstant.API_KEY}');

    final request = await _client.getUrl(uri);
    request.headers.add('Content-Type', 'application/json');

    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      final moviesResult =
          MoviesResultModel.fromJson(json.decode(responseBody));
      print(moviesResult.movies);
      if (moviesResult.movies != null) {
        return moviesResult.movies!;
      } else {
        throw Exception('Movies list is null');
      }
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _apiClient;

  MovieRemoteDataSourceImpl(HttpClient client) : _apiClient = ApiClient(client);

  @override
  Future<List<MovieModel>> getTrending() async {
    return _apiClient.fetchMovies('${ApiConstant.BASE_URL}trending/movie/week');
  }  

  @override
  Future<List<MovieModel>> getPopular() async {
    return _apiClient.fetchMovies('${ApiConstant.BASE_URL}movie/popular');
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    return _apiClient.fetchMovies('${ApiConstant.BASE_URL}movie/upcoming');
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    return _apiClient.fetchMovies('${ApiConstant.BASE_URL}movie/now_playing');
  }
}

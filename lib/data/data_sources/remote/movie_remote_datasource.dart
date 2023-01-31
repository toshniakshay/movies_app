import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/models/movies_model.dart';
import 'package:movies_app/data/models/tending_movies_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MoviesModel>> getTrendingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getPlayingNowMovies();
  Future<List<MoviesModel>> getUpComingMovies();
}

class MoviesRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient client;

  MoviesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MoviesModel>> getTrendingMovies() async {
    final response = await client.get(path: 'trending/movie/day');
    final movies = TrendingMoviesResponse.fromJson(response).results;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await client.get(path: 'movie/popular');
    final movies = TrendingMoviesResponse.fromJson(response).results;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoviesModel>> getPlayingNowMovies() async {
    final response = await client.get(path: 'movie/now_playing');
    final movies = TrendingMoviesResponse.fromJson(response).results;
    print(movies);
    return movies;
  }

  @override
  Future<List<MoviesModel>> getUpComingMovies() async {
    final response = await client.get(path: 'movie/upcoming');
    final movies = TrendingMoviesResponse.fromJson(response).results;
    print(movies);
    return movies;
  }
}

import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrendingMovies();
  Future<Either<AppError, List<MovieEntity>>> getPopularMovies();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNowMovies();
  Future<Either<AppError, List<MovieEntity>>> getUpComingMovies();
}

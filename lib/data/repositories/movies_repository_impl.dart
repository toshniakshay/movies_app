import 'package:dartz/dartz.dart';
import 'package:movies_app/data/data_sources/remote/movie_remote_datasource.dart';
import 'package:movies_app/data/models/movies_model.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppError, List<MoviesModel>>> getTrendingMovies() async {
    try {
      final result = await remoteDataSource.getTrendingMovies();
      return Right(result);
    } on Exception {
      return const Left(AppError(message: 'Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNowMovies() async {
    try {
      final result = await remoteDataSource.getPlayingNowMovies();
      return Right(result);
    } on Exception {
      return const Left(AppError(message: 'Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopularMovies() async {
    try {
      final result = await remoteDataSource.getPopularMovies();
      return Right(result);
    } on Exception {
      return const Left(AppError(message: 'Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getUpComingMovies() async {
    try {
      final result = await remoteDataSource.getUpComingMovies();
      return Right(result);
    } on Exception {
      return const Left(AppError(message: 'Something went wrong'));
    }
  }
}

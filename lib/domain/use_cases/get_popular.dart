import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/use_cases/use_case.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPopular({required this.repository});

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getPopularMovies();
  }
}

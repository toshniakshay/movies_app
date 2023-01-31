import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/core/api_client.dart';
import 'package:movies_app/data/data_sources/remote/movie_remote_datasource.dart';
import 'package:movies_app/data/repositories/movies_repository_impl.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/use_cases/get_playing_now.dart';
import 'package:movies_app/domain/use_cases/get_popular.dart';
import 'package:movies_app/domain/use_cases/get_trending.dart';
import 'package:movies_app/domain/use_cases/get_upcoming.dart';
import 'package:movies_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/bloc/movie_carousal/movie_carousal_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<http.Client>(() => http.Client());
  getItInstance.registerLazySingleton<ApiClient>(
      () => ApiClient(client: getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MoviesRepositoryImpl(remoteDataSource: getItInstance()));
  getItInstance.registerLazySingleton<GetTrending>(
      () => GetTrending(repository: getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(repository: getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(
      () => GetPopular(repository: getItInstance()));
  getItInstance.registerLazySingleton<GetUpcoming>(
      () => GetUpcoming(repository: getItInstance()));
  getItInstance.registerFactory<MovieCarousalBloc>(() => MovieCarousalBloc(
      getTrending: getItInstance(), backdropBloc: getItInstance()));
  getItInstance.registerFactory<MovieBackdropBloc>(() => MovieBackdropBloc());
}

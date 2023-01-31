import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/use_cases/get_trending.dart';

part 'movie_carousal_event.dart';

part 'movie_carousal_state.dart';

class MovieCarousalBloc extends Bloc<MovieCarousalEvent, MovieCarousalState> {
  final GetTrending getTrending;

  MovieCarousalBloc({required this.getTrending})
      : super(MovieCarousalInitial()) {
    on<CarousalLoadEvent>((event, emit) async {
      final moviesEither = await getTrending(NoParams());
      moviesEither.fold((error) {
        emit(MovieCarousalErrorState());
      }, (movies) {
        emit(MovieCarousalLoadedState(
          movies: movies,
          defaultIndex: event.defaultIndex,
        ));
      });
    });
  }
}

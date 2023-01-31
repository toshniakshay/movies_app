import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/use_cases/get_trending.dart';
import 'package:movies_app/presentation/bloc/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousal_event.dart';

part 'movie_carousal_state.dart';

class MovieCarousalBloc extends Bloc<MovieCarousalEvent, MovieCarousalState> {
  final GetTrending getTrending;
  final MovieBackdropBloc backdropBloc;

  MovieCarousalBloc({required this.getTrending, required this.backdropBloc})
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
        backdropBloc.add(MovieBackdropChangedEvent(movie: movies[0]));
      });
    });
  }
}

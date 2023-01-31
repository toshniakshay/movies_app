part of 'movie_carousal_bloc.dart';

abstract class MovieCarousalState extends Equatable {
  const MovieCarousalState();

  @override
  List<Object> get props => [];
}

class MovieCarousalInitial extends MovieCarousalState {}

class MovieCarousalErrorState extends MovieCarousalState {}

class MovieCarousalLoadedState extends MovieCarousalState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarousalLoadedState({required this.movies, this.defaultIndex = 0});

  @override
  List<Object> get props => [movies, defaultIndex];
}

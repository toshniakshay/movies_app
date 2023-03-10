part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropState extends Equatable {
  const MovieBackdropState();

  @override
  List<Object> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackDropChanged extends MovieBackdropState {
  final MovieEntity movie;

  const MovieBackDropChanged({required this.movie});

  @override
  List<Object> get props => [movie];
}


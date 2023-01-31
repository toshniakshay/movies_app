import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double? voteAverage;

  const MovieEntity({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    this.voteAverage,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool? get stringify => true;
}

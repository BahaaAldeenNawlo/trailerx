import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final String backdropPath;
  final String title;
  final String releaseDate;
  final String overview;

  final int id;

  final num voteAverage;

  const MovieEntity({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });
  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}

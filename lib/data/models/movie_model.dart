// ignore_for_file: overridden_fields


import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool adult;

  @override
  final String backdropPath;
  final List<int> genreIds;

  @override
  final int id;
  final String originalLanguage;
  final String originalTitle;

  @override
  final String overview;
  final double popularity;

  @override
  final String posterPath;

  @override
  final String releaseDate;

  @override
  final String title;
  final bool video;

  @override
  final double voteAverage;
  final int voteCount;

  const MovieModel(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount})
      : super(
          backdropPath: backdropPath,
          title: title,
          id: id,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

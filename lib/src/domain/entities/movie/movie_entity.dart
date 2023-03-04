import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieEntity {
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? originalLanguage;
  final String? posterPath;
  final String? backdropPath;
  final bool isAdult;
  final DateTime? releaseDate;
  final List<int> genreIds;
  final String? overview;
  final double? popularity;
  final int? voteCount;
  final double? voteAverage;
  final bool video;

  const MovieEntity({
    this.id,
    this.title,
    this.originalTitle,
    this.originalLanguage,
    this.posterPath,
    this.backdropPath,
    required this.isAdult,
    this.releaseDate,
    required this.genreIds,
    this.overview,
    this.popularity,
    this.voteCount,
    this.voteAverage,
    required this.video,
  });

  MovieEntity copyWith({
    int? id,
    String? title,
    String? originalTitle,
    String? originalLanguage,
    String? posterPath,
    String? backdropPath,
    bool? isAdult,
    DateTime? releaseDate,
    List<int>? genreIds,
    String? overview,
    double? popularity,
    int? voteCount,
    double? voteAverage,
    bool? video,
  }) {
    return MovieEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      isAdult: isAdult ?? this.isAdult,
      releaseDate: releaseDate ?? this.releaseDate,
      genreIds: genreIds ?? this.genreIds,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      voteAverage: voteAverage ?? this.voteAverage,
      video: video ?? this.video,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (originalTitle != null) {
      result.addAll({'originalTitle': originalTitle});
    }
    if (originalLanguage != null) {
      result.addAll({'originalLanguage': originalLanguage});
    }
    if (posterPath != null) {
      result.addAll({'posterPath': posterPath});
    }
    if (backdropPath != null) {
      result.addAll({'backdropPath': backdropPath});
    }
    result.addAll({'isAdult': isAdult});
    if (releaseDate != null) {
      result.addAll({'releaseDate': releaseDate!.millisecondsSinceEpoch});
    }
    result.addAll({'genreIds': genreIds});
    if (overview != null) {
      result.addAll({'overview': overview});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (voteCount != null) {
      result.addAll({'voteCount': voteCount});
    }
    if (voteAverage != null) {
      result.addAll({'voteAverage': voteAverage});
    }
    result.addAll({'video': video});

    return result;
  }

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map['id']?.toInt(),
      title: map['title'],
      originalTitle: map['original_title'],
      originalLanguage: map['original_language'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      isAdult: map['is_adult'] ?? false,
      releaseDate: map['release_date'] != null ? DateTime.tryParse(map['release_date']) : null,
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      voteCount: map['vote_count']?.toInt(),
      voteAverage: map['vote_average']?.toDouble(),
      video: map['video'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieEntity.fromJson(String source) => MovieEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieEntity(id: $id, title: $title, originalTitle: $originalTitle, originalLanguage: $originalLanguage, posterPath: $posterPath, backdropPath: $backdropPath, isAdult: $isAdult, releaseDate: $releaseDate, genreIds: $genreIds, overview: $overview, popularity: $popularity, voteCount: $voteCount, voteAverage: $voteAverage, video: $video)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieEntity &&
        other.id == id &&
        other.title == title &&
        other.originalTitle == originalTitle &&
        other.originalLanguage == originalLanguage &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath &&
        other.isAdult == isAdult &&
        other.releaseDate == releaseDate &&
        listEquals(other.genreIds, genreIds) &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.voteCount == voteCount &&
        other.voteAverage == voteAverage &&
        other.video == video;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        originalTitle.hashCode ^
        originalLanguage.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode ^
        isAdult.hashCode ^
        releaseDate.hashCode ^
        genreIds.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        voteCount.hashCode ^
        voteAverage.hashCode ^
        video.hashCode;
  }
}

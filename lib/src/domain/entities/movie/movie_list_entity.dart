import 'dart:convert';

class MovieListEntity {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? listType;
  final int? itemCount;
  final int? favoriteCount;
  final String? description;

  const MovieListEntity({
    this.id,
    this.name,
    this.posterPath,
    this.listType,
    this.itemCount,
    this.favoriteCount,
    this.description,
  });

  MovieListEntity copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? listType,
    int? itemCount,
    int? favoriteCount,
    String? description,
  }) {
    return MovieListEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      listType: listType ?? this.listType,
      itemCount: itemCount ?? this.itemCount,
      favoriteCount: favoriteCount ?? this.favoriteCount,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (posterPath != null) {
      result.addAll({'posterPath': posterPath});
    }
    if (listType != null) {
      result.addAll({'listType': listType});
    }
    if (itemCount != null) {
      result.addAll({'itemCount': itemCount});
    }
    if (favoriteCount != null) {
      result.addAll({'favoriteCount': favoriteCount});
    }
    if (description != null) {
      result.addAll({'description': description});
    }

    return result;
  }

  factory MovieListEntity.fromMap(Map<String, dynamic> map) {
    return MovieListEntity(
      id: map['id']?.toInt(),
      name: map['name'],
      posterPath: map['posterPath'],
      listType: map['listType'],
      itemCount: map['itemCount']?.toInt(),
      favoriteCount: map['favoriteCount']?.toInt(),
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieListEntity.fromJson(String source) => MovieListEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieListEntity(id: $id, name: $name, posterPath: $posterPath, listType: $listType, itemCount: $itemCount, favoriteCount: $favoriteCount, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieListEntity &&
        other.id == id &&
        other.name == name &&
        other.posterPath == posterPath &&
        other.listType == listType &&
        other.itemCount == itemCount &&
        other.favoriteCount == favoriteCount &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        posterPath.hashCode ^
        listType.hashCode ^
        itemCount.hashCode ^
        favoriteCount.hashCode ^
        description.hashCode;
  }
}

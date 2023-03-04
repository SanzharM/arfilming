import 'dart:convert';

class UserEntity {
  final int? id;
  final String? name;
  final String? username;
  final String? avatar;

  const UserEntity({
    this.id,
    this.name,
    this.username,
    this.avatar,
  });

  bool get isAuthorized => id != null;
  bool get isNotAuthorized => !isAuthorized;

  UserEntity copyWith({
    int? id,
    String? name,
    String? username,
    String? avatar,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
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
    if (username != null) {
      result.addAll({'username': username});
    }
    if (avatar != null) {
      result.addAll({'avatar': avatar});
    }

    return result;
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id']?.toInt(),
      name: map['name'],
      username: map['username'],
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, username: $username, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity && other.id == id && other.name == name && other.username == username && other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ username.hashCode ^ avatar.hashCode;
  }
}

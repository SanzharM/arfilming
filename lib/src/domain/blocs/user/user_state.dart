part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserEntity user;
  final bool isLoading;
  final String error;

  const UserState({
    this.user = const UserEntity(),
    this.isLoading = false,
    this.error = '',
  });

  bool get isAuthorized => user.isAuthorized;
  bool get isNotAuthorized => user.isNotAuthorized;

  @override
  List<Object?> get props => [user, isLoading, error];

  UserState copyWith({
    UserEntity? user,
    bool? isLoading,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? '',
    );
  }
}

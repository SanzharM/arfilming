part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.theme = CustomTheme.defaultTheme,
  });

  final CustomTheme theme;

  @override
  List<Object> get props => [theme];

  ThemeState copyWith({
    CustomTheme? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }
}

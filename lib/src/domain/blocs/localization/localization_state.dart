part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  const LocalizationState({required this.locale});

  final Locale locale;

  @override
  List<Object?> get props => [locale];

  LocalizationState copyWith({
    Locale? locale,
  }) {
    return LocalizationState(
      locale: locale ?? this.locale,
    );
  }
}

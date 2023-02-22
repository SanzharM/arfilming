part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent extends Equatable {}

class LocalizationInitialEvent extends LocalizationEvent {
  @override
  List<Object?> get props => [];
}

class LocalizationChangeEvent extends LocalizationEvent {
  final Locale locale;

  LocalizationChangeEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}

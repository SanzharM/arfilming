import 'package:arfilming/src/core/l10n/generated/l10n.dart';
import 'package:arfilming/src/core/l10n/l10n_service.dart';
import 'package:arfilming/src/core/services/local_storage/local_storage.dart';
import 'package:arfilming/src/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  void initial() => add(LocalizationInitialEvent());
  void change(Locale locale) => add(LocalizationChangeEvent(locale));

  LocalizationBloc() : super(const LocalizationState(locale: L10n.english)) {
    on<LocalizationInitialEvent>(_initial);
    on<LocalizationChangeEvent>(_change);
  }

  final LocalStorage _storage = sl<LocalStorage>();

  void _initial(LocalizationInitialEvent event, Emitter<LocalizationState> emit) async {
    final storedLocale = await _storage.getLocale();

    if (storedLocale == null) {
      final Locale systemLocale = WidgetsBinding.instance.window.locale;
      if (S.delegate.supportedLocales.contains(systemLocale)) {
        return emit(state.copyWith(locale: systemLocale));
      }
      return emit(state.copyWith(locale: S.delegate.supportedLocales.first));
    }
    return emit(state.copyWith(locale: storedLocale));
  }

  void _change(LocalizationChangeEvent event, Emitter<LocalizationState> emit) {
    return emit(state.copyWith(locale: event.locale));
  }
}

import 'package:arfilming/src/core/services/local_storage/local_storage.dart';
import 'package:arfilming/src/domain/entities/custom_theme/custom_theme.dart';
import 'package:arfilming/src/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  void initial() => add(ThemeInitialEvent());
  void change(CustomTheme theme) => add(ThemeChangeEvent(theme));

  ThemeBloc() : super(const ThemeState()) {
    on<ThemeInitialEvent>(_initial);
    on<ThemeChangeEvent>(_change);
  }

  final LocalStorage _storage = sl<LocalStorage>();

  void _initial(ThemeInitialEvent event, Emitter<ThemeState> emit) async {
    final storedTheme = await _storage.getTheme();
    return emit(state.copyWith(theme: storedTheme));
  }

  void _change(ThemeChangeEvent event, Emitter<ThemeState> emit) {
    return emit(state.copyWith(theme: event.theme));
  }
}

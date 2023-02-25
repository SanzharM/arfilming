import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  void changeIndex(int index) => add(NavBarChangeIndexEvent(index));

  NavBarBloc() : super(const NavBarState()) {
    on<NavBarChangeIndexEvent>(_changeIndex);
  }

  void _changeIndex(NavBarChangeIndexEvent event, Emitter<NavBarState> emit) {
    if (event.index < 0 || event.index > 3) {
      return;
    }
    return emit(state.copyWith(currentIndex: event.index));
  }
}

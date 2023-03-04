import 'package:arfilming/src/core/services/local_storage/local_storage.dart';
import 'package:arfilming/src/domain/entities/user/user_entity.dart';
import 'package:arfilming/src/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  void initial() => add(UserInitialEvent());
  void fetch() => add(UserFetchEvent());

  UserBloc() : super(const UserState()) {
    on<UserInitialEvent>(_initial);
    on<UserFetchEvent>(_fetch);
  }

  final LocalStorage _storage = sl<LocalStorage>();

  void _initial(UserInitialEvent event, Emitter<UserState> emit) async {
    try {
      final hasSession = await _storage.getSession() != null;
      if (hasSession) {
        return fetch();
      }
    } catch (e) {
      debugPrint('UserInitialEvent error: $e');
    }
  }

  void _fetch(UserFetchEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      // final response =
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      debugPrint('UserFetchEvent error: $e');
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}

import 'package:arfilming/src/core/services/local_storage/local_storage.dart';
import 'package:arfilming/src/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  void initial() => add(OnboardingInitialEvent());

  OnboardingBloc() : super(OnboardingState()) {
    on<OnboardingInitialEvent>(_initial);
  }

  final _storage = sl<LocalStorage>();

  void _initial(
    OnboardingInitialEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    final bool didShowOnboarding = await _storage.getOnboardingShowed();
    if (didShowOnboarding) {
      return;
    }
    return emit(OnboardingShowState());
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/user_preferences.dart';
import "../../../../../injection_container.dart" as di;

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeStart>(_onStartWelcome);
  }

  Future<void> _onStartWelcome(event, emit) async {
    UserPreferences preference = UserPreferences(
      sharedPreferences: di.sl<SharedPreferences>(),
      authBox: di.sl(),
    );
    preference.sliderSeen();

    emit(WelcomeComplete());
  }
}

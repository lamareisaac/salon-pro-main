part of 'welcome_bloc.dart';

sealed class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

final class WelcomeStart extends WelcomeEvent {}

final class WelcomeEnd extends WelcomeEvent {}

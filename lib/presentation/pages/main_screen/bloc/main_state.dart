part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitialState extends MainState {}

final class MainLoadingState extends MainState {}

final class MainLoadedState extends MainState {
  MainLoadedState({required this.facts});

  final Facts facts;
}

final class MainErrorState extends MainState {
  MainErrorState(this.exception);

  final Object exception;
}

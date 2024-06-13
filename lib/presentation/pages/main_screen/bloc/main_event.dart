part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

final class LoadingFactsEvent extends MainEvent {}
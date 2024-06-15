import 'package:askm/data/models/facts.dart';
import 'package:askm/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(this.repository) : super(MainInitialState()) {
    on<LoadingFactsEvent>((event, emit) async {
      emit(MainLoadingState());
      try {
        final facts = await repository.getFacts();
        emit(MainLoadedState(facts: facts));
      } catch (e) {
        emit(MainErrorState(e));
      }
    });
  }

  final Repository repository;
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pulsz_app/services/shared_preferences.dart';

part 'statistics_event.dart';

part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitial()) {
    on<GetStatisticsEvent>(_getStatisticsHandler);
  }

  void _getStatisticsHandler(
      GetStatisticsEvent event, Emitter<StatisticsState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    final values = [
      storage.gamesCounter,
      storage.victoryCounter,
      storage.lossesCounter,
    ];

    if (values.every((element) => element.isNaN)) {
      values.forEach((element) => element = 0);
    }
    final double winningRate = (storage.victoryCounter /
            (storage.victoryCounter + storage.lossesCounter)) *
        100;

    if (winningRate.isNaN) {
      emit(LoadedStatisticsState(
          games: storage.gamesCounter,
          victory: storage.victoryCounter,
          losses: storage.lossesCounter,
          winningPercentage: 0));
    } else {
      emit(LoadedStatisticsState(
          games: storage.gamesCounter,
          victory: storage.victoryCounter,
          losses: storage.lossesCounter,
          winningPercentage: winningRate.round()));
    }
  }
}

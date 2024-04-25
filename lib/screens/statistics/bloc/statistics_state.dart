part of 'statistics_bloc.dart';

@immutable
abstract class StatisticsState {}

class StatisticsInitial extends StatisticsState {}

class LoadedStatisticsState extends StatisticsState {
  final int games;
  final int victory;
  final int losses;
  final int winningPercentage;

  LoadedStatisticsState(
      {required this.games,
      required this.victory,
      required this.losses,
      required this.winningPercentage});
}

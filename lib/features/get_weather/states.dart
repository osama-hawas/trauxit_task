part of 'bloc.dart';

class WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  final WeatherModel data;

  WeatherSuccessState({required this.data});
}

class WeatherFailedState extends WeatherStates {}

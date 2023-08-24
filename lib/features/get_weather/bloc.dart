import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';

part 'events.dart';

part 'states.dart';

part 'model.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  final DioHelper dioHelper;
  final searchController = TextEditingController();
  var data;

  WeatherBloc(this.dioHelper) : super(WeatherStates()) {
    on<WeatherEvent>(_get);
  }

  void _get(WeatherEvent event, Emitter<WeatherStates> emit) async {
    emit(WeatherLoadingState());
    final response = await dioHelper.get(
      "http://api.weatherapi.com/v1/forecast.json?key=d6809a82e4674d0b998134853230702&q=${searchController.text}",
    );
    if (response.isSuccess) {
      final weatherData = WeatherModel.fromJson(response.response!.data);
      data = weatherData;
      emit(WeatherSuccessState(data: weatherData));
    } else {
      emit(WeatherFailedState());
    }
  }
}

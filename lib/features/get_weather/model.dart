part of 'bloc.dart';

class WeatherModel {
  late final WeatherData weatherData;
  late final Current current;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    weatherData = WeatherData.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }
}

class WeatherData {
  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;
  late final String tzId;
  late final int localtimeEpoch;
  late final String localtime;

  WeatherData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }
}

class Current {
  late final num tempC;
  late final double tempF;

  late final int cloud;

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    tempF = json['temp_f'];

    cloud = json['cloud'];
  }
}

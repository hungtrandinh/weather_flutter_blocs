import 'package:phuocan_weather/model/fivedaydata/fiveday_main.dart';
import 'package:phuocan_weather/model/fivedaydata/fiveday_speed.dart';
import 'package:phuocan_weather/model/fivedaydata/fiveday_weather.dart';

class FivedayData {
  final FivedayMain fivedayMain;
  final List<FivedayWeather> fivedayWeather;
  final FivedayWind fivedayWind;
  final String date;

  FivedayData(
      {required this.fivedayMain,
      required this.fivedayWeather,
      required this.fivedayWind,
      required this.date});
  factory FivedayData.fromJson(Map<String, dynamic> json) {
    return FivedayData(
        fivedayMain: FivedayMain.fromJson(json['main']),
        fivedayWeather: (json['weather'] as List)
            .map((e) => FivedayWeather.fromJson(e))
            .toList(),
        fivedayWind: FivedayWind.formJson(json['wind']),
        date: json['dt_txt']);
  }
}

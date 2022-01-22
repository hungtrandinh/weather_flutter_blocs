import 'package:phuocan_weather/model/todaydata/coord.dart';

import 'model.dart';

class TodayData {
  final Coord coord;
  final String cityname;
  final TodayMain todayMain;
  final List<TodayWeather> todayWeather;
  final TodayWind todayWind;

  TodayData(this.todayMain, this.todayWeather, this.todayWind, this.cityname,
      this.coord);
  TodayData.fromJson(Map<String, dynamic> json)
      : todayMain = TodayMain.fromjson(json['main']),
        todayWeather = (json["weather"] as List)
            .map((e) => TodayWeather.fromjson(e))
            .toList(),
        todayWind = TodayWind.fromJson(json['wind']),
        cityname = json['name'],
        coord = Coord.fromJson(json['coord']);
}

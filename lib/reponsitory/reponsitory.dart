import 'package:dio/dio.dart';
import 'package:phuocan_weather/model/fivedaydata/fiveday_data.dart';
import 'package:phuocan_weather/model/todaydata/today_data.dart';

class GetData {
  final Dio dio = Dio();
  static const String key = "4ee8f7dc04ed421eb8bbcaccc3441099";
  static const String query = "https://api.openweathermap.org/data/2.5/";
  static const String queryFiveday =
      "http://api.openweathermap.org/data/2.5/forecast?q=";
  Future<TodayData?> getTodayData({required String namecity}) async {
    final String url = "${query}weather?q=$namecity&appid=$key";
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return TodayData.fromJson(response.data);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<List<FivedayData>?> getFivedayData({required String cityname}) async {
    final String url = "$queryFiveday$cityname&appid=$key";

    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return (response.data['list'] as List)
            .map((e) => FivedayData.fromJson(e))
            .toList();
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

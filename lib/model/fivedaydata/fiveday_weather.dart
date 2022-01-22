import 'package:phuocan_weather/value/description.dart';

class FivedayWeather {
  final String main;
  final DescriptionWeather description;

  FivedayWeather(this.main, this.description);
  FivedayWeather.fromJson(Map<String, dynamic> json)
      : main = json['main'],
        description = mapStringtoWeather(json['description']);

  static DescriptionWeather mapStringtoWeather(String input) {
    DescriptionWeather state;
    switch (input) {
      case 'clear sky':
        state = DescriptionWeather.clearsky;
        break;
      case 'few clouds':
        state = DescriptionWeather.fewclouds;
        break;
      case 'scattered clouds':
        state = DescriptionWeather.scatteredclouds;
        break;
      case 'broken clouds':
        state = DescriptionWeather.brokenclouds;
        break;
      case 'shower rain':
        state = DescriptionWeather.showerrain;
        break;
      case 'rain':
        state = DescriptionWeather.rain;
        break;
      case 'thunderstorm':
        state = DescriptionWeather.thunderstorm;
        break;
      case 'snow':
        state = DescriptionWeather.snow;
        break;
      case "mist":
        state = DescriptionWeather.mist;
        break;
      case "overcast clouds":
        state = DescriptionWeather.overcastclouds;
        break;
      default:
        state = DescriptionWeather.unknow;
    }
    return state;
  }
}

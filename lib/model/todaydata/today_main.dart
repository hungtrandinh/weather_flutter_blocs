import 'package:equatable/equatable.dart';

class TodayMain {
  final Temprature temp;
  final double feelslike;
  final double tempmin;
  final double tempmax;
  final int pressure;
  final int humidity;

  TodayMain(
      {required this.temp,
      required this.feelslike,
      required this.tempmin,
      required this.tempmax,
      required this.pressure,
      required this.humidity});

  factory TodayMain.fromjson(Map<String, dynamic> json) {
    return TodayMain(
        temp: Temprature(temp: json['temp'].toDouble()),
        feelslike: json['feels_like'].toDouble(),
        tempmin: json['temp_min'].toDouble(),
        tempmax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"]);
  }

  TodayMain copyWith({
    final Temprature? temp,
    final double? feelslike,
    final double? tempmin,
    final double? tempmax,
    final int? pressure,
    final int? humidity,
  }) {
    return TodayMain(
        temp: temp ?? this.temp,
        feelslike: feelslike ?? this.feelslike,
        tempmin: tempmin ?? this.tempmin,
        tempmax: tempmax ?? this.tempmax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity);
  }
}

enum TemperatureUnits { fahrenheit, celsius }

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

class Temprature extends Equatable {
  final double temp;
  const Temprature({required this.temp});
  @override
  List<Object?> get props => [temp];
}

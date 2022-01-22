import 'package:equatable/equatable.dart';
import 'package:phuocan_weather/model/todaydata/model.dart';

class TodayState extends Equatable {
  final TodayMain? todayMain;
  final TodayData? todayData;
  final TodayStatus todayStatus;
  final TemperatureUnits temperatureUnits;

  const TodayState(
      {required this.todayMain,
      required this.temperatureUnits,
      required this.todayData,
      required this.todayStatus});
  @override
  List<Object?> get props => [todayStatus, todayData, temperatureUnits];
  factory TodayState.initial() {
    return const TodayState(
        todayMain: null,
        todayData: null,
        todayStatus: TodayStatus.initial,
        temperatureUnits: TemperatureUnits.celsius);
  }

  TodayState copyWith(
      {final TodayMain? todayMain,
      final TodayData? todayData,
      final TodayStatus? todayStatus,
      final TemperatureUnits? temperatureUnits}) {
    return TodayState(
        todayMain: todayMain ?? this.todayMain,
        temperatureUnits: temperatureUnits ?? this.temperatureUnits,
        todayData: todayData ?? this.todayData,
        todayStatus: todayStatus ?? this.todayStatus);
  }
}

enum TodayStatus { initial, loading, sucsses, erros }

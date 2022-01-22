import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:phuocan_weather/blocs/today_blocs/export.dart';
import 'package:phuocan_weather/model/todaydata/today_data.dart';
import 'package:phuocan_weather/model/todaydata/today_main.dart';

import 'package:phuocan_weather/reponsitory/reponsitory.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  final GetData getData;
  TodayBloc({required GetData getData})
      : getData = getData,
        super(TodayState.initial()) {
    on<TodayFetched>(getWeatherToday);
    on<SettingEvent>(setting);
  }
  Future<TodayData?> getWeatherToday(
      TodayFetched todayFetched, Emitter emit) async {
    try {
      final data = await getData.getTodayData(namecity: todayFetched.cityname);
      final unit = state.temperatureUnits;
      final value = unit.isCelsius
          ? data!.todayMain.temp.temp.toCelsius()
          : data!.todayMain.temp.temp;
      emit(state.copyWith(
          todayData: data,
          todayMain: data.todayMain.copyWith(temp: Temprature(temp: value)),
          temperatureUnits: unit,
          todayStatus: TodayStatus.sucsses));
    } catch (e) {
      emit(state.copyWith(todayStatus: TodayStatus.erros));
      emit(state.copyWith(todayStatus: TodayStatus.sucsses));
      // ignore: avoid_print
      print(e);
    }
  }

  void setting(SettingEvent settingEvent, Emitter emit) {
    final units = state.temperatureUnits.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    if (state.todayStatus == TodayStatus.sucsses) {
      emit(state.copyWith(temperatureUnits: units));
      return;
    }

    final weather = state.todayData;

    final temperature = weather!.todayMain.temp;
    final value = units.isCelsius
        ? temperature.temp.toCelsius()
        : temperature.temp.toFahrenheit();
    emit(
      state.copyWith(
        temperatureUnits: units,
        todayMain: state.todayMain!.copyWith(temp: Temprature(temp: value)),
      ),
    );
  }
}

extension on double {
  double toFahrenheit() => ((this * 9 / 5) + 32);
  double toCelsius() => ((this - 273.15));
}

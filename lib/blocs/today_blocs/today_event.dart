import 'package:equatable/equatable.dart';

abstract class TodayEvent extends Equatable {
  final String cityname;

  const TodayEvent(this.cityname);
  @override
  List<Object?> get props => [cityname];
}

class TodayFetched extends TodayEvent {
  const TodayFetched(String cityname) : super(cityname);
}

class SettingEvent extends TodayEvent {
  const SettingEvent() : super('');
}

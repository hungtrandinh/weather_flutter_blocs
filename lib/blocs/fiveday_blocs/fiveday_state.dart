import 'package:equatable/equatable.dart';
import 'package:phuocan_weather/model/fivedaydata/fiveday_data.dart';

class FiveDayState extends Equatable {
  final StatusFiveday statusFiveday;
  final List<FivedayData>? fivedayData;
  @override
  List<Object?> get props => [statusFiveday, fivedayData];

  factory FiveDayState.initial() {
    return const FiveDayState(
        statusFiveday: StatusFiveday.initial, fivedayData: null);
  }
  FiveDayState copyWith(
      {final StatusFiveday? statusFiveday,
      final List<FivedayData>? fivedayData}) {
    return FiveDayState(
        statusFiveday: statusFiveday ?? this.statusFiveday,
        fivedayData: fivedayData ?? this.fivedayData);
  }

  const FiveDayState({required this.statusFiveday, required this.fivedayData});
}

enum StatusFiveday { sussuc, errros, initial }

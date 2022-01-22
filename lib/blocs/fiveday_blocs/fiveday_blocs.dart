import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_event.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_state.dart';

import 'package:phuocan_weather/model/fivedaydata/fiveday_data.dart';
import 'package:phuocan_weather/reponsitory/reponsitory.dart';

class FiveDayBloc extends Bloc<FivedayEvent, FiveDayState> {
  final GetData getData;
  FiveDayBloc({required GetData getdat})
      : getData = getdat,
        super(FiveDayState.initial()) {
    on<FivedayFetch>(getdatafiveday);
  }

  Future<void> getdatafiveday(FivedayFetch fivedayFetch, Emitter emit) async {
    try {
      final fivedaydata =
          await getData.getFivedayData(cityname: fivedayFetch.cityname);
      emit(state.copyWith(
          fivedayData: fivedaydata, statusFiveday: StatusFiveday.sussuc));
    } catch (e) {
      print(e);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/app_blocs/app_event.dart';
import 'package:phuocan_weather/blocs/app_blocs/app_state.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(AppState.initial()) {
    on<LigtEvent>(regime);
  }
  void regime(LigtEvent event, Emitter emit) {
    if (state.light == Light.dark) {
      emit(state.copyWith(light: Light.light));
    }
    if (state.light == Light.light) {
      emit(state.copyWith(light: Light.dark));
    }
  }
}

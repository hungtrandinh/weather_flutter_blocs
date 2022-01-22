import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final Light light;
  const AppState({required this.light});

  factory AppState.initial() {
    return const AppState(light: Light.light);
  }
  AppState copyWith({final Light? light}) {
    return AppState(light: light ?? this.light);
  }

  @override
  List<Object?> get props => [light];
}

enum Light { light, dark }

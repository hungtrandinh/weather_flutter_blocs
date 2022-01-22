import 'package:equatable/equatable.dart';

abstract class FivedayEvent extends Equatable {
  final String cityname;

  const FivedayEvent(this.cityname);

  @override
  List<Object?> get props => [cityname];
}

class FivedayFetch extends FivedayEvent {
  const FivedayFetch(String cityname) : super(cityname);
}

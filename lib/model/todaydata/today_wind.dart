class TodayWind {
  final double speed;

  TodayWind({required this.speed});

  TodayWind.fromJson(Map<String, dynamic> json) : speed = json['speed'];
}

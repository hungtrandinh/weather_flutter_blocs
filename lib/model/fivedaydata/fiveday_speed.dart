class FivedayWind {
  final double speed;

  FivedayWind(this.speed);
  FivedayWind.formJson(Map<String, dynamic> json)
      : speed = json['speed'].toDouble();
}

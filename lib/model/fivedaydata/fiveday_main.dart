class FivedayMain {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  FivedayMain(this.temp, this.feels_like, this.temp_min, this.temp_max,
      this.pressure, this.humidity);
  FivedayMain.fromJson(Map<String, dynamic> json)
      : temp = json['temp'].toDouble(),
        feels_like = json['feels_like'].toDouble(),
        temp_min = json['temp_min'].toDouble(),
        temp_max = json['temp_max'].toDouble(),
        pressure = json['pressure'],
        humidity = json['humidity'];
}

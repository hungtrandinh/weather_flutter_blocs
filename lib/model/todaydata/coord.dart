class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});
  Coord.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lon = json['lon'];
}

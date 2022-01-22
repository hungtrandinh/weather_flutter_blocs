import 'package:flutter/material.dart';
import 'package:phuocan_weather/value/description.dart';

class DescriptionMapIcon extends StatelessWidget {
  final DescriptionWeather descriptionWeather;

  const DescriptionMapIcon({Key? key, required this.descriptionWeather})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _description(descriptionWeather);
  }

  Image _description(DescriptionWeather descriptionWeather) {
    Image image;
    switch (descriptionWeather) {
      case DescriptionWeather.clearsky:
        image = Image.asset(
          'assets/icons/sunny.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.brokenclouds:
        image = Image.asset(
          'assets/icons/mostly-cloudy.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.fewclouds:
        image = Image.asset(
          'assets/icons/clear-cloudy.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.mist:
        image = Image.asset(
          'assets/icons/foggy.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.rain:
        image = Image.asset(
          'assets/icons/drizzle.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.showerrain:
        image = Image.asset(
          'assets/icons/showers.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.scatteredclouds:
        image = Image.asset(
          'assets/icons/cloudy.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.thunderstorm:
        image = Image.asset(
          'assets/icons/thunderstroms.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.snow:
        image = Image.asset(
          'assets/icons/snow.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.unknow:
        image = Image.asset(
          'assets/icons/cold.png',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.overcastclouds:
        image = Image.asset(
          'assets/icons/mostly-cloudy.png',
          fit: BoxFit.fill,
        );
        break;
    }
    return image;
  }
}

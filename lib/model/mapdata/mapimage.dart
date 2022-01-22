import 'package:flutter/material.dart';
import 'package:phuocan_weather/value/description.dart';

class DescriptionMapImage extends StatelessWidget {
  final DescriptionWeather descriptionWeather;

  const DescriptionMapImage({Key? key, required this.descriptionWeather})
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
          'assets/image/hot.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.brokenclouds:
        image = Image.asset(
          'assets/image/cloud.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.fewclouds:
        image = Image.asset(
          'assets/image/fewclouds.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.mist:
        image = Image.asset(
          'assets/image/mist.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.rain:
        image = Image.asset(
          'assets/image/rain.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.showerrain:
        image = Image.asset(
          'assets/image/rain.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.scatteredclouds:
        image = Image.asset(
          'assets/image/cloud.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.thunderstorm:
        image = Image.asset(
          'assets/image/sam.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.snow:
        image = Image.asset(
          'assets/image/snow.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.unknow:
        image = Image.asset(
          'assets/image/fewclouds.jpg',
          fit: BoxFit.fill,
        );
        break;
      case DescriptionWeather.overcastclouds:
        image = Image.asset(
          'assets/image/fewclouds.jpg',
          fit: BoxFit.fill,
        );
        break;
    }
    return image;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phuocan_weather/model/mapdata/mapimage.dart';
import 'package:phuocan_weather/model/todaydata/today_data.dart';
import 'package:phuocan_weather/model/todaydata/today_main.dart';
import 'package:phuocan_weather/widget/cardweathertoday.dart';
import 'package:phuocan_weather/widget/seven_weather.dart';

class ViewToday extends StatelessWidget {
  final TodayData todayData;
  final TodayMain todayMain;

  const ViewToday({Key? key, required this.todayData, required this.todayMain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: DescriptionMapImage(
            descriptionWeather: todayData.todayWeather[0].description,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppBar(
                leading: BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Hero(
                tag: "card",
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CardWeatherToday(
                    todayData: todayData,
                    todayMain: todayMain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Text("Next ForeCast",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                  ],
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const SevenWeather())
            ],
          ),
        ),
      ],
    ));
  }
}

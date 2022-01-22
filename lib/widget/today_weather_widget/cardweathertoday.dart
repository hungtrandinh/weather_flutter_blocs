import 'package:flutter/material.dart';
import 'package:phuocan_weather/model/mapdata/mapimage_icon.dart';
import 'package:phuocan_weather/model/todaydata/today_data.dart';
import 'package:phuocan_weather/model/todaydata/today_main.dart';
import 'package:phuocan_weather/value/app_text_style.dart';
import 'package:intl/intl.dart';

class CardWeatherToday extends StatelessWidget {
  final TodayMain todayMain;
  final TodayData todayData;
  const CardWeatherToday(
      {Key? key, required this.todayData, required this.todayMain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  todayData.cityname.toUpperCase(),
                  style: AppTextStyle.namecitycolor,
                ),
              ),
              Text(
                DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black45,
                      fontSize: 16,
                      fontFamily: 'flutterfonts',
                    ),
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: DescriptionMapIcon(
                          descriptionWeather:
                              todayData.todayWeather[0].description,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        todayData.todayWeather[0].main,
                        style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${todayMain.temp.temp.toInt()} \u2103",
                          style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 45,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "min : ${(todayMain.tempmin - 273.15).toInt()}\u2103 / max : ${(todayMain.tempmax - 273.15).toInt()}\u2103",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.25,
        ));
  }
}

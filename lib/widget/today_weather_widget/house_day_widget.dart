import 'package:flutter/material.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_state.dart';
import 'package:phuocan_weather/model/mapdata/mapimage_icon.dart';
import 'package:phuocan_weather/widget/chart.dart';

class HousedayWidget extends StatelessWidget {
  final FiveDayState state;

  const HousedayWidget({Key? key, required this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: SizedBox(
                        height: 100,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: DescriptionMapIcon(
                                    descriptionWeather: state
                                        .fivedayData![index]
                                        .fivedayWeather[0]
                                        .description)),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " ${state.fivedayData![index].date.split(" ")[1].split(":")[0].replaceFirst(RegExp(r'0'), '')} h",
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "${(state.fivedayData![index].fivedayMain.temp - 273.15).toInt()}\u2103",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))
                                ])
                          ],
                        )));
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width * 0.9,
              child: LineChartSample5(fivedayData: state.fivedayData!)),
        )
      ],
    );
  }
}

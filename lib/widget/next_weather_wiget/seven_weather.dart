import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_blocs.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_state.dart';
import 'package:phuocan_weather/model/mapdata/mapimage_icon.dart';

class SevenWeather extends StatefulWidget {
  const SevenWeather({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SevenWeatherState();
  }
}

class SevenWeatherState extends State<SevenWeather> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiveDayBloc, FiveDayState>(builder: (context, state) {
      if (state.statusFiveday == StatusFiveday.initial) {
        return const CircularProgressIndicator();
      } else {
        return ListView.builder(
            itemCount: state.fivedayData!.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  color: Colors.white12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.fivedayData![index].date.split(" ")[0],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            Text(
                              state.fivedayData![index].date.split(" ")[1],
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${(state.fivedayData![index].fivedayMain.temp - 273.15).toInt()}  \u2103",
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: DescriptionMapIcon(
                              descriptionWeather: state.fivedayData![index]
                                  .fivedayWeather[0].description,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}

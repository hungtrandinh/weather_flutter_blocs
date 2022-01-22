import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_bloc.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_event.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_state.dart';
import 'package:phuocan_weather/model/mapdata/mapimage_icon.dart';
import 'package:phuocan_weather/reponsitory/reponsitory.dart';

class FiveCity extends StatelessWidget {
  final GetData _getData = GetData();

  FiveCity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: city.length,
        itemBuilder: (context, index) {
          return BlocProvider(
            create: (context) =>
                TodayBloc(getData: _getData)..add(TodayFetched(city[index])),
            child: BlocBuilder<TodayBloc, TodayState>(
              builder: (context, state) {
                return state.todayStatus == TodayStatus.sucsses
                    ? Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: SizedBox(
                          height: 150,
                          width: 180,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  city[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: DescriptionMapIcon(
                                          descriptionWeather: state.todayData!
                                              .todayWeather[0].description,
                                        )),
                                    Column(
                                      children: [
                                        Text(
                                          state.todayData!.todayWeather[0].main,
                                          style: const TextStyle(
                                              color: Colors.black45,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "${state.todayMain!.temp.temp.toInt()} \u2103",
                                            style: const TextStyle(
                                                color: Colors.black45,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Divider(),
                                    Text(
                                      "min : ${(state.todayMain!.tempmin - 273.15).toInt()}\u2103 / max : ${(state.todayMain!.tempmax - 273.15).toInt()}\u2103",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    ),
                                  ],
                                )
                              ]),
                        ))
                    : const CircularProgressIndicator();
              },
            ),
          );
        });
  }
}

const List city = ["Tokyo", "dub", "Dubai", "new york"];

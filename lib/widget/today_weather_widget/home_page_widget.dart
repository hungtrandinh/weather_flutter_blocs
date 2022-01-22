import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phuocan_weather/widget/char_humidity.dart';
import 'package:phuocan_weather/model/mapdata/mapimage.dart';
import 'package:phuocan_weather/model/todaydata/coord.dart';
import 'package:phuocan_weather/model/todaydata/model.dart';
import 'package:phuocan_weather/page/view_today_page.dart';
import 'package:phuocan_weather/reponsitory/reponsitory.dart';
import 'package:phuocan_weather/widget/cardweathertoday.dart';
import 'package:phuocan_weather/widget/char_wind.dart';
import 'package:phuocan_weather/widget/fivecity.dart';
import 'package:phuocan_weather/widget/house_day.dart';
import 'package:phuocan_weather/widget/seachwidget.dart';

import 'char_presssu.dart';

class HomePageWidget extends StatelessWidget {
  final GetData getData;
  final TodayData todayData;
  final TodayMain todayMain;
  final Coord coord;

  const HomePageWidget({
    Key? key,
    required this.todayData,
    required this.todayMain,
    required this.coord,
    required this.getData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: DescriptionMapImage(
                            descriptionWeather:
                                todayData.todayWeather[0].description,
                          ),
                        ),
                      ),
                      AppBar(
                        actions: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/setting');
                              },
                              icon: const Icon(Icons.settings))
                        ],
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu_rounded)),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SeachWidget(
                              coord: coord,
                            )),
                      ),
                    ]),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: "card",
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 1500),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 1000),
                                  pageBuilder:
                                      (context, animation, scondaryAnimation) {
                                    return ViewToday(
                                      todayData: todayData,
                                      todayMain: todayMain,
                                    );
                                  },
                                ),
                              );
                            },
                            child: CardWeatherToday(
                              todayMain: todayMain,
                              todayData: todayData,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                  child: Text(
                    "WEATHER IN 5 OTHER CITIES",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Spacer()
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: FiveCity(),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
              child: Row(
                children: const [
                  Text(
                    "TODAY",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "View report",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const HouseDay(),
            SizedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Barchar()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "Pressure",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                  Divider()
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/icons/pressure.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text("${todayData.todayMain.pressure} Pa",
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LineChartSample2()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "Humidity",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                  Divider()
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/icons/humidity.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text("${todayData.todayMain.humidity} \u2103",
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Barchar_wind()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "Wind",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                  Divider()
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/icons/wind.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text("${todayData.todayWind.speed} m/s",
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

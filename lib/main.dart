import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/app_blocs/app_blocs.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_blocs.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_event.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_bloc.dart';
import 'package:phuocan_weather/blocs/today_blocs/export.dart';
import 'package:phuocan_weather/page/home_page.dart';
import 'package:phuocan_weather/page/settting_page.dart';

import 'package:phuocan_weather/reponsitory/reponsitory.dart';

void main() {
  final GetData getdata = GetData();
  runApp(MyApp(getData: getdata));
}

class MyApp extends StatelessWidget {
  final GetData getData;

  const MyApp({Key? key, required this.getData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => FiveDayBloc(getdat: getData)
                ..add(const FivedayFetch("tokyo"))),
          BlocProvider(create: (context) => AppBlocs()),
          BlocProvider(create: (context) => TodayBloc(getData: getData)),
        ],
        child: MaterialApp(routes: {
          '/setting': (context) => Setting(getData: getData),
          '/': (context) => HomePage(getData: getData)
        }, initialRoute: '/'),
      ),
      create: (context) => GetData(),
    );
  }
}

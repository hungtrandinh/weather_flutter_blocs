import 'package:flutter/material.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_blocs.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_event.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_bloc.dart';
import 'package:phuocan_weather/blocs/today_blocs/export.dart';
import 'package:phuocan_weather/model/todaydata/coord.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class SeachWidget extends StatefulWidget {
  const SeachWidget({Key? key, required this.coord}) : super(key: key);
  final Coord coord;

  @override
  State<StatefulWidget> createState() {
    return SeachWidgetState(coord: coord);
  }
}

class SeachWidgetState extends State<SeachWidget> {
  final Coord coord;
  final textEditingController = TextEditingController();

  SeachWidgetState({required this.coord});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value) => {},
      autocorrect: false,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, bottom: 30),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10)),
          labelText: "Search...",
          fillColor: Colors.grey[200],
          suffix: IconButton(
            onPressed: () {
              context
                  .read<FiveDayBloc>()
                  .add(FivedayFetch(textEditingController.text));
              context
                  .read<TodayBloc>()
                  .add(TodayFetched(textEditingController.text));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )),
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

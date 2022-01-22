import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_blocs.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_state.dart';

import 'package:phuocan_weather/widget/house_day_widget.dart';

class HouseDay extends StatefulWidget {
  const HouseDay({Key? key}) : super(key: key);

  @override
  State<HouseDay> createState() => _HouseDayState();
}

class _HouseDayState extends State<HouseDay> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FiveDayBloc, FiveDayState>(
      builder: (context, state) {
        if (state.statusFiveday == StatusFiveday.initial) {
          return const CircularProgressIndicator();
        } else {
          return HousedayWidget(state: state);
        }
      },
      listener: (context, state) {
        if (state.statusFiveday == StatusFiveday.initial) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Lỗi cú pháp'),
                    content: const Text('Bạn Nhập Sai Tên Thành Phố!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ));
        }
      },
    );
  }
}

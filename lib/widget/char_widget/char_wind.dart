import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_blocs.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_state.dart';
import 'package:phuocan_weather/model/fivedaydata/fiveday_data.dart';

class _BarChart extends StatelessWidget {
  final List<FivedayData> fivedaydata;
  const _BarChart({Key? key, required this.fivedaydata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        alignment: BarChartAlignment.spaceAround,
        maxY: 12,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff7589a2),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 20,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Mn';
              case 1:
                return 'Te';
              case 2:
                return 'Wd';
              case 3:
                return 'Tu';
              case 4:
                return 'Fr';
              case 5:
                return 'St';
              case 6:
                return 'Sn';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                y: fivedaydata[0].fivedayWind.speed,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                y: fivedaydata[8].fivedayWind.speed,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                y: fivedaydata[16].fivedayWind.speed,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                y: fivedaydata[24].fivedayWind.speed,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                y: fivedaydata[32].fivedayWind.speed,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                y: fivedaydata[39].fivedayWind.speed,
                colors: [Colors.lightBlueAccent, Colors.greenAccent])
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  final List<FivedayData> fivedaydata;
  const BarChartSample3({Key? key, required this.fivedaydata})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample3State(fivedaydata);
}

class BarChartSample3State extends State<BarChartSample3> {
  final List<FivedayData> fivedaydata;

  BarChartSample3State(this.fivedaydata);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.5,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: _BarChart(
          fivedaydata: fivedaydata,
        ),
      ),
    );
  }
}

class Barchar_wind extends StatefulWidget {
  const Barchar_wind({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Barchar_windState();
  }
}

class Barchar_windState extends State<Barchar_wind> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiveDayBloc, FiveDayState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Color(0xff232d37),
        appBar: AppBar(
          title: const Text(
            "Pressure",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          elevation: 0,
          backgroundColor: const Color(0xff232d37),
        ),
        body: BarChartSample3(fivedaydata: state.fivedayData!),
      );
    });
  }
}

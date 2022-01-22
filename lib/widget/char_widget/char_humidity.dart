import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_blocs.dart';
import 'package:phuocan_weather/blocs/fiveday_blocs/fiveday_state.dart';
import 'package:phuocan_weather/model/fivedaydata/export.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiveDayBloc, FiveDayState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff232d37),
          appBar: AppBar(
            title: const Text(
              "Humidity",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
            elevation: 0,
            backgroundColor: Color(0xff232d37),
          ),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: 0.5,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        color: Color(0xff232d37)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 18.0, left: 12.0, top: 24, bottom: 12),
                      child: LineChart(mainData(state.fivedayData!)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  LineChartData mainData(List<FivedayData> fivedayData) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'TUE';
              case 3:
                return 'THUR';
              case 5:
                return 'SAT';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10%';
              case 30:
                return '30%';
              case 50:
                return '50%';
              case 80:
                return '80%';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, fivedayData[0].fivedayMain.humidity.toDouble()),
            FlSpot(1, fivedayData[6].fivedayMain.humidity.toDouble()),
            FlSpot(2, fivedayData[12].fivedayMain.humidity.toDouble()),
            FlSpot(3, fivedayData[18].fivedayMain.humidity.toDouble()),
            FlSpot(4, fivedayData[24].fivedayMain.humidity.toDouble()),
            FlSpot(5, fivedayData[30].fivedayMain.humidity.toDouble()),
            FlSpot(6, fivedayData[36].fivedayMain.humidity.toDouble()),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}

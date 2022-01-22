import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_bloc.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_event.dart';
import 'package:phuocan_weather/blocs/today_blocs/today_state.dart';
import 'package:phuocan_weather/page/webview.dart';
import 'package:phuocan_weather/reponsitory/reponsitory.dart';
import 'package:phuocan_weather/widget/home_page_widget.dart';

class HomePage extends StatefulWidget {
  final GetData getData;

  const HomePage({Key? key, required this.getData}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return HomePageState(getData: getData);
  }
}

class HomePageState extends State<HomePage> {
  final GetData getData;

  HomePageState({required this.getData});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodayBloc(getData: getData)..add(const TodayFetched("Hanoi")),
      child: Scaffold(
        body: BlocConsumer<TodayBloc, TodayState>(
          listener: (context, state) {
            if (state.todayStatus == TodayStatus.erros) {
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
            if (state.todayStatus == TodayStatus.erros) {}
          },
          builder: (context, state) {
            if (state.todayStatus == TodayStatus.sucsses ||
                state.todayStatus == TodayStatus.erros) {
              return HomePageWidget(
                getData: getData,
                todayMain: state.todayMain!,
                todayData: state.todayData!,
                coord: state.todayData!.coord,
              );
            } else {
              return const Center(
                child: LinearProgressIndicator(
                  minHeight: 1.5,
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                  )),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 1500),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1000),
                        pageBuilder: (context, animation, scondaryAnimation) {
                          return const WebViewExample();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.map)),
              label: 'Map',
            ),
          ],
        ),
      ),
    );
  }
}

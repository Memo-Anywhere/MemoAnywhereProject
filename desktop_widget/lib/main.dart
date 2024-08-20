import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:window_manager/window_manager.dart';
import 'calendar.dart';
import 'window_options.dart';

void main() async {
  // 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko', '');
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // 창 옵션 설정(window_options.dart로)
  await setupWindowOptions();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll(_events),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Calendar(),
      ),
    );
  }
}

DateTime get _now => DateTime.now();
List<CalendarEventData> _events = [
  CalendarEventData(
    date: _now.subtract(Duration(days: 2)),
    title: "일정은 전부",
    description: "1",
    color: Colors.purple,
    startTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        14),
    endTime: DateTime(
        _now.subtract(Duration(days: 2)).year,
        _now.subtract(Duration(days: 2)).month,
        _now.subtract(Duration(days: 2)).day,
        16),
  ),
  CalendarEventData(
    date: _now,
    title: "더미 데이터",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 10, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    date: _now,
    title: "API 완성시",
    color: Colors.red,
    description: "Go to football tournament.",
    startTime: DateTime(_now.year, _now.month, _now.day, 14),
    endTime: DateTime(_now.year, _now.month, _now.day, 17),
  ),
  CalendarEventData(
    date: _now.add(Duration(days: 1)),
    title: "받아서 수정",
    description: "Attend uncle's wedding anniversary.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18),
    endTime: DateTime(_now.year, _now.month, _now.day, 19),
  ),
];

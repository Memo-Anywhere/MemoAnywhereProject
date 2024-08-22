import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:window_manager/window_manager.dart';
import 'calendar.dart';
import 'window_options.dart';
import 'event_repository.dart';

void main() async {
  // dateFormat 사용 위한 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko', '');

  // 로딩 끝나기 전에 옵션 설정하는 거 방지
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
    EventRepository eventRepo = EventRepository();
    return CalendarControllerProvider(
      controller: EventController()..addAll(eventRepo.getEvents()), // 일정 추가
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Calendar(),
      ),
    );
  }
}


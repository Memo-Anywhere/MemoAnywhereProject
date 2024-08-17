import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'calendar.dart';
import 'window_options.dart'; // window_options.dart 파일을 임포트합니다.

void main() async {
  // 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // 창 옵션 설정
  await setupWindowOptions();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Calendar(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:memo_anywhere/calendar.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calender(),
    );
  }

}
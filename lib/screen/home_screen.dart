import 'package:flutter/material.dart';
import 'package:memo_anywhere/component/mobile_widget_calendar.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileWidgetCalendar(),
    );
  }
}
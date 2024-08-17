import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Spacer(
            flex: 3,
          ),
          MonthView(
            useAvailableVerticalSpace: true,
          ),
        ],
      ),
    );
  }
}

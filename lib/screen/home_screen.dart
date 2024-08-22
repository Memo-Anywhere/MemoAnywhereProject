import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          firstDay: DateTime.utc(1800, 1, 1),
          lastDay: DateTime.utc(3000, 1, 1),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronVisible: true,
            rightChevronVisible: true,
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue.shade200,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.blue.shade400,
              shape: BoxShape.circle,
            ),
            markersMaxCount: 3,
            markersAlignment: Alignment.bottomCenter,
            markersOffset: const PositionedOffset(bottom: 2.0),
            weekendTextStyle: TextStyle(color: Colors.red),
            defaultTextStyle: TextStyle(color: Colors.black),
            defaultDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            weekendDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            disabledTextStyle: TextStyle(color: Colors.grey),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.black),
            weekendStyle: TextStyle(color: Colors.red),
            dowTextFormatter: (date, locale) {
              switch (date.weekday) {
                case DateTime.sunday:
                  return '일';
                case DateTime.monday:
                  return '월';
                case DateTime.tuesday:
                  return '화';
                case DateTime.wednesday:
                  return '수';
                case DateTime.thursday:
                  return '목';
                case DateTime.friday:
                  return '금';
                case DateTime.saturday:
                  return '토';
              }
              return '';
            }
          ),
          
          startingDayOfWeek: StartingDayOfWeek.sunday,
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              if (day.weekday == DateTime.saturday) {
                return Center(
                  child: Text(
                    '토',
                    style: TextStyle(color: Colors.blue),
                  ),
                );
              } else if (day.weekday == DateTime.sunday) {
                return Center(
                  child: Text(
                    '일',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return null;
            },
            defaultBuilder: (context, day, focusedDay) {
              if (day.weekday == DateTime.saturday) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(color: Colors.blue),
                  ),
                );
              } else if (day.weekday == DateTime.sunday) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

}
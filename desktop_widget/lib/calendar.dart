import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MonthView(
        useAvailableVerticalSpace: true, // Avoid clipping
        onCellTap: (events, date) {
          _showDailySchedule(context, events, date);
        },
      ),
    );
  }

  // DateTime date를 2024-08-19 15:30:15.123456 형식에서 8.19(월) 형식으로 가공하는 함수
  String _formatDate(DateTime date) {
    String formattedDate = DateFormat('M.d').format(date);
    String weekday = DateFormat('E', 'ko').format(date);
    return "$formattedDate($weekday)";
  }

  void _showDailySchedule(BuildContext context,
      List<CalendarEventData<Object?>> events, DateTime date) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    String weekdayDate = _formatDate(date);

    showMenu(
      context: context,
      //문제있음, 고정 위치가 아니라 탭한 위치에 떠야 하지만 탭한 위치 알아낼 방법 못 찾음. GestureDetector 사용시 onCellTap과 겹쳐서 문제 생기고 onCellTap 안 쓰자니 events 전달 방법이 애매함.
      position: RelativeRect.fromLTRB(300, 300, 300, 300),
      items: [
        PopupMenuItem(
          child: Row(
            children: [Text('오늘의 일정'), Text(weekdayDate)],
          ),
        ),
        PopupMenuItem(
          child: Text(events[0].title),
          value: 'details',
        ),
        PopupMenuItem(
          child: Text("Add New Event"),
          value: 'add',
        ),
        PopupMenuItem(
          child: Text("Delete Event"),
          value: 'delete',
        ),
      ],
    ).then((value) {
      if (value != null) {
        switch (value) {
          case 'details':
            _showEventDetails(context, events);
            break;
          case 'add':
            _addNewEvent(context, date);
            break;
          case 'delete':
            _deleteEvent(context, events);
            break;
        }
      }
    });
  }

  void _showEventDetails(
      BuildContext context, List<CalendarEventData<Object?>> events) {
    // Show event details logic here
  }

  void _addNewEvent(BuildContext context, DateTime date) {
    // Add new event logic here
  }

  void _deleteEvent(
      BuildContext context, List<CalendarEventData<Object?>> events) {
    // Delete event logic here
  }
}

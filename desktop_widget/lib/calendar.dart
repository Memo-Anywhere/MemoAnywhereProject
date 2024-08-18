import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Offset? _tapPosition; // 터치 위치를 저장할 변수

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            _tapPosition = details.globalPosition;
            print(_tapPosition);
          });
        },
        child: MonthView(
          useAvailableVerticalSpace: true, // 화면 안 잘리게
          onCellTap: (events, date) {
            if (_tapPosition != null) {
              _showDailySchedule(context, events, date, _tapPosition!);
            }
          },
        ),
      ),
    );
  }

  void _showDailySchedule(BuildContext context,
      List<CalendarEventData<Object?>> events, DateTime date, Offset offset) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        MediaQuery.of(context).size.width - offset.dx,
        MediaQuery.of(context).size.height - offset.dy,
      ),
      items: [
        PopupMenuItem(
          child: Text("Event Details"),
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
        // 사용자가 선택한 메뉴 항목에 따라 동작 수행
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
    // 이벤트 상세 정보를 표시하는 로직 구현
  }

  void _addNewEvent(BuildContext context, DateTime date) {
    // 새로운 이벤트를 추가하는 로직 구현
  }

  void _deleteEvent(
      BuildContext context, List<CalendarEventData<Object?>> events) {
    // 이벤트를 삭제하는 로직 구현
  }
}

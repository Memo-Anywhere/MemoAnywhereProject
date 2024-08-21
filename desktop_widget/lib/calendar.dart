import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // DateTime date를 2024-08-19 15:30:15.123456 형식에서 8.19(월) 형식으로 가공하는 함수
  String _formatDate(DateTime date) {
    String formattedDate = DateFormat('M.d').format(date);
    String weekday = DateFormat('E', 'ko').format(date);
    return "$formattedDate($weekday)";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MonthView(
        useAvailableVerticalSpace: true, // 잘리는 거 방지
        onCellTap: (events, date, offset) { // 날짜 터치시 해당 날짜 일정 메뉴로 띄움
          _showDailyEvent(context, events, date, offset);
        },
      ),
    );
  }

  void _showDailyEvent(BuildContext context,
      List<CalendarEventData<Object?>> events, DateTime date, Offset offset) {

    // // 화면 안에 메뉴 띄우기 위해 오버레이 정보 가져옴
    // final RenderBox overlay =
    //     Overlay.of(context).context.findRenderObject() as RenderBox;

    // 메뉴 띄울 화면 내부 위치 계산
    final RelativeRect position = RelativeRect.fromLTRB(
      offset.dx,
      offset.dy,
      MediaQuery.of(context).size.width - offset.dx,
      MediaQuery.of(context).size.height - offset.dy,
    );

    String weekdayDate = _formatDate(date);

//TODO : 마진 손봐서 메뉴 상단 색 바꾸기, 메뉴 내부 내용 수정, 및 디자인 고치기

    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
      padding: EdgeInsets.zero, // 간격 제거
      child: Container(
        width: double.infinity, // 전체 너비 차지
        decoration: BoxDecoration(
          color: Colors.blueGrey, // Topbar 배경색
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)), // 위쪽 테두리 둥글게
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  weekdayDate + ' 일정',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.add_outlined, color: Colors.white),
                  onPressed: () {
                    // 일정 추가 메뉴
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
        PopupMenuItem(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(weekdayDate + ' 일정'),
                  ), // 8.20(화) 일정
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.add_outlined),
                    onPressed: () {
                      // 일정 추가 메뉴
                    },
                  ),
                )
              ],
            ),
          ),

         // CalendarEventData 리스트를 순회하며 PopupMenuItem 생성
    ...events.map((event) => PopupMenuItem(
      child: Text(event.title),
      value: event.title,
    )),  

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

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class EventRepository {
  DateTime getNow() => DateTime.now();   // 생성자에서 인스턴스 멤버를 쓸 수 없는데 _now를 쓰기 위한 조치
  List<CalendarEventData> getEvents() => List.unmodifiable(_events);   // 이벤트 리스트를 반환
  late final List<CalendarEventData> _events; // 일정, API 생성시 하드코딩 수정

  EventRepository() {
    DateTime _now = getNow();

    _events = [
      CalendarEventData(
        date: _now.subtract(const Duration(days: 2)),
        title: "일정은 전부",
        description: "1",
        color: Colors.purple,
        startTime: DateTime(
          _now.subtract(const Duration(days: 2)).year,
          _now.subtract(const Duration(days: 2)).month,
          _now.subtract(const Duration(days: 2)).day,
          14,
        ),
        endTime: DateTime(
          _now.subtract(const Duration(days: 2)).year,
          _now.subtract(const Duration(days: 2)).month,
          _now.subtract(const Duration(days: 2)).day,
          16,
        ),
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
        date: _now.add(const Duration(days: 1)),
        title: "받아서 수정",
        description: "Attend uncle's wedding anniversary.",
        startTime: DateTime(_now.year, _now.month, _now.day, 18),
        endTime: DateTime(_now.year, _now.month, _now.day, 19),
      ),
    ];
  }
}

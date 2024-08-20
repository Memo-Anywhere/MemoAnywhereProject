## 소개
제가 수정한 패키지 파일들을 저장해둔 폴더입니다!

## 구성사항
### flutter_calendar_view-master
- 원본 패키지 : [calendar view](https://pub.dev/packages/calendar_view)  
- 변경사항 : `Month View`의 `onCellTap`이 원래는 좌표값을 전달하지 않는데 전달하게 변경.  
- 세부 변경 사항 : 

1. `lib\src\typedefs.dart`
    ```dart
    typedef CellTapCallbackExtended<T extends Object?> = void Function(
        List<CalendarEventData<T>> events, DateTime date, Offset offset);
    ```
    `CellTapCallbackExtended`라는 새로운 콜백 추가. 기존의 `CellTapCallback`에 `Offset offset`이라는 인자 하나만 추가함.

2. `lib\src\month_view\month_view.dart`  

    온갖 onCellTap 관련 부분에서 콜백 타입을 수정해줌.  

    `class MonthView<T extends Object?>`에서, 
    ```dart
    final CellTapCallbackExtended<T>? onCellTap;
    ```

    `class _MonthPageBuilder<T> `에서도.
    ```dart
    final CellTapCallbackExtended<T>? onCellTap;
    ```

    이후 하단의 `build`에서 실제 전달값 수정.
    ```dart
    return GestureDetector(
                onTapDown: (details) => onCellTap?.call(
                    events, monthDays[index], details.globalPosition),
    ```
import 'package:flutter/material.dart';

class MobileWidgetCalendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 328,
        height: 403,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x66000000),
              blurRadius: 20,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
      ),
    );
  }

}
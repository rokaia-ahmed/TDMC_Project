import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/utils/app_size.dart';

class BuildRangeCell extends StatelessWidget {
  const BuildRangeCell({super.key,
    required this.day,
    required this.color,
    required this.start,
    required this.end});

    final  DateTime day ;
    final  Color color ;
    final  DateTime start;
    final  DateTime end;
  @override
  Widget build(BuildContext context) {
    bool isStart = isSameDay(day, start);
    bool isEnd = isSameDay(day, end);
    return Container(
      height: AppSize.getVerticalSize(30),
      margin: AppSize.margin(bottom: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        borderRadius: BorderRadius.horizontal(
          left: isStart ? Radius.circular(15) : Radius.zero,
          right: isEnd ? Radius.circular(15) : Radius.zero,
        ),
      ),
      // margin: EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          '${day.day}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

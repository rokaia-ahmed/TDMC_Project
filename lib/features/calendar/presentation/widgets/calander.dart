import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/data/models/workshops_model.dart';
import '../../../home/logic/home_cubit.dart';
import 'build_range_cell.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    _selectedDay = _focusedDay;
    HomeCubit.get(context).searchWorkshopsByDate(_selectedDay!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
  builder: (context, state) {
    var cubit =HomeCubit.get(context);
    return TableCalendar(
      rowHeight:40 ,
      focusedDay: _focusedDay,
      firstDay: DateTime(2023, 1, 1),
      lastDay: DateTime(2030, 12, 30),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            cubit.searchWorkshopsByDate(_selectedDay!);
          });
        }
      },
      onPageChanged:(focusedDay){
        _focusedDay = focusedDay ;
      },

      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, _) {
          if(cubit.workShopsModel?.completedWorkshops.isNotEmpty??false){
            for(Result  d  in cubit.workShopsModel!.completedWorkshops){
              final start=DateFormat("yyyy-MM-dd").parse(d.fromDate!);
              final end=DateFormat("yyyy-MM-dd").parse(d.toDate!);
              // day.isAfter(start.subtract(Duration(days: 1))) && day.isBefore(end.add(Duration(days: 1)))
              if ((day.isAfter(start) && day.isBefore(end.add(Duration(days: 1))))) {
                return BuildRangeCell(
                  day: day,
                  color: AppColors.gryTextColor3,
                  start: start,
                  end: end,);
              }
            }
          }
          if(cubit.workShopsModel?.enrolledWorkshops.isNotEmpty??false){
            for(Result  d  in cubit.workShopsModel!.enrolledWorkshops){
              final start=DateFormat("yyyy-MM-dd").parse(d.fromDate!);
              final end=DateFormat("yyyy-MM-dd").parse(d.toDate!);
              if ((day.isAfter(start) && day.isBefore(end.add(Duration(days: 1))))) {
                return BuildRangeCell(
                  day: day,
                  color: AppColors.blue,
                  start: start,
                  end: end,);
              }
            }
          }

          if(cubit.workShopsModel?.upcomingWorkshops.isNotEmpty??false){
            for(Result  d  in cubit.workShopsModel!.upcomingWorkshops){
              final start=DateFormat("yyyy-MM-dd").parse(d.fromDate!);
              final end=DateFormat("yyyy-MM-dd").parse(d.toDate!);
              if ((day.isAfter(start) && day.isBefore(end.add(Duration(days: 1))))) {
                BuildRangeCell(
                  day: day,
                  color: AppColors.lightGreen,
                  start: start,
                  end: end,);
              }
            }
          }

          return null ;
        },
      ),
      daysOfWeekHeight:50,
      weekendDays: [],
      //headerVisible:false ,

      startingDayOfWeek:StartingDayOfWeek.monday ,
      daysOfWeekStyle:DaysOfWeekStyle(
        weekdayStyle:Styles.textStyle16w600.copyWith(
          color: AppColors.gryTextColor4,
        ),
        dowTextFormatter: (date, locale) {
          return DateFormat.E(locale).format(date).toUpperCase();
        },
      ) ,
      calendarStyle: CalendarStyle(
        cellPadding: EdgeInsets.zero,
        cellMargin:EdgeInsets.zero ,
        isTodayHighlighted: false,
        defaultTextStyle:Styles.textStyle14w400.copyWith(
          color:AppColors.gryTextColor5,
        ) ,
        outsideTextStyle: Styles.textStyle14w400.copyWith(
          color:AppColors.lightGry,
        ),

        selectedDecoration: BoxDecoration(
          color: AppColors.secondColor,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        headerMargin:EdgeInsets.only(left:2,bottom: 0),
        headerPadding:EdgeInsets.zero ,
        titleCentered: false,
        titleTextStyle:Styles.textStyle16w600,
        titleTextFormatter: (date, locale) =>
        '${_getMonthName(date.month)} - ${date.year}', // Customize the title
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
    );
  },
);
  }
  String _getMonthName(int month) {
    List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }
}

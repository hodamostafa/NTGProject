import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/screens/calendar-screen/request-details-screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/helper-widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime nowDate = DateTime.now();

  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  String get monthName => DateFormat(
        'MMMM',
        context.locale.languageCode,
      ).format(_rangeStart ?? DateTime.now());

  String get year => DateFormat(
        'yyyy',
        context.locale.languageCode,
      ).format(_rangeStart ?? DateTime.now());

  /// Leave days excluding Friday & Saturday
  int get leaveDays {
    if (_rangeStart == null) return 0;

    final start = _rangeStart!;
    final end = _rangeEnd ?? _rangeStart!;

    int count = 0;

    for (DateTime day = start;
        !day.isAfter(end);
        day = day.add(const Duration(days: 1))) {
      if (day.weekday != DateTime.friday && day.weekday != DateTime.saturday) {
        count++;
      }
    }

    return count;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7F6),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 375.h,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      infoRow("employee_name", "Zaid Zaid Bin Zaid"),
                      infoRow("job_title", "Department Manager"),
                      infoRow("employee_id", "************"),
                      infoRow("leave_balance", "##"),
                      infoRow("leave_type", "annual"),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text(
                    "select_leave_date".tr(),
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: selectorBox(year)),
                    SizedBox(width: 20.w),
                    Expanded(child: selectorBox(monthName)),
                  ],
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "leave_range".tr(),
                    style: TextStyle(
                      fontSize: 33.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    _rangeStart == null
                        ? "select_range".tr()
                        : "${DateFormat(
                            'dd MMM yyyy',
                            context.locale.languageCode,
                          ).format(_rangeStart!)}  -  ${DateFormat(
                            'dd MMM yyyy',
                            context.locale.languageCode,
                          ).format(_rangeEnd ?? _rangeStart!)}",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Color(0xFF666666),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 8.h),
                if (_rangeStart != null)
                  Center(
                    child: Text(
                      "total_working_days".tr(args: [leaveDays.toString()]),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF666666)),
                    ),
                  ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:42.w),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: TableCalendar(
                        locale: context.locale.languageCode,
                        firstDay: DateTime(nowDate.year),
                        lastDay: DateTime(2100),
                        focusedDay: _focusedDay,
                        rangeSelectionMode: _rangeSelectionMode,
                        rangeStartDay: _rangeStart,
                        rangeEndDay: _rangeEnd,
                        enabledDayPredicate: (day) {
                          if (day.weekday == DateTime.friday ||
                              day.weekday == DateTime.saturday) {
                            return false;
                          }
                          return true;
                        },
                        onRangeSelected: (start, end, focusedDay) {
                          setState(() {
                            _focusedDay = focusedDay;
                            _rangeStart = start;
                            _rangeEnd = end;
                          });
                        },
                        calendarStyle: CalendarStyle(
                          disabledTextStyle: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                          rangeHighlightColor:
                              const Color(0xff275D33).withOpacity(.2),
                          rangeStartDecoration: const BoxDecoration(
                            color: Color(0xff275D33),
                            shape: BoxShape.rectangle,
                          ),
                          rangeEndDecoration: const BoxDecoration(
                            color: Color(0xff275D33),
                            shape: BoxShape.rectangle,
                          ),
                          todayDecoration: const BoxDecoration(
                            color: Color(0xff275D33),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding:  EdgeInsets.only(right:42.w ),
                  child: SizedBox(
                    width: 358.w,
                    height: 78.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff275D33),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        if(leaveDays == 0) return;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RequestScreen(
                                      startDate: DateFormat(
                                        'dd MMM yyyy',
                                        context.locale.languageCode,
                                      ).format(_rangeStart!),
                                      endDate: DateFormat(
                                        'dd MMM yyyy',
                                        context.locale.languageCode,
                                      ).format(_rangeEnd ?? _rangeStart!),
                                      leaveDays: leaveDays,
                                    )));
                      },
                      child: Text(
                        "select".tr(),
                        style: TextStyle(
                          fontSize: 40.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

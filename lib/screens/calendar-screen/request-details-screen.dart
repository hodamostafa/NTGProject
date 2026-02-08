import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/helper-widget.dart';

class RequestScreen extends StatefulWidget {
  String startDate;
  String endDate;
  int leaveDays;
   RequestScreen({super.key, required this.startDate, required this.endDate, required this.leaveDays});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
                    height: 150.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text("request_details".tr(),
                      style: TextStyle(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 581.h,
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
                      infoRow("start_date",widget.startDate),
                      infoRow("end_date", widget.endDate),
                      infoRow("total_days", widget.leaveDays.toString()),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: SizedBox(
                    width: 955.w,
                    height: 100.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff275D33),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "confirm".tr(),
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

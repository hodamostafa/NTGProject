import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget infoRow(String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title.tr(), style: TextStyle(fontSize: 36.sp,color:Color(0xFF5C5C5C),)),
        Text(value.tr(),
            style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold,color: Color(0xFF313131),)),
      ],
    ),
  );
}

Widget selectorBox(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: Color(0xFFE6E6E6),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 33.sp,
          fontWeight: FontWeight.bold,
          color: Color(0xFF454444),
        ),
      ),
    ),
  );
}
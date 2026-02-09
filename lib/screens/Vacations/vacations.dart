import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/constants_colors.dart';

class Vacations extends StatelessWidget {
  const Vacations({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svg/Frame.svg',
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/svg/Frame1.svg",
                width: 1.sw,
                height: 300.h,
                fit: BoxFit.cover,
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 254.w,
                      height: 177.h,
                    ),
                  ),
                  SizedBox(height: 85.h),
                  Container(
                    color: Colors.white,
                    width: 1.sw,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 64.h,vertical: 16.w),
                      child: Column(
                        children:  [
                          InfoRow(title: 'employee_name'.tr(), value: 'زيد زيد زيد زيد'),
                          InfoRow(title: 'job_title'.tr(), value: 'مدير إدارة'),
                          InfoRow(title: 'employee_num'.tr(), value: '*************'),
                          InfoRow(title: 'leave_balance'.tr(), value: '##'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 143.h),
                  Text(
                    'choose_leave_type'.tr(),
                    style: TextStyle(
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 55.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 16.h),
                    child: SizedBox(
                      height: 116.h,
                      child: TextFormField(
                        style: TextStyle(fontSize: 40.sp),
                        decoration: InputDecoration(
                          hintText: 'search'.tr(),
                          hintStyle:
                          TextStyle(fontSize: 40.sp, color: Colors.black),
                          suffixIcon: Icon(Icons.search, size: 52.sp),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 2.w),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.w, vertical: 16.h),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 93.h),

                  /// grid + arrows
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: Row(
                      children: [
                        Container(
                          width: 97.w,
                          height: 118.h,
                          color: mainColor,
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),

                        SizedBox(width: 28.w),

                        Expanded(
                          child: GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 64.w,
                              mainAxisSpacing: 64.h,
                              childAspectRatio: 1,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: mainColor),
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    'إجازة صحية',
                                    style: TextStyle(
                                      fontSize: 32.sp,
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(width: 28.w),

                        Container(
                          width: 97.w,
                          height: 118.h,
                          color: mainColor,
                          child: const Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 193.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: SizedBox(
                        width: 444.w,
                        height: 100.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              side: BorderSide(color: mainColor, width: 1.w),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'return'.tr(),
                                style: TextStyle(
                                    fontSize: 40.sp,
                                    color: mainColor,
                                    fontFamily: 'Roboto'),
                              ),
                              SizedBox(width: 16.w),
                              SvgPicture.asset(
                                'assets/svg/lets-icons_back.svg',
                                width: 61.w,
                                height: 61.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 80.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 36.sp, color: Color(0xFF5C5C5C)),
          ),
          Text(value, style: TextStyle(fontSize: 36.sp)),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/screens/Vacations/vacations.dart';
import '../../utils/constants_colors.dart';
import 'employee_search.dart';

class Employees extends StatelessWidget {
  const Employees({super.key});

  @override
  Widget build(BuildContext context) {
    bool isClicked = false;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/Frame.svg',width: 1.sw,fit: BoxFit.cover,)),
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset("assets/svg/Frame1.svg",width: 1.sw,height: 300.h,fit: BoxFit.cover,)),

            Positioned(
              top: 25.h,left: 410.5.w,right: 410.5.w,
                child: Image.asset('assets/images/logo.png',width: 254.w, height: 177.h,)),
            Positioned.fill(
              top: 393.h,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 12.h,bottom: 58.h,left: 197.w,right: 197.w),
                    child: Text('please_select_employee'.tr(),style: TextStyle(fontSize: 48.sp,fontFamily: 'Roboto'),),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(left: 64.w, right: 64.w,bottom: 69.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 94.w,
                        mainAxisSpacing: 70.h,
                        childAspectRatio: 429 / 344,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.black),
                            ),
                            padding:  EdgeInsets.only(top: 40.h,bottom: 40.h,left: 16.w,right: 16.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/Profile.svg',width: 120.w,height: 120.h,),
                                Text('أسم الموظف', style: TextStyle(fontSize: 40.sp),),
                                Text('المسمى الوظيفى',style: TextStyle(fontSize: 40.sp,color: Color(0xFF797373)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Vacations()));
                          },
                        );
                      },

                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: 61.5.h , right: 61.5.h,bottom: 72.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 134.w,
                            height: 97.h,
                            child: ElevatedButton(
                                onPressed: () {
                                  isClicked ? true : false ;
                                },

                                style: ElevatedButton.styleFrom(
                                // fixedSize: Size(100.w, 100.w),
                                backgroundColor: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.r),
                                ),
                              ),
                              child: SvgPicture.asset('assets/svg/ic_baseline-search.svg')
                            )),

                        SizedBox(
                            width: 444.w,
                            height: 100.h,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                // fixedSize: Size(100.w, 100.w),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  side: BorderSide(
                                    color:mainColor,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [

                                  Text(
                                    'return'.tr(),
                                    style: TextStyle(
                                        fontSize: 60.sp,
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto'),
                                  ),
                                   SizedBox(width: 16.w,),
                                  SvgPicture.asset('assets/svg/lets-icons_back.svg',width: 46.8.w,height: 37.38.h,),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),

    );
  }
}




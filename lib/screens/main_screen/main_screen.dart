import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/base/base_scaffold.dart';
import 'package:project/utils/constants_colors.dart';

import '../employees/employees.dart';

class FirstScreen extends ConsumerStatefulWidget {
  const FirstScreen({super.key});
  @override
  ConsumerState<FirstScreen> createState() => _firstState();
}

class _firstState extends ConsumerState<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                firstColor,
                mainColor,
                secondColor,
                thirdColor,
              ])),
          child: Padding(
            padding:  EdgeInsets.only(left: 140.w,right: 140.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 390.w,
                    height: 271.h,
                  ),
                ),
                 SizedBox(
                  height: 224.74.h,
                ),

                Container(
                    width: 824.w,
                    height: 317.h,
                    child: Text(
                      "welcome_sentence".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 63.65.sp, color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),
                    )),
                SizedBox(
                  height: 156.26.h,
                ),

                SizedBox(
                    width: 800.w,
                    height: 200.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Employees()));
                      },
                      style: ElevatedButton.styleFrom(
                        // fixedSize: Size(100.w, 100.w),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.r),
                          side: BorderSide(
                            color:mainColor,
                            width: 1.w,
                          ),
                        ),
                      ),
                      child: Text(
                        'leaves'.tr(),
                        style: TextStyle(
                            fontSize: 60.sp,
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/base/base_scaffold.dart';

class firstScreen extends ConsumerStatefulWidget {
  const firstScreen({super.key});
  @override
  ConsumerState<firstScreen> createState() => _firstState();
}
class _firstState extends ConsumerState<firstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(
              child: Image.asset('assets/images/logo.png',
              width: 600.w,
              height: 600.h,),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 500.w,
                height: 70.h,
                child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100.w, 100.w),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(
                        color: Colors.green,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Text('leaves'.tr(),
                    style: TextStyle(fontSize: 40.sp,color: Colors.green[900],fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),))

          ],
        ),
    );
  }
}
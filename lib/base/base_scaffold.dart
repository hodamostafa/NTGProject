import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/utils/dialog.dart';
import 'base_state_provider.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({
    required this.body,
    required this.viewModel,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.extend = false,
    this.showBottomBar = false,
    this.onSearchPressed,
    this.onReturnPressed,
    Key? key,
  }) : super(key: key);

  final Widget body;
  final BaseStateProvider viewModel;
  final PreferredSizeWidget? appBar;
  final bool extend;
  final Drawer? drawer;
  final Drawer? endDrawer;

  final bool showBottomBar;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onReturnPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffold();
}

class _BaseScaffold extends ConsumerState<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    ref.listen(widget.viewModel, (previous, next) {
      if (previous?.isLoading != true && next.isLoading == true) {
        if (!EasyLoading.isShow) EasyLoading.show();
      }
      if (previous?.isLoading == true && next.isLoading != true) {
        if (EasyLoading.isShow) EasyLoading.dismiss();
      }
      if (next.hasError) showError(next.error!);
    });

    return Scaffold(
      extendBodyBehindAppBar: widget.extend,
      appBar: widget.appBar,
      drawer: widget.drawer,
      body: widget.body,
      endDrawer: widget.endDrawer,
      backgroundColor: Colors.white,

      bottomNavigationBar:
      widget.showBottomBar ? _buildBottomBar(context) : null,
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final mainColor = Theme.of(context).primaryColor;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            SizedBox(
              width: 29.15.w,
              height: 29.15.h,
              child: ElevatedButton(
                onPressed: widget.onSearchPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ),


            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 59.w),
                child: SizedBox(
                    width: 444.w,
                    height: 100.h,
                    child: ElevatedButton(
                      onPressed: () {},
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

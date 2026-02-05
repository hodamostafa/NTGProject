import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    Key? key,
  }) : super(key: key);

  final Widget body;
  final BaseStateProvider viewModel;
  final PreferredSizeWidget? appBar;
  final bool extend;
  final Drawer? drawer;
  final Drawer? endDrawer;

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
      backgroundColor:Colors.white
    );
  }
}

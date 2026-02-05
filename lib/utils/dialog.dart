import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base/base_state.dart';
import '../base/error_dialog.dart';
import '../base/loading_dialog.dart';

extension Dialogs on ConsumerState {
  void showLoading() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const LoadingDialog();
      },
    );
  }

  void showError(BaseError error) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ErrorDialog(
          error: error,
        );
      },
    );
  }
}


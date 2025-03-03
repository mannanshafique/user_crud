import 'package:flutter/material.dart';
import 'package:user_crud/utils/app_colors.dart';
import 'package:user_crud/utils/constant.dart';

class AppDialogs {
  static void showToast({String? message}) {
    final snackBar = SnackBar(
      content: Text(message ?? ""),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(Constants.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }

  static void progressAlertDialog({required BuildContext context}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.white,
              color: AppColors.darkBlue,
            ),
          );
        });
  }
}

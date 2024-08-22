import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import '../app_constants.dart';
import '../styles.dart';


enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = AppColors.primaryColor.withOpacity(0.8);
      break;
    case ToastStates.error:
      color = Colors.pink.withOpacity(0.6);
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

class AppDialogs {
  static void toast({required String msg, required ToastStates state}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      timeInSecForIosWeb: 7,
      backgroundColor: chooseToastColor(state),
      fontSize: 16.0,
    );
  }

  static Widget customDialog(
    context,{
    required String title,
    required String buttonTitle,
    bool isAnotherButton = false,
    Function()? onTap,
    Function()? onTapButton,
    bool? loading,
  }) {
   return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      shape: AppConstants.dialogShape,
      titlePadding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Styles.textStyle16w400,
      ),
      iconPadding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
      icon: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Align(
          alignment: Alignment.topLeft,
          child: Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ),
      actions: const [
      ],
    );
  }
}

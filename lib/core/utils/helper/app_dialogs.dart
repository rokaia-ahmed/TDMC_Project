import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tdmc_project/core/utils/app_colors.dart';
import 'package:tdmc_project/core/utils/app_navigation.dart';
import 'package:tdmc_project/core/utils/app_size.dart';
import 'package:tdmc_project/core/widgets/custom_buttons.dart';
import 'package:tdmc_project/features/layout/presentation/screens/layout_screen.dart';
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
    Function()? onTap,
    bool? loading,
  }) {
   return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      shape: AppConstants.dialogShape,
      actionsPadding:EdgeInsets.fromLTRB(60, 0,60, 20) ,
      titlePadding: const EdgeInsets.fromLTRB(30, 0, 20,10),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Styles.textStyle18w600,
      ),
      iconPadding: const EdgeInsets.fromLTRB(15, 15, 20, 10),
      icon: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Align(
          alignment: Alignment.topLeft,
          child: Icon(
            Icons.close,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      actions:  [
        CustomDefaultButton(
            width: AppSize.getHorizontalSize(30),
            height:AppSize.getVerticalSize(40) ,
            onTap: (){
              AppNavigator.pushAndRemove(
                  screen: LayoutScreen(),
                  context: context);
            },
            text: 'assignments.back'.tr()),
      ],
    );
  }
}

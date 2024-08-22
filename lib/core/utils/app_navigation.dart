import 'package:flutter/material.dart';

class AppNavigator {
  /// NAVIGATOR PUSH
  static Future push({
    rebuild = true,
    required Widget screen,
    required BuildContext context,
  }) async {
    await Navigator.push(
      context,
    MaterialPageRoute(builder: (context)=>screen,),
    );
  }

  /// NAVIGATOR PUSH SIDE
  static Future replace({
    required Widget screen,
    required BuildContext context,
  }) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=>screen,),
    );
  }

  /// NAVIGATOR PUSH AND REMOVE
  static Future pushAndRemove({
    required Widget screen,
    required BuildContext context,
  }) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=>screen,),
      (route) => false,
    );
  }
}

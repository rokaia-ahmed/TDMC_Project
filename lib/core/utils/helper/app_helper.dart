import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelper {
  /// CLOSE KEYBOARD
  static Future closeKeyboard() async {
    /// CLOSE KEYBOARD
    FocusManager.instance.primaryFocus?.unfocus();
  }
  /*/// FORMAT TIME
  static String formatTime(TimeOfDay time ){
    final now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(DateTime(
        now.year, now.month, now.day, time.hour, time.minute));
    return formattedTime ;
  }*/
    /// URL LAUNCHER
  static void launchURL(String url) async {
    Uri uRl = Uri.parse(url);
    if (!await launchUrl(uRl,
      mode: LaunchMode.externalApplication,)) {
      throw ' can\'t launch the URL.$uRl';
    }
  }

}

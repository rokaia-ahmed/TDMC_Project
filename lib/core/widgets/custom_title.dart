import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomTitle extends StatelessWidget {
   const CustomTitle({super.key, required this.text,
     this.color, this.height});
  final String text ;
  final Color? color ;
  final double? height ;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: Styles.textStyle16w400.copyWith(
        height: height,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}

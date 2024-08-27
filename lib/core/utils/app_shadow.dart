import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  static List<BoxShadow> custom =  <BoxShadow>[
    BoxShadow(blurRadius: 12,
        color: AppColors.borderColor.withOpacity(0.7),
        spreadRadius: 0,
        offset: Offset(0, 4),
    ),
  ];

  static List<BoxShadow> custom1 = const <BoxShadow>[
    BoxShadow(blurRadius: 4.0, color: AppColors.shadowColor,
        offset: Offset(1.0, 2.0),
    ),
  ];
}

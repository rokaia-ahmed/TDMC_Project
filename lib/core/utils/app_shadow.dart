import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  static List<BoxShadow> custom = const <BoxShadow>[
    BoxShadow(blurRadius: 4.0, color: Colors.black12, offset: Offset(1.0, 4.0)),
  ];

  static List<BoxShadow> custom1 = const <BoxShadow>[
    BoxShadow(blurRadius: 4.0, color: AppColors.shadowColor,
        offset: Offset(1.0, 2.0),
    ),
  ];
}

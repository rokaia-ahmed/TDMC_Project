import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class HomeFilterRow extends StatelessWidget {
  const HomeFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Workshops',
          style: Styles.textStyle24w700,
        ),
        InkWell(
          onTap:(){},
          child: Text('Rest Filter',
            style: Styles.textStyle18w600.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

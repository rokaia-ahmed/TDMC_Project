import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});
 final String error ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Align(
              alignment: Alignment.center,
              child: Text(error,
                style: Styles.textStyle16w700.copyWith(
                  color: AppColors.gryTextColor3,
                ),
              ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

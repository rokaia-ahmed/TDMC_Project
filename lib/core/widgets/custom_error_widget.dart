import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error,});
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

/// that no need expanded
class CustomError2 extends StatelessWidget {
  const CustomError2({super.key, required this.error,});
  final String error ;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class CustomError3 extends StatelessWidget {
  const CustomError3({super.key, required this.error,});
  final String error ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.17,
        ),
        Center(
          child: Text(error,
            style: Styles.textStyle16w700.copyWith(
              color: AppColors.gryTextColor3,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.17,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_constants.dart';
import '../utils/app_images.dart';
import '../utils/app_size.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: AppSize.padding(horizontal: 10, vertical: 10),
        decoration: AppConstants.boxDecoration,
        child: SvgPicture.asset(AppIcons.rightArrow),
      ),
    );
  }
}
